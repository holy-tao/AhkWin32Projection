#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_WORK_ITEM.ahk" { NDIS_WORK_ITEM }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PROC_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is NDIS_PROC_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<NDIS_WORK_ITEM>} WorkItem 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(WorkItem, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, NDIS_WORK_ITEM.Ptr, WorkItem, _ContextMarshal, _Context)
    }

    /**
     * A NDIS_PROC_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NDIS_PROC_CALLBACK {
        /**
         * Creates a NDIS_PROC_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(NDIS_WORK_ITEM, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NDIS_WORK_ITEM.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
