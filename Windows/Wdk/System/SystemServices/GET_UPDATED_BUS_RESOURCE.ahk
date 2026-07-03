#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CM_RESOURCE_LIST.ahk" { CM_RESOURCE_LIST }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_UPDATED_BUS_RESOURCE {
    value : IntPtr

    __value {
        set {
            if (value is GET_UPDATED_BUS_RESOURCE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} UpdatedResourceList 
     * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} UpdatedTranslatedResourceList 
     * @returns {NTSTATUS} 
     */
    Call(_Context, UpdatedResourceList, UpdatedTranslatedResourceList) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        UpdatedResourceListMarshal := UpdatedResourceList is VarRef ? "ptr*" : "ptr"
        UpdatedTranslatedResourceListMarshal := UpdatedTranslatedResourceList is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UpdatedResourceListMarshal, UpdatedResourceList, UpdatedTranslatedResourceListMarshal, UpdatedTranslatedResourceList, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A GET_UPDATED_BUS_RESOURCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_UPDATED_BUS_RESOURCE {
        /**
         * Creates a GET_UPDATED_BUS_RESOURCE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr*", "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
