#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxServer interface describes a messaging collection that is used by a fax client application to manage a connection to the fax service.
 * @remarks
 * 
  * A default implementation of <b>IFaxServer</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxserver
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxServer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxServer
     * @type {Guid}
     */
    static IID => Guid("{475b6469-90a5-4878-a577-17a86e8e3462}")

    /**
     * The class identifier for FaxServer
     * @type {Guid}
     */
    static CLSID => Guid("{cda8acb0-8cf5-4f6c-9ba2-5931d40c8cae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "get_ServerName", "GetDeviceProviders", "GetDevices", "get_InboundRouting", "get_Folders", "get_LoggingOptions", "get_MajorVersion", "get_MinorVersion", "get_MajorBuild", "get_MinorBuild", "get_Debug", "get_Activity", "get_OutboundRouting", "get_ReceiptOptions", "get_Security", "Disconnect", "GetExtensionProperty", "SetExtensionProperty", "ListenToServerEvents", "RegisterDeviceProvider", "UnregisterDeviceProvider", "RegisterInboundRoutingExtension", "UnregisterInboundRoutingExtension", "get_RegisteredEvents", "get_APIVersion"]

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-connect
     */
    Connect(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(7, this, "ptr", bstrServerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrServerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_servername
     */
    get_ServerName(pbstrServerName) {
        result := ComCall(8, this, "ptr", pbstrServerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxDeviceProviders>} ppFaxDeviceProviders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-getdeviceproviders
     */
    GetDeviceProviders(ppFaxDeviceProviders) {
        result := ComCall(9, this, "ptr*", ppFaxDeviceProviders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxDevices>} ppFaxDevices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-getdevices
     */
    GetDevices(ppFaxDevices) {
        result := ComCall(10, this, "ptr*", ppFaxDevices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxInboundRouting>} ppFaxInboundRouting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_inboundrouting
     */
    get_InboundRouting(ppFaxInboundRouting) {
        result := ComCall(11, this, "ptr*", ppFaxInboundRouting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxFolders>} pFaxFolders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_folders
     */
    get_Folders(pFaxFolders) {
        result := ComCall(12, this, "ptr*", pFaxFolders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxLoggingOptions>} ppFaxLoggingOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_loggingoptions
     */
    get_LoggingOptions(ppFaxLoggingOptions) {
        result := ComCall(13, this, "ptr*", ppFaxLoggingOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_majorversion
     */
    get_MajorVersion(plMajorVersion) {
        plMajorVersionMarshal := plMajorVersion is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, plMajorVersionMarshal, plMajorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMinorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_minorversion
     */
    get_MinorVersion(plMinorVersion) {
        plMinorVersionMarshal := plMinorVersion is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plMinorVersionMarshal, plMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorBuild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_majorbuild
     */
    get_MajorBuild(plMajorBuild) {
        plMajorBuildMarshal := plMajorBuild is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, plMajorBuildMarshal, plMajorBuild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMinorBuild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_minorbuild
     */
    get_MinorBuild(plMinorBuild) {
        plMinorBuildMarshal := plMinorBuild is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, plMinorBuildMarshal, plMinorBuild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDebug 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_debug
     */
    get_Debug(pbDebug) {
        result := ComCall(18, this, "ptr", pbDebug, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxActivity>} ppFaxActivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_activity
     */
    get_Activity(ppFaxActivity) {
        result := ComCall(19, this, "ptr*", ppFaxActivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxOutboundRouting>} ppFaxOutboundRouting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_outboundrouting
     */
    get_OutboundRouting(ppFaxOutboundRouting) {
        result := ComCall(20, this, "ptr*", ppFaxOutboundRouting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxReceiptOptions>} ppFaxReceiptOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_receiptoptions
     */
    get_ReceiptOptions(ppFaxReceiptOptions) {
        result := ComCall(21, this, "ptr*", ppFaxReceiptOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxSecurity>} ppFaxSecurity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_security
     */
    get_Security(ppFaxSecurity) {
        result := ComCall(22, this, "ptr*", ppFaxSecurity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-disconnect
     */
    Disconnect() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {Pointer<VARIANT>} pvProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-getextensionproperty
     */
    GetExtensionProperty(bstrGUID, pvProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(24, this, "ptr", bstrGUID, "ptr", pvProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {VARIANT} vProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-setextensionproperty
     */
    SetExtensionProperty(bstrGUID, vProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(25, this, "ptr", bstrGUID, "ptr", vProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EventTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-listentoserverevents
     */
    ListenToServerEvents(EventTypes) {
        result := ComCall(26, this, "int", EventTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {BSTR} bstrFriendlyName 
     * @param {BSTR} bstrImageName 
     * @param {BSTR} TspName 
     * @param {Integer} lFSPIVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-registerdeviceprovider
     */
    RegisterDeviceProvider(bstrGUID, bstrFriendlyName, bstrImageName, TspName, lFSPIVersion) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName
        bstrImageName := bstrImageName is String ? BSTR.Alloc(bstrImageName).Value : bstrImageName
        TspName := TspName is String ? BSTR.Alloc(TspName).Value : TspName

        result := ComCall(27, this, "ptr", bstrGUID, "ptr", bstrFriendlyName, "ptr", bstrImageName, "ptr", TspName, "int", lFSPIVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUniqueName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-unregisterdeviceprovider
     */
    UnregisterDeviceProvider(bstrUniqueName) {
        bstrUniqueName := bstrUniqueName is String ? BSTR.Alloc(bstrUniqueName).Value : bstrUniqueName

        result := ComCall(28, this, "ptr", bstrUniqueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrExtensionName 
     * @param {BSTR} bstrFriendlyName 
     * @param {BSTR} bstrImageName 
     * @param {VARIANT} vMethods 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-registerinboundroutingextension
     */
    RegisterInboundRoutingExtension(bstrExtensionName, bstrFriendlyName, bstrImageName, vMethods) {
        bstrExtensionName := bstrExtensionName is String ? BSTR.Alloc(bstrExtensionName).Value : bstrExtensionName
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName
        bstrImageName := bstrImageName is String ? BSTR.Alloc(bstrImageName).Value : bstrImageName

        result := ComCall(29, this, "ptr", bstrExtensionName, "ptr", bstrFriendlyName, "ptr", bstrImageName, "ptr", vMethods, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrExtensionUniqueName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-unregisterinboundroutingextension
     */
    UnregisterInboundRoutingExtension(bstrExtensionUniqueName) {
        bstrExtensionUniqueName := bstrExtensionUniqueName is String ? BSTR.Alloc(bstrExtensionUniqueName).Value : bstrExtensionUniqueName

        result := ComCall(30, this, "ptr", bstrExtensionUniqueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pEventTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_registeredevents
     */
    get_RegisteredEvents(pEventTypes) {
        pEventTypesMarshal := pEventTypes is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pEventTypesMarshal, pEventTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAPIVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_apiversion
     */
    get_APIVersion(pAPIVersion) {
        pAPIVersionMarshal := pAPIVersion is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, pAPIVersionMarshal, pAPIVersion, "HRESULT")
        return result
    }
}
