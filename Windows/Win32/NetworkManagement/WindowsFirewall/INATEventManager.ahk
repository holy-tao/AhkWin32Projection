#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The INATEventManager interface provides methods for NAT applications with UPnP technology to register callback interfaces with the NAT. The system calls the methods in these interfaces when the configuration of the NAT changes.
 * @see https://learn.microsoft.com/windows/win32/api/natupnp/nn-natupnp-inateventmanager
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INATEventManager extends IDispatch {
    /**
     * The interface identifier for INATEventManager
     * @type {Guid}
     */
    static IID := Guid("{624bd588-9060-4109-b0b0-1adbbcac32df}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INATEventManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_ExternalIPAddressCallback : IntPtr
        put_NumberOfEntriesCallback   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INATEventManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    ExternalIPAddressCallback {
        set => this.put_ExternalIPAddressCallback(value)
    }

    /**
     * @type {IUnknown} 
     */
    NumberOfEntriesCallback {
        set => this.put_NumberOfEntriesCallback(value)
    }

    /**
     * The put_ExternalIPAddressCallback method enables the NAT application with UPnP technology to register a callback interface with the NAT. The system calls the first method in this callback interface if the external IP address of the NAT changes.
     * @remarks
     * The object referred to by <i>pUnk</i> must either support the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-inatexternalipaddresscallback">INATExternalIPAddressCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface. The NAT first queries <i>pUnk</i> for the 
     * <b>INATExternalIPAddressCallback</b> interface. If this interface is not supported, the NAT queries <i>pUnk</i> for the <b>IDispatch</b> interface. If the <b>IDispatch</b> interface is not supported, the <b>put_ExternalIPAddressCallback</b> method returns E_FAIL.
     * 
     * If only <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> is supported, the NAT invokes the callback by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a> with the dispatch ID specified as zero, which indicates the default method. This <b>IDispatch</b> method is passed the same parameters as the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-inatexternalipaddresscallback">INATExternalIPAddressCallback</a> method, except that the first parameter passed is a string that indicates the reason the callback is invoked.
     * @param {IUnknown} pUnk Pointer to an object that supports either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface or the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface. See the Remarks section for more information.
     * @returns {HRESULT} If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
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
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified method is not implemented.
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
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
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
     * The method failed for unknown reasons.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-inateventmanager-put_externalipaddresscallback
     */
    put_ExternalIPAddressCallback(pUnk) {
        result := ComCall(7, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * The put_NumberOfEntriesCallback method enables the NAT application with UPnP technology to register a callback interface with the NAT. The system calls the first method in this callback interface if the number of NAT port mappings changes.
     * @remarks
     * The object referred to by <i>pUnk</i> must either support the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-inatnumberofentriescallback">INATNumberOfEntriesCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface. The NAT first queries <i>pUnk</i> for the 
     * <b>INATNumberOfEntriesCallback</b> interface. If this interface is not supported, the NAT queries <i>pUnk</i> for the <b>IDispatch</b> interface. If the <b>IDispatch</b> interface is not supported, the <b>NumberOfEntriesCallback</b> method returns E_FAIL.
     * 
     * If only <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> is supported, the NAT invokes the callback by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a> with the dispatch ID specified as zero, which indicates the default method. This <b>IDispatch</b> method is passed the same parameters as the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-inatnumberofentriescallback">INATNumberOfEntriesCallback</a> method, except that the first parameter passed is a string that indicates the reason the callback is invoked.
     * @param {IUnknown} pUnk Pointer to an object that supports either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface or the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface. See the Remarks section for more information.
     * @returns {HRESULT} If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
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
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified method is not implemented.
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
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
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
     * The method failed for unknown reasons.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-inateventmanager-put_numberofentriescallback
     */
    put_NumberOfEntriesCallback(pUnk) {
        result := ComCall(8, this, "ptr", pUnk, "HRESULT")
        return result
    }

    Query(iid) {
        if (INATEventManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_ExternalIPAddressCallback := CallbackCreate(GetMethod(implObj, "put_ExternalIPAddressCallback"), flags, 2)
        this.vtbl.put_NumberOfEntriesCallback := CallbackCreate(GetMethod(implObj, "put_NumberOfEntriesCallback"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_ExternalIPAddressCallback)
        CallbackFree(this.vtbl.put_NumberOfEntriesCallback)
    }
}
