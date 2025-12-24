#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * The INSNetSourceCreator interface creates an administrative network source plug-in.
 * @see https://docs.microsoft.com/windows/win32/api//wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSNetSourceCreator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INSNetSourceCreator
     * @type {Guid}
     */
    static IID => Guid("{0c0e4080-9081-11d2-beec-0060082f2054}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "CreateNetSource", "GetNetSourceProperties", "GetNetSourceSharedNamespace", "GetNetSourceAdminInterface", "GetNumProtocolsSupported", "GetProtocolName", "Shutdown"]

    /**
     * The Initialize method prepares the network source creator for operations. You must call this method before calling any of the other methods in the INSNetSourceCreator interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmnetsourcecreator/nf-wmnetsourcecreator-insnetsourcecreator-initialize
     */
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
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
     * 
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
     * 
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
     * @see https://docs.microsoft.com/windows/win32/api//wmnetsourcecreator/nf-wmnetsourcecreator-insnetsourcecreator-getnetsourceadmininterface
     */
    GetNetSourceAdminInterface(pszStreamName) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        pVal := VARIANT()
        result := ComCall(7, this, "ptr", pszStreamName, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
     */
    GetNumProtocolsSupported() {
        result := ComCall(8, this, "uint*", &pcProtocols := 0, "HRESULT")
        return pcProtocols
    }

    /**
     * 
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
     * @see https://docs.microsoft.com/windows/win32/api//wmnetsourcecreator/nf-wmnetsourcecreator-insnetsourcecreator-shutdown
     */
    Shutdown() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
