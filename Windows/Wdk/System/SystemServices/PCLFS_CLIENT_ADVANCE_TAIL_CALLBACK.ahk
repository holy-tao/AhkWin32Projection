#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Storage\FileSystem\CLS_LSN.ahk" { CLS_LSN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCLFS_CLIENT_ADVANCE_TAIL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PCLFS_CLIENT_ADVANCE_TAIL_CALLBACK) {
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
     * @param {Pointer<CLS_LSN>} TargetLsn 
     * @param {Pointer<Void>} ClientData 
     * @returns {NTSTATUS} 
     */
    Call(LogFile, TargetLsn, ClientData) {
        ClientDataMarshal := ClientData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, FILE_OBJECT.Ptr, LogFile, CLS_LSN.Ptr, TargetLsn, ClientDataMarshal, ClientData, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PCLFS_CLIENT_ADVANCE_TAIL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLFS_CLIENT_ADVANCE_TAIL_CALLBACK {
        /**
         * Creates a PCLFS_CLIENT_ADVANCE_TAIL_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, CLS_LSN, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, CLS_LSN.Ptr, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
