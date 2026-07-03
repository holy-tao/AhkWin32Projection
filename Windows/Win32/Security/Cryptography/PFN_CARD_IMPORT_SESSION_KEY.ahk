#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_IMPORT_SESSION_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_IMPORT_SESSION_KEY) {
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
     * @param {Integer} bContainerIndex 
     * @param {Pointer<Void>} pPaddingInfo 
     * @param {PWSTR} pwszBlobType 
     * @param {PWSTR} pwszAlgId 
     * @param {Pointer<Pointer>} phKey 
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(pCardData, bContainerIndex, pPaddingInfo, pwszBlobType, pwszAlgId, phKey, pbInput, cbInput, dwFlags) {
        pwszBlobType := pwszBlobType is String ? StrPtr(pwszBlobType) : pwszBlobType
        pwszAlgId := pwszAlgId is String ? StrPtr(pwszAlgId) : pwszAlgId

        pPaddingInfoMarshal := pPaddingInfo is VarRef ? "ptr" : "ptr"
        phKeyMarshal := phKey is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, Int8, bContainerIndex, pPaddingInfoMarshal, pPaddingInfo, "ptr", pwszBlobType, "ptr", pwszAlgId, phKeyMarshal, phKey, IntPtr, pbInput, UInt32, cbInput, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PFN_CARD_IMPORT_SESSION_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_IMPORT_SESSION_KEY {
        /**
         * Creates a PFN_CARD_IMPORT_SESSION_KEY pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, Int8, "ptr", PWSTR, PWSTR, "ptr*", IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, Int8, "ptr", PWSTR, PWSTR, "ptr*", IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
