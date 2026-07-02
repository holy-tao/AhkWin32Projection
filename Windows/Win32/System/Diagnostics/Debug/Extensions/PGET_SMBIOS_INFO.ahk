#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_SMBIOS_INFO.ahk" { DEBUG_SMBIOS_INFO }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_SMBIOS_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PGET_SMBIOS_INFO) {
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
     * @param {Pointer<DEBUG_SMBIOS_INFO>} pSmbiosInfo 
     * @returns {HRESULT} 
     */
    Call(Client, pSmbiosInfo) {
        result := DllCall(this.value, "ptr", Client, DEBUG_SMBIOS_INFO.Ptr, pSmbiosInfo, "HRESULT")
        return result
    }

    /**
     * A PGET_SMBIOS_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_SMBIOS_INFO {
        /**
         * Creates a PGET_SMBIOS_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DEBUG_SMBIOS_INFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DEBUG_SMBIOS_INFO.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
