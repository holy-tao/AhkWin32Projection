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
     * The IFaxServer::Connect method connects a fax client application to the specified fax server.
     * @param {BSTR} bstrServerName Type: <b>BSTR</b>
     * 
     * A null-terminated string that specifies the name of the target fax server, such as "computername". If this parameter is <b>NULL</b> or an empty string, the method connects the application to the fax server on the local computer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-connect
     */
    Connect(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(7, this, "ptr", bstrServerName, "HRESULT")
        return result
    }

    /**
     * The IFaxServer::get_ServerName property retrieves the name of the active fax server to which the fax client is connected.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_servername
     */
    get_ServerName() {
        pbstrServerName := BSTR()
        result := ComCall(8, this, "ptr", pbstrServerName, "HRESULT")
        return pbstrServerName
    }

    /**
     * The IFaxServer::GetDeviceProviders method creates a IFaxDeviceProviders interface, a collection of fax service providers (FSPs) that are currently registered with the fax service.
     * @returns {IFaxDeviceProviders} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdeviceproviders">IFaxDeviceProviders</a>**</b>
     * 
     * An address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdeviceproviders">IFaxDeviceProviders</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-getdeviceproviders
     */
    GetDeviceProviders() {
        result := ComCall(9, this, "ptr*", &ppFaxDeviceProviders := 0, "HRESULT")
        return IFaxDeviceProviders(ppFaxDeviceProviders)
    }

    /**
     * The IFaxServer::GetDevices method creates a IFaxDevices interface, a collection of all the fax devices exposed by all the fax service providers (FSPs) currently registered with the fax service.
     * @returns {IFaxDevices} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdevices">IFaxDevices</a>**</b>
     * 
     * An address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdevices">IFaxDevices</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-getdevices
     */
    GetDevices() {
        result := ComCall(10, this, "ptr*", &ppFaxDevices := 0, "HRESULT")
        return IFaxDevices(ppFaxDevices)
    }

    /**
     * The IFaxServer::get_InboundRouting property creates a IFaxInboundRouting configuration interface. The interface permits access to an inbound fax routing extension and its methods.
     * @returns {IFaxInboundRouting} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_inboundrouting
     */
    get_InboundRouting() {
        result := ComCall(11, this, "ptr*", &ppFaxInboundRouting := 0, "HRESULT")
        return IFaxInboundRouting(ppFaxInboundRouting)
    }

    /**
     * The IFaxServer::get_Folders property accesses a IFaxFolders configuration interface. You can use the interface to access the folders, jobs, and messages on a connected fax server.
     * @returns {IFaxFolders} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_folders
     */
    get_Folders() {
        result := ComCall(12, this, "ptr*", &pFaxFolders := 0, "HRESULT")
        return IFaxFolders(pFaxFolders)
    }

    /**
     * The IFaxServer::get_LoggingOptions property creates a IFaxLoggingOptions configuration interface. The interface permits configuration of both the activity logging options and the event logging categories that the fax service uses.
     * @returns {IFaxLoggingOptions} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_loggingoptions
     */
    get_LoggingOptions() {
        result := ComCall(13, this, "ptr*", &ppFaxLoggingOptions := 0, "HRESULT")
        return IFaxLoggingOptions(ppFaxLoggingOptions)
    }

    /**
     * The IFaxServer::get_MajorVersion property is a value that specifies the major part of the version number for the fax service.
     * @remarks
     * 
     * The format for the fax service build number is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(14, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * The IFaxServer::get_MinorVersion property is a value that specifies the minor part of the version number for the fax service.
     * @remarks
     * 
     * The format for the fax service build number is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(15, this, "int*", &plMinorVersion := 0, "HRESULT")
        return plMinorVersion
    }

    /**
     * The IFaxServer::get_MajorBuild property is a value that specifies the major part of the build number for the fax service.
     * @remarks
     * 
     * The format for the fax service build number is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_majorbuild
     */
    get_MajorBuild() {
        result := ComCall(16, this, "int*", &plMajorBuild := 0, "HRESULT")
        return plMajorBuild
    }

    /**
     * The IFaxServer::get_MinorBuild property is a value that specifies the minor part of the build number for the fax service.
     * @remarks
     * 
     * The format for the fax service build number is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_minorbuild
     */
    get_MinorBuild() {
        result := ComCall(17, this, "int*", &plMinorBuild := 0, "HRESULT")
        return plMinorBuild
    }

    /**
     * The IFaxServer::get_Debug property is a Boolean value that indicates whether the fax server was created in a debug environment.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the fax server was created in a debug environment. If this property is equal to <b>FALSE</b>, the fax server was not created in a debug environment.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_debug
     */
    get_Debug() {
        result := ComCall(18, this, "short*", &pbDebug := 0, "HRESULT")
        return pbDebug
    }

    /**
     * The IFaxServer::get_Activity property creates a IFaxActivity interface object. The interface permits a fax client application to access information about the activity on a connected fax server, and the fax server status.
     * @returns {IFaxActivity} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_activity
     */
    get_Activity() {
        result := ComCall(19, this, "ptr*", &ppFaxActivity := 0, "HRESULT")
        return IFaxActivity(ppFaxActivity)
    }

    /**
     * The IFaxServer::get_OutboundRouting property creates a IFaxOutboundRouting configuration interface. The interface permits users to configure outbound routing groups and rules.
     * @remarks
     * 
     * This property is not supported in Windows XP, and will return the error: <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-error-codes">FAX_E_NOT_SUPPORTED_ON_THIS_SKU</a>.
     * 
     * 
     * @returns {IFaxOutboundRouting} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_outboundrouting
     */
    get_OutboundRouting() {
        result := ComCall(20, this, "ptr*", &ppFaxOutboundRouting := 0, "HRESULT")
        return IFaxOutboundRouting(ppFaxOutboundRouting)
    }

    /**
     * The IFaxServer::get_ReceiptOptions property creates a IFaxReceiptOptions configuration interface. The object permits a fax client application to set and retrieve the receipt configuration that the fax service uses to send fax receipts.
     * @returns {IFaxReceiptOptions} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_receiptoptions
     */
    get_ReceiptOptions() {
        result := ComCall(21, this, "ptr*", &ppFaxReceiptOptions := 0, "HRESULT")
        return IFaxReceiptOptions(ppFaxReceiptOptions)
    }

    /**
     * The IFaxServer::get_Security property creates a IFaxSecurity configuration interface. The interface permits the calling application to set and retrieve a security descriptor for the fax server.
     * @returns {IFaxSecurity} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_security
     */
    get_Security() {
        result := ComCall(22, this, "ptr*", &ppFaxSecurity := 0, "HRESULT")
        return IFaxSecurity(ppFaxSecurity)
    }

    /**
     * The IFaxServer::Disconnect method terminates a fax client application's connection to a fax server. The method fails if the client is not connected to an active fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-disconnect
     */
    Disconnect() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * The IFaxServer::GetExtensionProperty method retrieves an extension configuration property stored at the server level.
     * @param {BSTR} bstrGUID Type: [in] <b>BSTR</b>
     * 
     * Specifies a string GUID that uniquely identifies the data to be retrieved.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * Pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that specifies the data.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-getextensionproperty
     */
    GetExtensionProperty(bstrGUID) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        pvProperty := VARIANT()
        result := ComCall(24, this, "ptr", bstrGUID, "ptr", pvProperty, "HRESULT")
        return pvProperty
    }

    /**
     * The IFaxServer::SetExtensionProperty method stores an extension configuration property at the server level.
     * @param {BSTR} bstrGUID Type: <b>BSTR</b>
     * 
     * Specifies a string GUID that identifies the data to set.
     * @param {VARIANT} vProperty Type: <b>VARIANT</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that specifies the data to be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-setextensionproperty
     */
    SetExtensionProperty(bstrGUID, vProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(25, this, "ptr", bstrGUID, "ptr", vProperty, "HRESULT")
        return result
    }

    /**
     * The IFaxServer::ListenToServerEvents method registers the FaxServer object to receive notifications about one or more types of server events, or to stop these notifications.
     * @param {Integer} EventTypes Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">FAX_SERVER_EVENTS_TYPE_ENUM</a></b>
     * 
     * A value that contains a set of bit flags representing the types of events for which the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object is registering to receive notifications. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">FAX_SERVER_EVENTS_TYPE_ENUM</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-listentoserverevents
     */
    ListenToServerEvents(EventTypes) {
        result := ComCall(26, this, "int", EventTypes, "HRESULT")
        return result
    }

    /**
     * The IFaxServer::RegisterDeviceProvider method registers a fax service provider (FSP) with the fax service. Registration takes place after the fax service restarts.
     * @param {BSTR} bstrGUID Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains the GUID that uniquely identifies the FSP that is registering.
     * @param {BSTR} bstrFriendlyName Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains the user-friendly name to display for the FSP that is registering.
     * @param {BSTR} bstrImageName Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains the fully qualified path and file name of the FSPÂ DLL.
     * @param {BSTR} TspName Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains the name of the telephony service provider associated with the devices for the FSP.
     * @param {Integer} lFSPIVersion Type: <b>long</b>
     * 
     * A <b>long</b> value that indicates the version of the FSP. Should be equal to 0x00010000.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-registerdeviceprovider
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
     * The IFaxServer::UnregisterDeviceProvider method unregisters (removes the registration of) an existing device provider. Unregistration will take place only after the fax server is restarted.
     * @param {BSTR} bstrUniqueName Type: <b>BSTR</b>
     * 
     * Required. Specifies the unique name that identifies the FSP that is unregistering.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-unregisterdeviceprovider
     */
    UnregisterDeviceProvider(bstrUniqueName) {
        bstrUniqueName := bstrUniqueName is String ? BSTR.Alloc(bstrUniqueName).Value : bstrUniqueName

        result := ComCall(28, this, "ptr", bstrUniqueName, "HRESULT")
        return result
    }

    /**
     * The IFaxServer::RegisterInboundRoutingExtension method registers a fax inbound routing extension with the fax service. Registration takes place after the fax service restarts.
     * @param {BSTR} bstrExtensionName Type: <b>BSTR</b>
     * 
     * String that specifies the internal name of the fax routing extension DLL.
     * @param {BSTR} bstrFriendlyName Type: <b>BSTR</b>
     * 
     * String to associate with the fax routing extension DLL. This is the routing extension's user-friendly name, suitable for display.
     * @param {BSTR} bstrImageName Type: <b>BSTR</b>
     * 
     * String that specifies the full path and file name for the fax routing extension DLL. The path can include valid environment variables, for example, %SYSTEMDRIVE% and %SYSTEMROOT%.
     * @param {VARIANT} vMethods Type: <b>VARIANT</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that specifies a safearray of <b>BSTR</b>s. The array must be unidimensional, it cannot be empty, and it must have a lower limit of zero. Each item (string) in the array must identify a routing method. The string must have the following format: Method name; Friendly name; Function Name; Method GUID
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-registerinboundroutingextension
     */
    RegisterInboundRoutingExtension(bstrExtensionName, bstrFriendlyName, bstrImageName, vMethods) {
        bstrExtensionName := bstrExtensionName is String ? BSTR.Alloc(bstrExtensionName).Value : bstrExtensionName
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName
        bstrImageName := bstrImageName is String ? BSTR.Alloc(bstrImageName).Value : bstrImageName

        result := ComCall(29, this, "ptr", bstrExtensionName, "ptr", bstrFriendlyName, "ptr", bstrImageName, "ptr", vMethods, "HRESULT")
        return result
    }

    /**
     * The IFaxServer::UnregisterInboundRoutingExtension method unregisters an existing inbound routing extension. Unregistration will take place only after the fax server is restarted.
     * @param {BSTR} bstrExtensionUniqueName Type: <b>BSTR</b>
     * 
     * String value that specifies the internal name of the fax routing extension DLL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-unregisterinboundroutingextension
     */
    UnregisterInboundRoutingExtension(bstrExtensionUniqueName) {
        bstrExtensionUniqueName := bstrExtensionUniqueName is String ? BSTR.Alloc(bstrExtensionUniqueName).Value : bstrExtensionUniqueName

        result := ComCall(30, this, "ptr", bstrExtensionUniqueName, "HRESULT")
        return result
    }

    /**
     * The IFaxServer::get_RegisteredEvents property is a value from an enumeration that indicates the types of fax service events a client application is listening for.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_registeredevents
     */
    get_RegisteredEvents() {
        result := ComCall(31, this, "int*", &pEventTypes := 0, "HRESULT")
        return pEventTypes
    }

    /**
     * The IFaxServer::get_APIVersion property is a value that indicates the version of the fax server API.
     * @remarks
     * 
     * In general, each new version of the fax server API is fully compatible with previous API versions. When connecting to a fax server using the Component Object Model (COM) objects, the API version of the fax server is not required because the COM layer performs the conversions and mapping to transparently support the fax API version of the server. However, if you want to detect the version of the fax server you are connected to, you can use the <b>IFaxServer::get_APIVersion</b> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxserver-get_apiversion
     */
    get_APIVersion() {
        result := ComCall(32, this, "int*", &pAPIVersion := 0, "HRESULT")
        return pAPIVersion
    }
}
