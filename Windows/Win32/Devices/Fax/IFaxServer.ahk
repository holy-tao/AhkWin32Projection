#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxDeviceProviders.ahk
#Include .\IFaxDevices.ahk
#Include .\IFaxInboundRouting.ahk
#Include .\IFaxFolders.ahk
#Include .\IFaxLoggingOptions.ahk
#Include .\IFaxActivity.ahk
#Include .\IFaxOutboundRouting.ahk
#Include .\IFaxReceiptOptions.ahk
#Include .\IFaxSecurity.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {BSTR} 
     */
    ServerName {
        get => this.get_ServerName()
    }

    /**
     * @type {IFaxInboundRouting} 
     */
    InboundRouting {
        get => this.get_InboundRouting()
    }

    /**
     * @type {IFaxFolders} 
     */
    Folders {
        get => this.get_Folders()
    }

    /**
     * @type {IFaxLoggingOptions} 
     */
    LoggingOptions {
        get => this.get_LoggingOptions()
    }

    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * @type {Integer} 
     */
    MajorBuild {
        get => this.get_MajorBuild()
    }

    /**
     * @type {Integer} 
     */
    MinorBuild {
        get => this.get_MinorBuild()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Debug {
        get => this.get_Debug()
    }

    /**
     * @type {IFaxActivity} 
     */
    Activity {
        get => this.get_Activity()
    }

    /**
     * @type {IFaxOutboundRouting} 
     */
    OutboundRouting {
        get => this.get_OutboundRouting()
    }

    /**
     * @type {IFaxReceiptOptions} 
     */
    ReceiptOptions {
        get => this.get_ReceiptOptions()
    }

    /**
     * @type {IFaxSecurity} 
     */
    Security {
        get => this.get_Security()
    }

    /**
     * @type {Integer} 
     */
    RegisteredEvents {
        get => this.get_RegisteredEvents()
    }

    /**
     * @type {Integer} 
     */
    APIVersion {
        get => this.get_APIVersion()
    }

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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_servername
     */
    get_ServerName() {
        pbstrServerName := BSTR()
        result := ComCall(8, this, "ptr", pbstrServerName, "HRESULT")
        return pbstrServerName
    }

    /**
     * 
     * @returns {IFaxDeviceProviders} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-getdeviceproviders
     */
    GetDeviceProviders() {
        result := ComCall(9, this, "ptr*", &ppFaxDeviceProviders := 0, "HRESULT")
        return IFaxDeviceProviders(ppFaxDeviceProviders)
    }

    /**
     * 
     * @returns {IFaxDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-getdevices
     */
    GetDevices() {
        result := ComCall(10, this, "ptr*", &ppFaxDevices := 0, "HRESULT")
        return IFaxDevices(ppFaxDevices)
    }

    /**
     * 
     * @returns {IFaxInboundRouting} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_inboundrouting
     */
    get_InboundRouting() {
        result := ComCall(11, this, "ptr*", &ppFaxInboundRouting := 0, "HRESULT")
        return IFaxInboundRouting(ppFaxInboundRouting)
    }

    /**
     * 
     * @returns {IFaxFolders} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_folders
     */
    get_Folders() {
        result := ComCall(12, this, "ptr*", &pFaxFolders := 0, "HRESULT")
        return IFaxFolders(pFaxFolders)
    }

    /**
     * 
     * @returns {IFaxLoggingOptions} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_loggingoptions
     */
    get_LoggingOptions() {
        result := ComCall(13, this, "ptr*", &ppFaxLoggingOptions := 0, "HRESULT")
        return IFaxLoggingOptions(ppFaxLoggingOptions)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(14, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(15, this, "int*", &plMinorVersion := 0, "HRESULT")
        return plMinorVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_majorbuild
     */
    get_MajorBuild() {
        result := ComCall(16, this, "int*", &plMajorBuild := 0, "HRESULT")
        return plMajorBuild
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_minorbuild
     */
    get_MinorBuild() {
        result := ComCall(17, this, "int*", &plMinorBuild := 0, "HRESULT")
        return plMinorBuild
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_debug
     */
    get_Debug() {
        result := ComCall(18, this, "short*", &pbDebug := 0, "HRESULT")
        return pbDebug
    }

    /**
     * 
     * @returns {IFaxActivity} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_activity
     */
    get_Activity() {
        result := ComCall(19, this, "ptr*", &ppFaxActivity := 0, "HRESULT")
        return IFaxActivity(ppFaxActivity)
    }

    /**
     * 
     * @returns {IFaxOutboundRouting} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_outboundrouting
     */
    get_OutboundRouting() {
        result := ComCall(20, this, "ptr*", &ppFaxOutboundRouting := 0, "HRESULT")
        return IFaxOutboundRouting(ppFaxOutboundRouting)
    }

    /**
     * 
     * @returns {IFaxReceiptOptions} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_receiptoptions
     */
    get_ReceiptOptions() {
        result := ComCall(21, this, "ptr*", &ppFaxReceiptOptions := 0, "HRESULT")
        return IFaxReceiptOptions(ppFaxReceiptOptions)
    }

    /**
     * 
     * @returns {IFaxSecurity} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_security
     */
    get_Security() {
        result := ComCall(22, this, "ptr*", &ppFaxSecurity := 0, "HRESULT")
        return IFaxSecurity(ppFaxSecurity)
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-getextensionproperty
     */
    GetExtensionProperty(bstrGUID) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        pvProperty := VARIANT()
        result := ComCall(24, this, "ptr", bstrGUID, "ptr", pvProperty, "HRESULT")
        return pvProperty
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_registeredevents
     */
    get_RegisteredEvents() {
        result := ComCall(31, this, "int*", &pEventTypes := 0, "HRESULT")
        return pEventTypes
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver-get_apiversion
     */
    get_APIVersion() {
        result := ComCall(32, this, "int*", &pAPIVersion := 0, "HRESULT")
        return pAPIVersion
    }
}
