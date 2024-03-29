package th.ac.chula.bsd.wheel

class Product {
	String prodName
	String prodDesc
	
	Product productPart
	int productPartAmount
	ProductType productType
	
	Set productStocks = []
	Set productVendorTransfers = []
	static hasMany = [
			productStocks: ProductStock,
			productVendorTransfers: ProductVendorTransfer
		]
	
	static constraints = {
		prodName blank: false
		prodDesc nullable: true
		productPart nullable: true
		productPartAmount nullable: true
	}
	
	String toString() {
		return this.prodName
	}
	
	public void initialProductWithBranch(String prodName, String prodDesc, Branch b){
		this.prodName = prodName
		this.prodDesc = prodDesc
		
		// initial stock
		ProductStock stock = new ProductStock()
		stock.initialProductStock(b, this)
		this.productStocks.add(stock)
	}
	
	public int getProductStock(Branch b) {
		int stock = -1
		Product prod = Product.get(this.id)
		def prodStock = prod.productStocks.find{it.branch.id == b.id}
		if(prodStock){
			stock = prodStock.stock
		}
		return stock
	}
	
	public int countVendor(Branch b){
		Product prod = Product.get(this.id)
		def vendorTLists = prod.productVendorTransfers.findAll{it -> it.branch.id == b.id && it.product.id == prod.id}
		return vendorTLists.size()
	}
	
	public int calPartUsage(int amount) {
		Product prod = Product.get(this.id)
		int partUsage = 0
		if(prod.productPart != null){
			partUsage = prod.productPartAmount * amount
		}
		return partUsage
	}
	
	public Double getProductUnitPrice(Branch b){
		Product prod = Product.get(this.id)
		def prodStock = prod.productStocks.find{it.branch.id == b.id}
		return prodStock.unitPrice
	}
	
	public static ProductType convertStringToProductType(String typeString){
		if(typeString == 'INSTALLATION'){
			return ProductType.INSTALLATION
		}else if(typeString == 'WHEEL'){
			return ProductType.WHEEL
		}else if(typeString == 'NUT'){
			return ProductType.NUT
		}else {
			return ProductType.WHEEL
		}
	}
}

enum ProductType {
	INSTALLATION,
	WHEEL,
	NUT
}

enum ProductTypeCreate{ // for product/view Only
	WHEEL,
	NUT
}