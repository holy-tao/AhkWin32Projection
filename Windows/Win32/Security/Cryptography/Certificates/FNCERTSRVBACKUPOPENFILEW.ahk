#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNCERTSRVBACKUPOPENFILEW {
    value : IntPtr

    __value {
        set {
            if (value is FNCERTSRVBACKUPOPENFILEW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hbc 
     * @param {PWSTR} pwszAttachmentName 
     * @param {Integer} cbReadHintSize 
     * @param {Pointer<Integer>} pliFileSize 
     * @returns {HRESULT} 
     */
    Call(hbc, pwszAttachmentName, cbReadHintSize, pliFileSize) {
        pwszAttachmentName := pwszAttachmentName is String ? StrPtr(pwszAttachmentName) : pwszAttachmentName

        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        pliFileSizeMarshal := pliFileSize is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, hbcMarshal, hbc, "ptr", pwszAttachmentName, UInt32, cbReadHintSize, pliFileSizeMarshal, pliFileSize, "HRESULT")
        return result
    }

    /**
     * A FNCERTSRVBACKUPOPENFILEW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNCERTSRVBACKUPOPENFILEW {
        /**
         * Creates a FNCERTSRVBACKUPOPENFILEW pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR, UInt32, "int64*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, UInt32, "int64*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
