#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }

/**
 * The ITfFnShowHelp interface is implemented by a text service to enable the language bar to place a help command for the text service in the language bar help menu.
 * @remarks
 * The TSF manager obtains this interface from the text service by calling the text service <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itffunctionprovider-getfunction">ITfFunctionProvider::GetFunction</a> interface with IID_ITfFnShowHelp.
 * 
 * The TSF manager obtains the help menu text by calling the text service's <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itffunction-getdisplayname">ITfFunction::GetDisplayName</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnshowhelp
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnShowHelp extends ITfFunction {
    /**
     * The interface identifier for ITfFnShowHelp
     * @type {Guid}
     */
    static IID := Guid("{5ab1d30c-094d-4c29-8ea5-0bf59be87bf3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnShowHelp interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        Show : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnShowHelp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnShowHelp::Show method
     * @remarks
     * The text service should not wait for the help UI to be complete before returning from this method.
     * @param {HWND} hwndParent Handle of the parent window. This value can be <b>NULL</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnshowhelp-show
     */
    Show(hwndParent) {
        result := ComCall(4, this, HWND, hwndParent, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnShowHelp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Show)
    }
}
