#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_DISASM64 {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_DISASM64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} lpOffset 
     * @param {PSTR} lpBuffer 
     * @param {Integer} fShowEffectiveAddress 
     * @returns {Integer} 
     */
    Call(lpOffset, lpBuffer, fShowEffectiveAddress) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        lpOffsetMarshal := lpOffset is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, lpOffsetMarshal, lpOffset, "ptr", lpBuffer, UInt32, fShowEffectiveAddress, UInt32)
        return result
    }

    /**
     * A PWINDBG_DISASM64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_DISASM64 {
        /**
         * Creates a PWINDBG_DISASM64 pointer that invokes the given AHK function when called.
         * @param {Func("uint*", PSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", PSTR, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
