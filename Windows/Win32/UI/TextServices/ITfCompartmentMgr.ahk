#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfCompartment.ahk" { ITfCompartment }
#Import "..\..\System\Com\IEnumGUID.ahk" { IEnumGUID }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfCompartmentMgr interface is implemented by the TSF manager and used by clients (applications and text services) to obtain and manipulate TSF compartments.
 * @remarks
 * The set of compartments that this interface is responsible for depends upon how the interface was obtained. An instance of this interface can be obtained in one of the following ways. For more information, see <a href="https://docs.microsoft.com/windows/desktop/TSF/compartments">Compartments</a>.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-getglobalcompartment">ITfThreadMgr::GetGlobalCompartment
 *             </a> - Obtains the global compartment manager.</li>
 * <li><b>ITfThreadMgr::QueryInterface</b> with IID_ITfCompartmentMgr - Obtains the compartment manager for this specific thread manager.</li>
 * <li><b>ITfDocumentMgr::QueryInterface</b> with IID_ITfCompartmentMgr - Obtains the compartment manager for this specific document manager.</li>
 * <li><b>ITfContext::QueryInterface</b> with IID_ITfCompartmentMgr - Obtains the compartment manager for this specific context.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcompartmentmgr
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCompartmentMgr extends IUnknown {
    /**
     * The interface identifier for ITfCompartmentMgr
     * @type {Guid}
     */
    static IID := Guid("{7dcf57ac-18ad-438b-824d-979bffb74b7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCompartmentMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCompartment   : IntPtr
        ClearCompartment : IntPtr
        EnumCompartments : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCompartmentMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCompartmentMgr::GetCompartment method
     * @param {Pointer<Guid>} rguid Contains a GUID that identifies the compartment.
     * @returns {ITfCompartment} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompartment">ITfCompartment</a> interface pointer that receives the compartment object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompartmentmgr-getcompartment
     */
    GetCompartment(rguid) {
        result := ComCall(3, this, Guid.Ptr, rguid, "ptr*", &ppcomp := 0, "HRESULT")
        return ITfCompartment(ppcomp)
    }

    /**
     * ITfCompartmentMgr::ClearCompartment method
     * @param {Integer} tid Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that identifies the client.
     * @param {Pointer<Guid>} rguid Contains a GUID that identifies the compartment.
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
     * <dt><b>CONNECT_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The compartment cannot be found.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The owner must clear this compartment.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompartmentmgr-clearcompartment
     */
    ClearCompartment(tid, rguid) {
        result := ComCall(4, this, "uint", tid, Guid.Ptr, rguid, "HRESULT")
        return result
    }

    /**
     * The ITfCompartmentMgr::EnumCompartments method obtains an enumerator that contains the GUID of the compartments within the compartment manager.
     * @returns {IEnumGUID} Pointer to an <b>IEnumGUID</b> interface pointer that receives the enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompartmentmgr-enumcompartments
     */
    EnumCompartments() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }

    Query(iid) {
        if (ITfCompartmentMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCompartment := CallbackCreate(GetMethod(implObj, "GetCompartment"), flags, 3)
        this.vtbl.ClearCompartment := CallbackCreate(GetMethod(implObj, "ClearCompartment"), flags, 3)
        this.vtbl.EnumCompartments := CallbackCreate(GetMethod(implObj, "EnumCompartments"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCompartment)
        CallbackFree(this.vtbl.ClearCompartment)
        CallbackFree(this.vtbl.EnumCompartments)
    }
}
