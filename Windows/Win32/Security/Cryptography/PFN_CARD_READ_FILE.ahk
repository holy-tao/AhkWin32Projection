#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_READ_FILE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_READ_FILE) {
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
     * @param {PSTR} pszFileName 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {Integer} 
     */
    Call(pCardData, pszDirectoryName, pszFileName, dwFlags, ppbData, pcbData) {
        pszDirectoryName := pszDirectoryName is String ? StrPtr(pszDirectoryName) : pszDirectoryName
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", pszDirectoryName, "ptr", pszFileName, UInt32, dwFlags, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, UInt32)
        return result
    }

    /**
     * A PFN_CARD_READ_FILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_READ_FILE {
        /**
         * Creates a PFN_CARD_READ_FILE pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PSTR, PSTR, UInt32, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PSTR, PSTR, UInt32, "ptr*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
