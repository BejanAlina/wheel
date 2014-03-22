package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MaxWheelColorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MaxWheelColor.list(params), model:[maxWheelColorInstanceCount: MaxWheelColor.count()]
    }

    def show(MaxWheelColor maxWheelColorInstance) {
        respond maxWheelColorInstance
    }

    def create() {
        respond new MaxWheelColor(params)
    }

    @Transactional
    def save(MaxWheelColor maxWheelColorInstance) {
        if (maxWheelColorInstance == null) {
            notFound()
            return
        }

        if (maxWheelColorInstance.hasErrors()) {
            respond maxWheelColorInstance.errors, view:'create'
            return
        }

        maxWheelColorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'maxWheelColorInstance.label', default: 'MaxWheelColor'), maxWheelColorInstance.id])
                redirect maxWheelColorInstance
            }
            '*' { respond maxWheelColorInstance, [status: CREATED] }
        }
    }

    def edit(MaxWheelColor maxWheelColorInstance) {
        respond maxWheelColorInstance
    }

    @Transactional
    def update(MaxWheelColor maxWheelColorInstance) {
        if (maxWheelColorInstance == null) {
            notFound()
            return
        }

        if (maxWheelColorInstance.hasErrors()) {
            respond maxWheelColorInstance.errors, view:'edit'
            return
        }

        maxWheelColorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MaxWheelColor.label', default: 'MaxWheelColor'), maxWheelColorInstance.id])
                redirect maxWheelColorInstance
            }
            '*'{ respond maxWheelColorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MaxWheelColor maxWheelColorInstance) {

        if (maxWheelColorInstance == null) {
            notFound()
            return
        }

        maxWheelColorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MaxWheelColor.label', default: 'MaxWheelColor'), maxWheelColorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'maxWheelColorInstance.label', default: 'MaxWheelColor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}