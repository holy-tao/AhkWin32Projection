#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used by a cryptographic service provider (CSP) to verify the signature of a DLL.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/funcverifyimage
 * @namespace Windows.Win32.Security.Cryptography
 * @charset Unicode
 */
export default struct CRYPT_VERIFY_IMAGE_W {
    value : IntPtr

    __value {
        set {
            if (value is CRYPT_VERIFY_IMAGE_W) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} szImage 
     * @param {Pointer<Integer>} pbSigData The address of a buffer that contains the signature.
     * @returns {BOOL} Returns **TRUE** if the function succeeds, **FALSE** if it fails.
     */
    Call(szImage, pbSigData) {
        szImage := szImage is String ? StrPtr(szImage) : szImage

        pbSigDataMarshal := pbSigData is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, "ptr", szImage, pbSigDataMarshal, pbSigData, BOOL)
        return result
    }

    /**
     * A CRYPT_VERIFY_IMAGE_W that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CRYPT_VERIFY_IMAGE_W {
        /**
         * Creates a CRYPT_VERIFY_IMAGE_W pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "char*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "char*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
