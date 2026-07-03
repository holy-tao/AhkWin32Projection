#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }
#Import ".\TARGET_DEBUG_INFO.ahk" { TARGET_DEBUG_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_TARGET_INFO {
    value : IntPtr

    __value {
        set {
            if (value is EXT_TARGET_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient4} Client 
     * @param {Pointer<TARGET_DEBUG_INFO>} pTargetInfo 
     * @returns {HRESULT} 
     */
    Call(Client, pTargetInfo) {
        result := DllCall(this.value, "ptr", Client, TARGET_DEBUG_INFO.Ptr, pTargetInfo, "HRESULT")
        return result
    }

    /**
     * A EXT_TARGET_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_TARGET_INFO {
        /**
         * Creates a EXT_TARGET_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", TARGET_DEBUG_INFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", TARGET_DEBUG_INFO.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
