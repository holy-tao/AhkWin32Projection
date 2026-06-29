#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The INSNetSourceCreator interface creates an administrative network source plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct INSNetSourceCreator extends IUnknown {
    /**
     * The interface identifier for INSNetSourceCreator
     * @type {Guid}
     */
    static IID := Guid("{0c0e4080-9081-11d2-beec-0060082f2054}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INSNetSourceCreator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                  : IntPtr
        CreateNetSource             : IntPtr
        GetNetSourceProperties      : IntPtr
        GetNetSourceSharedNamespace : IntPtr
        GetNetSourceAdminInterface  : IntPtr
        GetNumProtocolsSupported    : IntPtr
        GetProtocolName             : IntPtr
        Shutdown                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INSNetSourceCreator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Initialize method prepares the network source creator for operations. You must call this method before calling any of the other methods in the INSNetSourceCreator interface.
     * @remarks
     * When you are finished using the network source creator, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/wmnetsourcecreator/nf-wmnetsourcecreator-insnetsourcecreator-shutdown">Shutdown</a> method to ensure that all resources are released properly.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
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
     * The method succeeded.
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
     * The method could not allocate memory for an internal resource.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nf-wmnetsourcecreator-insnetsourcecreator-initialize
     */
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The INSNetSourceCreator interface creates an administrative network source plug-in.
     * @param {PWSTR} pszStreamName 
     * @param {IUnknown} pMonitor 
     * @param {Pointer<Integer>} pData 
     * @param {IUnknown} pUserContext 
     * @param {IUnknown} pCallback 
     * @param {Integer} qwContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
     */
    CreateNetSource(pszStreamName, pMonitor, pData, pUserContext, pCallback, qwContext) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", pszStreamName, "ptr", pMonitor, pDataMarshal, pData, "ptr", pUserContext, "ptr", pCallback, "uint", qwContext, "HRESULT")
        return result
    }

    /**
     * The INSNetSourceCreator interface creates an administrative network source plug-in.
     * @param {PWSTR} pszStreamName 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
     */
    GetNetSourceProperties(pszStreamName) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        result := ComCall(5, this, "ptr", pszStreamName, "ptr*", &ppPropertiesNode := 0, "HRESULT")
        return IUnknown(ppPropertiesNode)
    }

    /**
     * The INSNetSourceCreator interface creates an administrative network source plug-in.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
     */
    GetNetSourceSharedNamespace() {
        result := ComCall(6, this, "ptr*", &ppSharedNamespace := 0, "HRESULT")
        return IUnknown(ppSharedNamespace)
    }

    /**
     * The GetNetSourceAdminInterface method retrieves a pointer to the IDispatch interface of the administrative network source object.
     * @param {PWSTR} pszStreamName Pointer to a wide-character <b>null</b>-terminated string containing the desired network protocol. Typically, this value is either "http\0" or "mms\0".
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the address of the <b>IDispatch</b> interface on successful return. Use this interface pointer to obtain the interface pointer of the desired network admin interface: <a href="https://docs.microsoft.com/windows/desktop/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource">IWMSInternalAdminNetSource</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource2">IWMSInternalAdminNetSource2</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource3">IWMSInternalAdminNetSource3</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nf-wmnetsourcecreator-insnetsourcecreator-getnetsourceadmininterface
     */
    GetNetSourceAdminInterface(pszStreamName) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        pVal := VARIANT()
        result := ComCall(7, this, "ptr", pszStreamName, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * The INSNetSourceCreator interface creates an administrative network source plug-in.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
     */
    GetNumProtocolsSupported() {
        result := ComCall(8, this, "uint*", &pcProtocols := 0, "HRESULT")
        return pcProtocols
    }

    /**
     * The INSNetSourceCreator interface creates an administrative network source plug-in.
     * @param {Integer} dwProtocolNum 
     * @param {PWSTR} pwszProtocolName 
     * @param {Pointer<Integer>} pcchProtocolName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
     */
    GetProtocolName(dwProtocolNum, pwszProtocolName, pcchProtocolName) {
        pwszProtocolName := pwszProtocolName is String ? StrPtr(pwszProtocolName) : pwszProtocolName

        pcchProtocolNameMarshal := pcchProtocolName is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, "uint", dwProtocolNum, "ptr", pwszProtocolName, pcchProtocolNameMarshal, pcchProtocolName, "HRESULT")
        return result
    }

    /**
     * The Shutdown method properly disposes of all allocated memory used by the network source creator. You must call this method when you are finished using the network source creator, to ensure that all resources are released.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nf-wmnetsourcecreator-insnetsourcecreator-shutdown
     */
    Shutdown() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (INSNetSourceCreator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 1)
        this.vtbl.CreateNetSource := CallbackCreate(GetMethod(implObj, "CreateNetSource"), flags, 7)
        this.vtbl.GetNetSourceProperties := CallbackCreate(GetMethod(implObj, "GetNetSourceProperties"), flags, 3)
        this.vtbl.GetNetSourceSharedNamespace := CallbackCreate(GetMethod(implObj, "GetNetSourceSharedNamespace"), flags, 2)
        this.vtbl.GetNetSourceAdminInterface := CallbackCreate(GetMethod(implObj, "GetNetSourceAdminInterface"), flags, 3)
        this.vtbl.GetNumProtocolsSupported := CallbackCreate(GetMethod(implObj, "GetNumProtocolsSupported"), flags, 2)
        this.vtbl.GetProtocolName := CallbackCreate(GetMethod(implObj, "GetProtocolName"), flags, 4)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.CreateNetSource)
        CallbackFree(this.vtbl.GetNetSourceProperties)
        CallbackFree(this.vtbl.GetNetSourceSharedNamespace)
        CallbackFree(this.vtbl.GetNetSourceAdminInterface)
        CallbackFree(this.vtbl.GetNumProtocolsSupported)
        CallbackFree(this.vtbl.GetProtocolName)
        CallbackFree(this.vtbl.Shutdown)
    }
}
