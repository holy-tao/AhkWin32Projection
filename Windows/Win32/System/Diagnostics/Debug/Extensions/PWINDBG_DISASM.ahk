#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_DISASM {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_DISASM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer>} lpOffset 
     * @param {PSTR} lpBuffer 
     * @param {Integer} fShowEffectiveAddress 
     * @returns {Integer} 
     */
    Call(lpOffset, lpBuffer, fShowEffectiveAddress) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        lpOffsetMarshal := lpOffset is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, lpOffsetMarshal, lpOffset, "ptr", lpBuffer, UInt32, fShowEffectiveAddress, UInt32)
        return result
    }

    /**
     * A PWINDBG_DISASM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_DISASM {
        /**
         * Creates a PWINDBG_DISASM pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", PSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", PSTR, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
