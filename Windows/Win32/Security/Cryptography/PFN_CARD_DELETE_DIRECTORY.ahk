#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_DELETE_DIRECTORY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_DELETE_DIRECTORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CARD_DATA>} pCardData 
     * @param {PSTR} pszDirectoryName 
     * @returns {Integer} 
     */
    Call(pCardData, pszDirectoryName) {
        pszDirectoryName := pszDirectoryName is String ? StrPtr(pszDirectoryName) : pszDirectoryName

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", pszDirectoryName, UInt32)
        return result
    }

    /**
     * A PFN_CARD_DELETE_DIRECTORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_DELETE_DIRECTORY {
        /**
         * Creates a PFN_CARD_DELETE_DIRECTORY pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
