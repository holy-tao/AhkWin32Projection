#Requires AutoHotkey v2.0

/**
 * Custom assertions for Yunit
 */
class Assert {

    /**
     * Assert that `callable` throws an object of type `errType`. This does not have to be an
     * Error, but it probably should
     * 
     * @param {Func () => Any} callable callable object that you expect to throw an error 
     * @param {Class} errType the type of the object you expect to be thrown. Probably something
     *          extending error 
     */
    static Throws(callable, errType){
        try{
            callable.Call()

        }
        catch Any as thrown{
            if(thrown is errType){
                return
            }

            throw TypeError(Format("Expected a(n) {1} but got a(n) {2}", callable.Prototype.__Class, Type(thrown)))
        }

        throw Error(Format("Expeted {1} to throw a(n) {2}, but nothing was thrown", 
            (callable.HasProp("Name") && callable.Name != "") ? callable.Name : "Anonymous " . Type(callable),
            errType.Prototype.__Class
        ))
    }

}