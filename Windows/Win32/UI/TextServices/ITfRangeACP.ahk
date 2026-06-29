#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITfRangeACP interface is implemented by the TSF manager and is used by an application character position (ACP)-based application to access and manipulate range objects.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfrangeacp
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfRangeACP extends ITfRange {
    /**
     * The interface identifier for ITfRangeACP
     * @type {Guid}
     */
    static IID := Guid("{057a6296-029b-4154-b79a-0d461d4ea94c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfRangeACP interfaces
    */
    struct Vtbl extends ITfRange.Vtbl {
        GetExtent : IntPtr
        SetExtent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfRangeACP.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfRangeACP::GetExtent method
     * @remarks
     * This method should only be called by the owner of the ACP-based context because the character position and range length will only have meaning to a caller that recognizes the text store implementation.
     * @param {Pointer<Integer>} pacpAnchor Pointer to a <b>LONG</b> value that receives the application character position of the range start anchor.
     * @param {Pointer<Integer>} pcch Pointer to a <b>LONG</b> value that receives the number of characters in the range.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrangeacp-getextent
     */
    GetExtent(pacpAnchor, pcch) {
        pacpAnchorMarshal := pacpAnchor is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pacpAnchorMarshal, pacpAnchor, pcchMarshal, pcch, "HRESULT")
        return result
    }

    /**
     * ITfRangeACP::SetExtent method
     * @remarks
     * This method should only be called by the owner of the ACP-based context because the character position and range length will only have meaning to a caller that recognizes the text store implementation.
     * @param {Integer} acpAnchor Contains the application character position of the range start anchor.
     * @param {Integer} cch Contains the number of characters in the range.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrangeacp-setextent
     */
    SetExtent(acpAnchor, cch) {
        result := ComCall(26, this, "int", acpAnchor, "int", cch, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfRangeACP.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExtent := CallbackCreate(GetMethod(implObj, "GetExtent"), flags, 3)
        this.vtbl.SetExtent := CallbackCreate(GetMethod(implObj, "SetExtent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExtent)
        CallbackFree(this.vtbl.SetExtent)
    }
}
