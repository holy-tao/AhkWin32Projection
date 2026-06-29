#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ITfRange.ahk" { ITfRange }
#Import ".\ITfLMLattice.ahk" { ITfLMLattice }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }

/**
 * The ITfFnAdviseText interface is implemented by a text service and used by the TSF manager to supply notifications when the text or lattice element in a context changes.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnadvisetext
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnAdviseText extends ITfFunction {
    /**
     * The interface identifier for ITfFnAdviseText
     * @type {Guid}
     */
    static IID := Guid("{3527268b-7d53-4dd9-92b7-7296ae461249}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnAdviseText interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        OnTextUpdate    : IntPtr
        OnLatticeUpdate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnAdviseText.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnAdviseText::OnTextUpdate method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that represents the range of text that has changed.
     * @param {PWSTR} pchText Pointer to a <b>WCHAR</b> buffer that contains the new text for the range.
     * @param {Integer} cch Specifies the number of characters contained in <i>pchText</i>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnadvisetext-ontextupdate
     */
    OnTextUpdate(pRange, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(4, this, "ptr", pRange, "ptr", pchText, "int", cch, "HRESULT")
        return result
    }

    /**
     * ITfFnAdviseText::OnLatticeUpdate method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that represents the range of text that changed.
     * @param {ITfLMLattice} pLattice Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-itflmlattice">ITfLMLattice</a> object that represents the new lattice element.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnadvisetext-onlatticeupdate
     */
    OnLatticeUpdate(pRange, pLattice) {
        result := ComCall(5, this, "ptr", pRange, "ptr", pLattice, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnAdviseText.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnTextUpdate := CallbackCreate(GetMethod(implObj, "OnTextUpdate"), flags, 4)
        this.vtbl.OnLatticeUpdate := CallbackCreate(GetMethod(implObj, "OnLatticeUpdate"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnTextUpdate)
        CallbackFree(this.vtbl.OnLatticeUpdate)
    }
}
