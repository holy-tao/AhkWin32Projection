#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import ".\CARD_FILE_INFO.ahk" { CARD_FILE_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_GET_FILE_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_GET_FILE_INFO) {
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
     * @param {Pointer<CARD_FILE_INFO>} pCardFileInfo 
     * @returns {Integer} 
     */
    Call(pCardData, pszDirectoryName, pszFileName, pCardFileInfo) {
        pszDirectoryName := pszDirectoryName is String ? StrPtr(pszDirectoryName) : pszDirectoryName
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", pszDirectoryName, "ptr", pszFileName, CARD_FILE_INFO.Ptr, pCardFileInfo, UInt32)
        return result
    }

    /**
     * A PFN_CARD_GET_FILE_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_GET_FILE_INFO {
        /**
         * Creates a PFN_CARD_GET_FILE_INFO pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PSTR, PSTR, CARD_FILE_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PSTR, PSTR, CARD_FILE_INFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
