#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCLFS_CLIENT_LOG_UNPINNED_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PCLFS_CLIENT_LOG_UNPINNED_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} LogFile 
     * @param {Pointer<Void>} ClientData 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(LogFile, ClientData) {
        ClientDataMarshal := ClientData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, FILE_OBJECT.Ptr, LogFile, ClientDataMarshal, ClientData)
    }

    /**
     * A PCLFS_CLIENT_LOG_UNPINNED_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLFS_CLIENT_LOG_UNPINNED_CALLBACK {
        /**
         * Creates a PCLFS_CLIENT_LOG_UNPINNED_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
