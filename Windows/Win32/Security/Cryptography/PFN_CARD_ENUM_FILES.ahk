#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_ENUM_FILES {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_ENUM_FILES) {
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
     * @param {Pointer<PSTR>} pmszFileNames 
     * @param {Pointer<Integer>} pdwcbFileName 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(pCardData, pszDirectoryName, pmszFileNames, pdwcbFileName, dwFlags) {
        pszDirectoryName := pszDirectoryName is String ? StrPtr(pszDirectoryName) : pszDirectoryName

        pmszFileNamesMarshal := pmszFileNames is VarRef ? "ptr*" : "ptr"
        pdwcbFileNameMarshal := pdwcbFileName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", pszDirectoryName, pmszFileNamesMarshal, pmszFileNames, pdwcbFileNameMarshal, pdwcbFileName, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PFN_CARD_ENUM_FILES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_ENUM_FILES {
        /**
         * Creates a PFN_CARD_ENUM_FILES pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PSTR, PSTR, "uint*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PSTR, PSTR.Ptr, "uint*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
