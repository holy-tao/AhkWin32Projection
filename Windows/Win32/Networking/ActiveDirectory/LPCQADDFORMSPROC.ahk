#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\CQFORM.ahk" { CQFORM }

/**
 * Called by a query form extension to add a form to the query dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nc-cmnquery-lpcqaddformsproc
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct LPCQADDFORMSPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPCQADDFORMSPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LPARAM} _lParam Contains a 32-bit value defined by the query handler. This value is passed to the query form extension as the <i>lParam</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nf-cmnquery-iqueryform-addforms">IQueryForm::AddForms</a> call.
     * @param {Pointer<CQFORM>} pForm Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/ns-cmnquery-cqform">CQFORM</a> structure that defines the form to add.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that indicates the success, or failure, of the form add operation. The following list lists possible return values.
     */
    Call(_lParam, pForm) {
        result := DllCall(this.value, LPARAM, _lParam, CQFORM.Ptr, pForm, "HRESULT")
        return result
    }

    /**
     * A LPCQADDFORMSPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPCQADDFORMSPROC {
        /**
         * Creates a LPCQADDFORMSPROC pointer that invokes the given AHK function when called.
         * @param {Func(LPARAM, CQFORM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPARAM, CQFORM.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
