#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Class.ahk" { MI_Class }
#Import ".\MI_Result.ahk" { MI_Result }

/**
 * Used to provide requested class object during deserialization.
 * @see https://learn.microsoft.com/windows/win32/api/mi/nc-mi-mi_deserializer_classobjectneeded
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Deserializer_ClassObjectNeeded {
    value : IntPtr

    __value {
        set {
            if (value is MI_Deserializer_ClassObjectNeeded) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context A pointer to the context.
     * @param {Pointer<Integer>} serverName The name of the server.
     * @param {Pointer<Integer>} namespaceName The namespace of the object.
     * @param {Pointer<Integer>} className The class of the object.
     * @param {Pointer<Pointer<MI_Class>>} requestedClassObject A <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> representing the requested class object.
     * @returns {MI_Result} Returns a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ne-mi-mi_result">MI_Result</a> indicating the status of the operation.
     */
    Call(_context, serverName, namespaceName, className, requestedClassObject) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"
        serverNameMarshal := serverName is VarRef ? "ushort*" : "ptr"
        namespaceNameMarshal := namespaceName is VarRef ? "ushort*" : "ptr"
        classNameMarshal := className is VarRef ? "ushort*" : "ptr"
        requestedClassObjectMarshal := requestedClassObject is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, serverNameMarshal, serverName, namespaceNameMarshal, namespaceName, classNameMarshal, className, requestedClassObjectMarshal, requestedClassObject, MI_Result)
        return result
    }

    /**
     * A MI_Deserializer_ClassObjectNeeded that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_Deserializer_ClassObjectNeeded {
        /**
         * Creates a MI_Deserializer_ClassObjectNeeded pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ushort*", "ushort*", "ushort*", "ptr*") => MI_Result} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ushort*", "ushort*", "ushort*", "ptr*", MI_Result])
        }

        __Delete() => CallbackFree(this.value)
    }
}
