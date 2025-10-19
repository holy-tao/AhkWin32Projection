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

            throw TypeError(Format("Expected a(n) {1} but got a(n) {2}: {3}", errType.Prototype.__Class, Type(thrown), thrown.Message))
        }

        throw Error(Format("Expeted {1} to throw a(n) {2}, but nothing was thrown", 
            (callable.HasProp("Name") && callable.Name != "") ? callable.Name : "Anonymous " . Type(callable),
            errType.Prototype.__Class
        ))
    }

    /**
     * Assert that `obj` has a property named `propName` of type `propType`
     * @param {Object} obj 
     * @param {String} propName 
     * @param {Class} propType
     */
    static HasProp(obj, propName, propType){
        if(!obj.HasProp(propName)){
            throw Error(Format("Object of type '{1}' has no property named '{2}", Type(obj), propName))
        }

        if(!((val := obj.%propName%) is propType)){
            throw TypeError(Format("{1}.{2} is a(n) {3}, expected a(n) {4}", Type(obj), propName, Type(val), propType.Prototype.__Class))
        }
    }

    static IsType(obj, expected){
        if(!obj is expected){
            throw TypeError(Format("Expected a(n) {1} but got a(n) {2}", expected.Prototype.__Class, Type(obj)))
        }
    }

    static Equals(actual, expected){
        if(actual != expected){
            eStr := ((expected is Primitive) || HasMethod(expected, "ToString", 0))? String(expected) : Type(expected)
            aStr := ((actual is Primitive) || HasMethod(actual, "ToString", 0))? String(actual) : Type(actual)

            throw ValueError(Format("Expected {2} but got {1}", aStr, eStr), -1)
        }
    }
}