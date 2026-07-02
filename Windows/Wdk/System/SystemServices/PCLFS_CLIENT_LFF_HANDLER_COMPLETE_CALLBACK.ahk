#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCLFS_CLIENT_LFF_HANDLER_COMPLETE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PCLFS_CLIENT_LFF_HANDLER_COMPLETE_CALLBACK) {
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
     * @param {NTSTATUS} OperationStatus 
     * @param {BOOLEAN} LogIsPinned 
     * @param {Pointer<Void>} ClientData 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(LogFile, OperationStatus, LogIsPinned, ClientData) {
        ClientDataMarshal := ClientData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, FILE_OBJECT.Ptr, LogFile, NTSTATUS, OperationStatus, BOOLEAN, LogIsPinned, ClientDataMarshal, ClientData)
    }

    /**
     * A PCLFS_CLIENT_LFF_HANDLER_COMPLETE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLFS_CLIENT_LFF_HANDLER_COMPLETE_CALLBACK {
        /**
         * Creates a PCLFS_CLIENT_LFF_HANDLER_COMPLETE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, NTSTATUS, BOOLEAN, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, NTSTATUS, BOOLEAN, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
