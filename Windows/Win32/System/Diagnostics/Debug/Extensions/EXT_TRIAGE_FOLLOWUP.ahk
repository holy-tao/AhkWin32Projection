#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_TRIAGE_FOLLOWUP_INFO.ahk" { DEBUG_TRIAGE_FOLLOWUP_INFO }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_TRIAGE_FOLLOWUP {
    value : IntPtr

    __value {
        set {
            if (value is EXT_TRIAGE_FOLLOWUP) {
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
     * @param {PSTR} SymbolName 
     * @param {Pointer<DEBUG_TRIAGE_FOLLOWUP_INFO>} OwnerInfo 
     * @returns {Integer} 
     */
    Call(Client, SymbolName, OwnerInfo) {
        SymbolName := SymbolName is String ? StrPtr(SymbolName) : SymbolName

        result := DllCall(this.value, "ptr", Client, "ptr", SymbolName, DEBUG_TRIAGE_FOLLOWUP_INFO.Ptr, OwnerInfo, UInt32)
        return result
    }

    /**
     * A EXT_TRIAGE_FOLLOWUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_TRIAGE_FOLLOWUP {
        /**
         * Creates a EXT_TRIAGE_FOLLOWUP pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, DEBUG_TRIAGE_FOLLOWUP_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, DEBUG_TRIAGE_FOLLOWUP_INFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
