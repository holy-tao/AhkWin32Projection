#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\HelperAttributeInfo.ahk" { HelperAttributeInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The INetDiagHelperInfo interface provides a method that is called by the Network Diagnostics Framework (NDF) when it needs to validate that it has the necessary information for a helper class and that it has chosen the correct helper class.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nn-ndhelper-inetdiaghelperinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct INetDiagHelperInfo extends IUnknown {
    /**
     * The interface identifier for INetDiagHelperInfo
     * @type {Guid}
     */
    static IID := Guid("{c0b35747-ebf5-11d8-bbe9-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetDiagHelperInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAttributeInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetDiagHelperInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetAttributeInfo method retrieves the list of key parameters needed by the Helper Class Extension.
     * @remarks
     * The key parameter list is used by NDF to determine whether enough information is available for the extension to perform diagnosis.  If the hypothesis to call the extension lacks a key attribute, the extension will not be called.  Optional attributes will not be returned by this call.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the array pointed to by <i>pprgAttributeInfos</i>.
     * @param {Pointer<Pointer<HelperAttributeInfo>>} pprgAttributeInfos A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-helperattributeinfo">HelperAttributeInfo</a> structures that contain helper class key parameters.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
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
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the diagnoses or repairs.
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelperinfo-getattributeinfo
     */
    GetAttributeInfo(pcelt, pprgAttributeInfos) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributeInfosMarshal := pprgAttributeInfos is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pceltMarshal, pcelt, pprgAttributeInfosMarshal, pprgAttributeInfos, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetDiagHelperInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAttributeInfo := CallbackCreate(GetMethod(implObj, "GetAttributeInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAttributeInfo)
    }
}
