#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DPASTREAMINFO.ahk" { DPASTREAMINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IStream.ahk" { IStream }

/**
 * Defines the prototype for the callback function used by DPA_LoadStream and DPA_SaveStream.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nc-dpa_dsa-pfndpastream
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PFNDPASTREAM {
    value : IntPtr

    __value {
        set {
            if (value is PFNDPASTREAM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DPASTREAMINFO>} pinfo Type: <b>DPASTREAMINFO*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/ns-dpa_dsa-dpastreaminfo">DPASTREAMINFO</a> structure.
     * @param {IStream} pstream Type: <b>struct IStream*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object to read from or write to.
     * @param {Pointer<Void>} pvInstData Type: <b>void*</b>
     * 
     * A void pointer to callback data that the client passed to <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nf-dpa_dsa-dpa_loadstream">DPA_LoadStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nf-dpa_dsa-dpa_savestream">DPA_SaveStream</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(pinfo, pstream, pvInstData) {
        pvInstDataMarshal := pvInstData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DPASTREAMINFO.Ptr, pinfo, "ptr", pstream, pvInstDataMarshal, pvInstData, "HRESULT")
        return result
    }

    /**
     * A PFNDPASTREAM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDPASTREAM {
        /**
         * Creates a PFNDPASTREAM pointer that invokes the given AHK function when called.
         * @param {Func(DPASTREAMINFO, "ptr", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DPASTREAMINFO.Ptr, "ptr", "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
