#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfComposition interface is implemented by the TSF manager and is used by a text service to obtain data about and terminate a composition. An instance of this interface is provided by the ITfContextComposition::StartComposition method.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcomposition
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfComposition extends IUnknown {
    /**
     * The interface identifier for ITfComposition
     * @type {Guid}
     */
    static IID := Guid("{20168d64-5a8f-4a5a-b7bd-cfa29f4d0fd9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfComposition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRange       : IntPtr
        ShiftStart     : IntPtr
        ShiftEnd       : IntPtr
        EndComposition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfComposition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfComposition::GetRange method
     * @returns {ITfRange} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcomposition">ITfRange</a> interface pointer that receives the range object. It is possible that the range will have zero length.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcomposition-getrange
     */
    GetRange() {
        result := ComCall(3, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRange(ppRange)
    }

    /**
     * ITfComposition::ShiftStart method
     * @remarks
     * This method causes the GUID_PROP_COMPOSING property to be removed from any text removed from the composition. Likewise, the GUID_PROP_COMPOSING property will also be added to any text added to the composition.
     * @param {Integer} ecWrite Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pNewStart Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the new start anchor position. The start anchor of the context will be moved to the start anchor of this range. This method fails if the start anchor of this range is positioned beyond the end anchor of the composition.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * The start anchor of <i>pNewStart</i> is positioned past the end anchor of the composition or <i>pNewStart</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The composition has already terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ecWrite</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcomposition-shiftstart
     */
    ShiftStart(ecWrite, pNewStart) {
        result := ComCall(4, this, "uint", ecWrite, "ptr", pNewStart, "HRESULT")
        return result
    }

    /**
     * ITfComposition::ShiftEnd method
     * @remarks
     * This method causes the GUID_PROP_COMPOSING property to be removed from any text removed from the composition. Likewise, the GUID_PROP_COMPOSING property is also added to any text added to the composition.
     * @param {Integer} ecWrite Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pNewEnd Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the new end anchor position. The end anchor of the context will be moved to the end anchor of this range. This method fails if the end anchor of this range is positioned prior to the start anchor of the composition.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * The end anchor of <i>pNewEnd</i> is positioned prior to the start anchor of the composition or <i>pNewStart</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The composition has already terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ecWrite</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcomposition-shiftend
     */
    ShiftEnd(ecWrite, pNewEnd) {
        result := ComCall(5, this, "uint", ecWrite, "ptr", pNewEnd, "HRESULT")
        return result
    }

    /**
     * ITfComposition::EndComposition method
     * @remarks
     * This method does not release the composition object, but the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcomposition">ITfComposition</a> methods will fail with E_UNEXPECTED after this method is called.
     * 
     * Context owners should use the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontextownercompositionservices-terminatecomposition">ITFContextOwnerCompositionServices::TerminateComposition</a> method to terminate a composition.
     * 
     * This method causes the GUID_PROP_COMPOSING property to be removed from the text covered by the composition.
     * @param {Integer} ecWrite Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value results when:
     * 
     * <ul>
     * <li>The composition terminated.</li>
     * <li>The caller is inside another composition write operation.</li>
     * <li>The caller does not own the composition.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ecWrite</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcomposition-endcomposition
     */
    EndComposition(ecWrite) {
        result := ComCall(6, this, "uint", ecWrite, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfComposition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRange := CallbackCreate(GetMethod(implObj, "GetRange"), flags, 2)
        this.vtbl.ShiftStart := CallbackCreate(GetMethod(implObj, "ShiftStart"), flags, 3)
        this.vtbl.ShiftEnd := CallbackCreate(GetMethod(implObj, "ShiftEnd"), flags, 3)
        this.vtbl.EndComposition := CallbackCreate(GetMethod(implObj, "EndComposition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRange)
        CallbackFree(this.vtbl.ShiftStart)
        CallbackFree(this.vtbl.ShiftEnd)
        CallbackFree(this.vtbl.EndComposition)
    }
}
