#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Called for each sorted context entry when a context is created.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_create_context_sort_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_CREATE_CONTEXT_SORT_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_CREATE_CONTEXT_SORT_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cbTotalEncoded The total number of bytes of the encoded entries.
     * @param {Integer} cbRemainEncoded The number of bytes remaining to be encoded.
     * @param {Integer} cEntry The current number of sorted entries.
     * @param {Pointer<Void>} pvSort An application-defined value that is passed in the <b>pvSort</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_create_context_para">CERT_CREATE_CONTEXT_PARA</a> structure.
     * @returns {BOOL} Return <b>TRUE</b> to continue the sort or <b>FALSE</b> to stop the sort. If <b>FALSE</b> is returned, <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecontext">CertCreateContext</a> will fail and set the last error code to <b>ERROR_CANCELLED</b>.
     */
    Call(cbTotalEncoded, cbRemainEncoded, cEntry, pvSort) {
        pvSortMarshal := pvSort is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, cbTotalEncoded, UInt32, cbRemainEncoded, UInt32, cEntry, pvSortMarshal, pvSort, BOOL)
        return result
    }

    /**
     * A PFN_CERT_CREATE_CONTEXT_SORT_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_CREATE_CONTEXT_SORT_FUNC {
        /**
         * Creates a PFN_CERT_CREATE_CONTEXT_SORT_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
