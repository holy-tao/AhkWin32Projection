#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import ".\CARD_FILE_ACCESS_CONDITION.ahk" { CARD_FILE_ACCESS_CONDITION }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_CREATE_FILE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_CREATE_FILE) {
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
     * @param {Integer} cbInitialCreationSize 
     * @param {CARD_FILE_ACCESS_CONDITION} AccessCondition 
     * @returns {Integer} 
     */
    Call(pCardData, pszDirectoryName, pszFileName, cbInitialCreationSize, AccessCondition) {
        pszDirectoryName := pszDirectoryName is String ? StrPtr(pszDirectoryName) : pszDirectoryName
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", pszDirectoryName, "ptr", pszFileName, UInt32, cbInitialCreationSize, CARD_FILE_ACCESS_CONDITION, AccessCondition, UInt32)
        return result
    }

    /**
     * A PFN_CARD_CREATE_FILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_CREATE_FILE {
        /**
         * Creates a PFN_CARD_CREATE_FILE pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PSTR, PSTR, UInt32, CARD_FILE_ACCESS_CONDITION) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PSTR, PSTR, UInt32, CARD_FILE_ACCESS_CONDITION, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
