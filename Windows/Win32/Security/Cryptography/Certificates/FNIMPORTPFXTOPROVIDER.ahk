#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ImportPFXFlags.ahk" { ImportPFXFlags }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNIMPORTPFXTOPROVIDER {
    value : IntPtr

    __value {
        set {
            if (value is FNIMPORTPFXTOPROVIDER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Integer} pbPFX 
     * @param {Integer} cbPFX 
     * @param {ImportPFXFlags} ImportFlags 
     * @param {PWSTR} pwszPassword 
     * @param {PWSTR} pwszProviderName 
     * @param {PWSTR} pwszReaderName 
     * @param {PWSTR} pwszContainerNamePrefix 
     * @param {PWSTR} pwszPin 
     * @param {PWSTR} pwszFriendlyName 
     * @param {Pointer<Integer>} pcCertOut 
     * @param {Pointer<Pointer<Pointer<CERT_CONTEXT>>>} prgpCertOut 
     * @returns {HRESULT} 
     */
    Call(hWndParent, pbPFX, cbPFX, ImportFlags, pwszPassword, pwszProviderName, pwszReaderName, pwszContainerNamePrefix, pwszPin, pwszFriendlyName, pcCertOut, prgpCertOut) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword
        pwszProviderName := pwszProviderName is String ? StrPtr(pwszProviderName) : pwszProviderName
        pwszReaderName := pwszReaderName is String ? StrPtr(pwszReaderName) : pwszReaderName
        pwszContainerNamePrefix := pwszContainerNamePrefix is String ? StrPtr(pwszContainerNamePrefix) : pwszContainerNamePrefix
        pwszPin := pwszPin is String ? StrPtr(pwszPin) : pwszPin
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        pcCertOutMarshal := pcCertOut is VarRef ? "uint*" : "ptr"
        prgpCertOutMarshal := prgpCertOut is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HWND, hWndParent, IntPtr, pbPFX, UInt32, cbPFX, ImportPFXFlags, ImportFlags, "ptr", pwszPassword, "ptr", pwszProviderName, "ptr", pwszReaderName, "ptr", pwszContainerNamePrefix, "ptr", pwszPin, "ptr", pwszFriendlyName, pcCertOutMarshal, pcCertOut, prgpCertOutMarshal, prgpCertOut, "HRESULT")
        return result
    }

    /**
     * A FNIMPORTPFXTOPROVIDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNIMPORTPFXTOPROVIDER {
        /**
         * Creates a FNIMPORTPFXTOPROVIDER pointer that invokes the given AHK function when called.
         * @param {Func(HWND, IntPtr, UInt32, ImportPFXFlags, PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, "uint*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 12)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 12 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, IntPtr, UInt32, ImportPFXFlags, PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, "uint*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
