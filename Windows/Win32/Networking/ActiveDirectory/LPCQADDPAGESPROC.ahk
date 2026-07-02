#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\CQPAGE.ahk" { CQPAGE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Called by a query form extension to add a page to a query form in the query dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nc-cmnquery-lpcqaddpagesproc
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct LPCQADDPAGESPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPCQADDPAGESPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LPARAM} _lParam Contains a 32-bit value defined by the query handler. This value is passed to the query form extension as the <i>lParam</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nf-cmnquery-iqueryform-addpages">IQueryForm::AddPages</a> call.
     * @param {Pointer<Guid>} clsidForm Contains the <b>CLSID</b> of the form that the page should be added to. This member can contain the <b>CLSID</b> of a custom query form or one of the system-supplied forms defined for the <b>clsidDefaultForm</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/ns-cmnquery-openquerywindow">OPENQUERYWINDOW</a> structure.
     * @param {Pointer<CQPAGE>} pPage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/ns-cmnquery-cqpage">CQPAGE</a> structure that defines the page to be added.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that indicates the success or failure of the page add operation. The following list lists possible return values.
     */
    Call(_lParam, clsidForm, pPage) {
        result := DllCall(this.value, LPARAM, _lParam, Guid.Ptr, clsidForm, CQPAGE.Ptr, pPage, "HRESULT")
        return result
    }

    /**
     * A LPCQADDPAGESPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPCQADDPAGESPROC {
        /**
         * Creates a LPCQADDPAGESPROC pointer that invokes the given AHK function when called.
         * @param {Func(LPARAM, Guid, CQPAGE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPARAM, Guid.Ptr, CQPAGE.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
