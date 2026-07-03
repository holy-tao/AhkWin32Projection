#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct fnDebugFailureAnalysisCreateInstance {
    value : IntPtr

    __value {
        set {
            if (value is fnDebugFailureAnalysisCreateInstance) {
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
     * @param {PWSTR} Args 
     * @param {Integer} Flags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Call(Client, Args, Flags, rclsid, riid) {
        Args := Args is String ? StrPtr(Args) : Args

        result := DllCall(this.value, "ptr", Client, "ptr", Args, UInt32, Flags, Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * A fnDebugFailureAnalysisCreateInstance that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends fnDebugFailureAnalysisCreateInstance {
        /**
         * Creates a fnDebugFailureAnalysisCreateInstance pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR, UInt32, Guid, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, UInt32, Guid.Ptr, Guid.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
