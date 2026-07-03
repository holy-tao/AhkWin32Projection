#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }
#Import ".\KDEXT_FILELOCK_OWNER.ahk" { KDEXT_FILELOCK_OWNER }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PFIND_FILELOCK_OWNERINFO {
    value : IntPtr

    __value {
        set {
            if (value is PFIND_FILELOCK_OWNERINFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Pointer<KDEXT_FILELOCK_OWNER>} pFileLockOwner 
     * @returns {HRESULT} 
     */
    Call(Client, pFileLockOwner) {
        result := DllCall(this.value, "ptr", Client, KDEXT_FILELOCK_OWNER.Ptr, pFileLockOwner, "HRESULT")
        return result
    }

    /**
     * A PFIND_FILELOCK_OWNERINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFIND_FILELOCK_OWNERINFO {
        /**
         * Creates a PFIND_FILELOCK_OWNERINFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", KDEXT_FILELOCK_OWNER) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", KDEXT_FILELOCK_OWNER.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
