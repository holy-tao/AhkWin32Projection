#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * The CertStoreProvControl callback function supports the CertControlStore API. All of the API's parameters are passed straight through to the callback. For details, see CertControlStore.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_control
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_CONTROL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCERTSTOREPROV} hStoreProv <b>HCERTSTOREPROV</b> handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> passed from the call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcontrolstore">CertControlStore</a>.
     * @param {Integer} dwFlags Passed from the call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcontrolstore">CertControlStore</a>.
     * @param {Integer} dwCtrlType Control action to be taken. Passed from the call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcontrolstore">CertControlStore</a>.
     * @param {Pointer<Void>} pvCtrlPara A pointer to a buffer whose structure and content is determined by the values of <i>dwFlags</i> and <i>dwCtrlType</i>. Passed from the call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcontrolstore">CertControlStore</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds or <b>FALSE</b> if it fails.
     */
    Call(hStoreProv, dwFlags, dwCtrlType, pvCtrlPara) {
        pvCtrlParaMarshal := pvCtrlPara is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, UInt32, dwFlags, UInt32, dwCtrlType, pvCtrlParaMarshal, pvCtrlPara, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_CONTROL {
        /**
         * Creates a PFN_CERT_STORE_PROV_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, UInt32, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, UInt32, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
