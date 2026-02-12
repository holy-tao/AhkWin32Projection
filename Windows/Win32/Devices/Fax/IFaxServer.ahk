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
 * The IFaxServer dual interface is used by a fax client application to manage a connection to the fax service.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * You should not implement this interface. The Microsoft standard implementation provides complete functionality.
 *             
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use the <b>IFaxServer</b> interface to connect to and disconnect from an active fax server. Also use the interface to retrieve and set the properties of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdoc">FaxServer</a> objects, and to create the objects listed in the following steps.
 * 			
 * 
 * To connect to a fax server, and create other fax client objects, perform the following steps:
 * 
 * <ol>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function to retrieve a pointer to an <b>IFaxServer</b> interface and create an instance of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver-client">FaxServer</a> object. </li>
 * <li>Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxserver-connect-client-vb">IFaxServer::Connect</a> method to initiate a connection with an active fax server. </li>
 * <li>After you obtain a connection, call the following methods to create the objects you need: 
 * <ul>
 * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxserver-getjobs-vb">IFaxServer::GetJobs</a> method to create a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxjobs">FaxJobs</a> object. Use this object to create <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxjob">FaxJob</a> objects and enumerate the fax jobs associated with a connected fax server. </li>
 * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxserver-getports-vb">IFaxServer::GetPorts</a> method to create a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxports">FaxPorts</a> object. Use this object to create <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxport">FaxPort</a> objects and enumerate fax port configuration information for a connection to a fax server. </li>
 * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxserver-createdocument-vb">IFaxServer::CreateDocument</a> method to create a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdoc">FaxDoc</a> object. Use this object to transmit a fax and to retrieve and set the properties of FaxDoc objects. </li>
 * </ul>
 * </li>
 * <li>Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxserver-disconnect-client-vb">IFaxServer::Disconnect</a> method to disconnect from the fax server.</li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method for each object to allow the object to deallocate itself. Call the method again, if necessary, to destroy the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcom/nn-faxcom-ifaxports">IFaxPorts</a> or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcom/nn-faxcom-ifaxjobs">IFaxJobs</a> interface pointers. </li>
 * </ol>
 * Note that a client application should not call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function to create <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxjobs">FaxJobs</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxports">FaxPorts</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdoc">FaxDoc</a> objects, or objects derived from these objects. For more information about creating and deallocating fax client objects, see the steps that are listed with each individual interface topic and the hierarchical diagram included in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-the-fax-client-object-model">The Fax Client Object Model</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcom/nn-faxcom-ifaxserver
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
     * The Connect method connects a fax client application to the specified fax server.
     * @remarks
     * The fax client application must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxserver-disconnect-client-vb">IFaxServer::Disconnect</a> method to disconnect from the fax server.
     * 
     * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-connecting-to-a-fax-server">Connecting to a Fax Server</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-disconnecting-from-a-fax-server">Disconnecting from a Fax Server</a>.
     * @param {BSTR} bstrServerName 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcom/nf-faxcom-ifaxserver-connect
     */
    Connect(bstrServerName) {
        if(bstrServerName is String) {
            pin := BSTR.Alloc(bstrServerName)
            bstrServerName := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrServerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxServer::get_ServerName property retrieves the name of the active fax server to which the fax client is connected.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_servername
     */
    get_ServerName() {
        pbstrServerName := BSTR()
        result := ComCall(8, this, "ptr", pbstrServerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrServerName
    }

    /**
     * The IFaxServer::GetDeviceProviders method creates a IFaxDeviceProviders interface, a collection of fax service providers (FSPs) that are currently registered with the fax service.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {IFaxDeviceProviders} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdeviceproviders">IFaxDeviceProviders</a>**</b>
     * 
     * An address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdeviceproviders">IFaxDeviceProviders</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-getdeviceproviders
     */
    GetDeviceProviders() {
        result := ComCall(9, this, "ptr*", &ppFaxDeviceProviders := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxDeviceProviders(ppFaxDeviceProviders)
    }

    /**
     * The IFaxServer::GetDevices method creates a IFaxDevices interface, a collection of all the fax devices exposed by all the fax service providers (FSPs) currently registered with the fax service.
     * @remarks
     * You can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdevices">IFaxDevices</a> interface to enumerate the fax devices associated with a connected fax server and to create <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdevice">IFaxDevice</a> interfaces for them.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {IFaxDevices} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdevices">IFaxDevices</a>**</b>
     * 
     * An address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdevices">IFaxDevices</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-getdevices
     */
    GetDevices() {
        result := ComCall(10, this, "ptr*", &ppFaxDevices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxDevices(ppFaxDevices)
    }

    /**
     * The IFaxServer::get_InboundRouting property creates a IFaxInboundRouting configuration interface. The interface permits access to an inbound fax routing extension and its methods.
     * @returns {IFaxInboundRouting} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_inboundrouting
     */
    get_InboundRouting() {
        result := ComCall(11, this, "ptr*", &ppFaxInboundRouting := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxInboundRouting(ppFaxInboundRouting)
    }

    /**
     * The IFaxServer::get_Folders property accesses a IFaxFolders configuration interface. You can use the interface to access the folders, jobs, and messages on a connected fax server.
     * @returns {IFaxFolders} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_folders
     */
    get_Folders() {
        result := ComCall(12, this, "ptr*", &pFaxFolders := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxFolders(pFaxFolders)
    }

    /**
     * The IFaxServer::get_LoggingOptions property creates a IFaxLoggingOptions configuration interface. The interface permits configuration of both the activity logging options and the event logging categories that the fax service uses.
     * @returns {IFaxLoggingOptions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_loggingoptions
     */
    get_LoggingOptions() {
        result := ComCall(13, this, "ptr*", &ppFaxLoggingOptions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxLoggingOptions(ppFaxLoggingOptions)
    }

    /**
     * The IFaxServer::get_MajorVersion property is a value that specifies the major part of the version number for the fax service.
     * @remarks
     * The format for the fax service build number is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(14, this, "int*", &plMajorVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plMajorVersion
    }

    /**
     * The IFaxServer::get_MinorVersion property is a value that specifies the minor part of the version number for the fax service.
     * @remarks
     * The format for the fax service build number is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(15, this, "int*", &plMinorVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plMinorVersion
    }

    /**
     * The IFaxServer::get_MajorBuild property is a value that specifies the major part of the build number for the fax service.
     * @remarks
     * The format for the fax service build number is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_majorbuild
     */
    get_MajorBuild() {
        result := ComCall(16, this, "int*", &plMajorBuild := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plMajorBuild
    }

    /**
     * The IFaxServer::get_MinorBuild property is a value that specifies the minor part of the build number for the fax service.
     * @remarks
     * The format for the fax service build number is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_minorbuild
     */
    get_MinorBuild() {
        result := ComCall(17, this, "int*", &plMinorBuild := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plMinorBuild
    }

    /**
     * The IFaxServer::get_Debug property is a Boolean value that indicates whether the fax server was created in a debug environment.
     * @remarks
     * If this property is equal to <b>TRUE</b>, the fax server was created in a debug environment. If this property is equal to <b>FALSE</b>, the fax server was not created in a debug environment.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_debug
     */
    get_Debug() {
        result := ComCall(18, this, "short*", &pbDebug := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbDebug
    }

    /**
     * The IFaxServer::get_Activity property creates a IFaxActivity interface object. The interface permits a fax client application to access information about the activity on a connected fax server, and the fax server status.
     * @returns {IFaxActivity} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_activity
     */
    get_Activity() {
        result := ComCall(19, this, "ptr*", &ppFaxActivity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxActivity(ppFaxActivity)
    }

    /**
     * The IFaxServer::get_OutboundRouting property creates a IFaxOutboundRouting configuration interface. The interface permits users to configure outbound routing groups and rules.
     * @remarks
     * This property is not supported in Windows XP, and will return the error: <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-error-codes">FAX_E_NOT_SUPPORTED_ON_THIS_SKU</a>.
     * @returns {IFaxOutboundRouting} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_outboundrouting
     */
    get_OutboundRouting() {
        result := ComCall(20, this, "ptr*", &ppFaxOutboundRouting := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxOutboundRouting(ppFaxOutboundRouting)
    }

    /**
     * The IFaxServer::get_ReceiptOptions property creates a IFaxReceiptOptions configuration interface. The object permits a fax client application to set and retrieve the receipt configuration that the fax service uses to send fax receipts.
     * @returns {IFaxReceiptOptions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_receiptoptions
     */
    get_ReceiptOptions() {
        result := ComCall(21, this, "ptr*", &ppFaxReceiptOptions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxReceiptOptions(ppFaxReceiptOptions)
    }

    /**
     * The IFaxServer::get_Security property creates a IFaxSecurity configuration interface. The interface permits the calling application to set and retrieve a security descriptor for the fax server.
     * @returns {IFaxSecurity} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_security
     */
    get_Security() {
        result := ComCall(22, this, "ptr*", &ppFaxSecurity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxSecurity(ppFaxSecurity)
    }

    /**
     * The IFaxServer::Disconnect method terminates a fax client application's connection to a fax server.
     * @remarks
     * A call to the <b>IFaxServer::Disconnect</b> method attempts to terminate a server connection made by a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxserver-connect-client-vb">IFaxServer::Connect</a> method.
     * 
     * In addition to calling the <b>IFaxServer::Disconnect</b> method, an application must also call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method to allow each object to deallocate itself.
     * 
     * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-connecting-to-a-fax-server">Connecting to a Fax Server</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-disconnecting-from-a-fax-server">Disconnecting from a Fax Server</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcom/nf-faxcom-ifaxserver-disconnect
     */
    Disconnect() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxServer::GetExtensionProperty method retrieves an extension configuration property stored at the server level.
     * @remarks
     * The returned data is a blob of bytes represented as a variant safe array of unsigned chars (VT_UI1 | VT_ARRAY). The data is only relevant to the specific extension that uses it. For more information see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-extension-configuration-api">About the Fax Extension Configuration API</a>.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {BSTR} bstrGUID Type: [in] <b>BSTR</b>
     * 
     * Specifies a string GUID that uniquely identifies the data to be retrieved.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * Pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that specifies the data.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-getextensionproperty
     */
    GetExtensionProperty(bstrGUID) {
        if(bstrGUID is String) {
            pin := BSTR.Alloc(bstrGUID)
            bstrGUID := pin.Value
        }

        pvProperty := VARIANT()
        result := ComCall(24, this, "ptr", bstrGUID, "ptr", pvProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvProperty
    }

    /**
     * The IFaxServer::SetExtensionProperty method stores an extension configuration property at the server level.
     * @remarks
     * The extension configuration property is a blob of bytes represented as a variant safe array of unsigned chars (VT_UI1 | VT_ARRAY). The data is only relevant to the specific extension that uses it. For more information see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-extension-configuration-api">About the Fax Extension Configuration API</a>.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @param {BSTR} bstrGUID Type: <b>BSTR</b>
     * 
     * Specifies a string GUID that identifies the data to set.
     * @param {VARIANT} vProperty Type: <b>VARIANT</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that specifies the data to be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-setextensionproperty
     */
    SetExtensionProperty(bstrGUID, vProperty) {
        if(bstrGUID is String) {
            pin := BSTR.Alloc(bstrGUID)
            bstrGUID := pin.Value
        }

        result := ComCall(25, this, "ptr", bstrGUID, "ptr", vProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxServer::ListenToServerEvents method registers the FaxServer object to receive notifications about one or more types of server events, or to stop these notifications.
     * @remarks
     * In Microsoft Visual Basic, if you want the fax server to receive notifications, you have to create the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object using the following syntax:
     * 
     * 
     * 
     * ```
     * 
     * Dim WithEvents objFaxServer As New FAXCOMEXLib.FaxServer
     * Set objFaxServer = CreateObject("FaxServer") 
     * 
     * ```
     * 
     * 
     * In Microsoft Visual C++, the <a href="https://docs.microsoft.com/windows/desktop/api/faxcomex/nn-faxcomex-ifaxservernotify2">IFaxServerNotify</a> interface on the <b>FaxServer</b> object receives notifications of the events.
     * 
     * 
     * By default, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object does not receive notifications for any server events. If you want the <b>FaxServer</b> object to receive notifications, you must call <b>IFaxServer::ListenToServerEvents</b> and pass to it the event types for which you want to receive notifications. To stop receiving the notification, call this method with <i>EventTypes</i> equal to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetNONE</a>.
     * 
     * Access rights for this method depend on which events are requested, as shown in the following table.
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <td>Event</td>
     * <td>Required access rights</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetINCOMING_CALL</a>
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetIN_QUEUE</a>
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a>
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetOUT_QUEUE</a>
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a>
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetCONFIG</a>
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetDEVICE_STATUS</a>
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetACTIVITY</a>
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetIN_ARCHIVE</a>
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT</a>
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">fsetOUT_ARCHIVE</a>
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a>
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_OUT_ARCHIVE</a>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} EventTypes Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">FAX_SERVER_EVENTS_TYPE_ENUM</a></b>
     * 
     * A value that contains a set of bit flags representing the types of events for which the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object is registering to receive notifications. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_server_events_type_enum">FAX_SERVER_EVENTS_TYPE_ENUM</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-listentoserverevents
     */
    ListenToServerEvents(EventTypes) {
        result := ComCall(26, this, "int", EventTypes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxServer::RegisterDeviceProvider method registers a fax service provider (FSP) with the fax service. Registration takes place after the fax service restarts.
     * @remarks
     * Only an administrator can register a FSP.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-registerdeviceprovider
     */
    RegisterDeviceProvider(bstrGUID, bstrFriendlyName, bstrImageName, TspName, lFSPIVersion) {
        if(bstrGUID is String) {
            pin := BSTR.Alloc(bstrGUID)
            bstrGUID := pin.Value
        }
        if(bstrFriendlyName is String) {
            pin := BSTR.Alloc(bstrFriendlyName)
            bstrFriendlyName := pin.Value
        }
        if(bstrImageName is String) {
            pin := BSTR.Alloc(bstrImageName)
            bstrImageName := pin.Value
        }
        if(TspName is String) {
            pin := BSTR.Alloc(TspName)
            TspName := pin.Value
        }

        result := ComCall(27, this, "ptr", bstrGUID, "ptr", bstrFriendlyName, "ptr", bstrImageName, "ptr", TspName, "int", lFSPIVersion, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxServer::UnregisterDeviceProvider method unregisters (removes the registration of) an existing device provider. Unregistration will take place only after the fax server is restarted.
     * @remarks
     * Only an administrator can unregister a fax service provider.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @param {BSTR} bstrUniqueName Type: <b>BSTR</b>
     * 
     * Required. Specifies the unique name that identifies the FSP that is unregistering.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-unregisterdeviceprovider
     */
    UnregisterDeviceProvider(bstrUniqueName) {
        if(bstrUniqueName is String) {
            pin := BSTR.Alloc(bstrUniqueName)
            bstrUniqueName := pin.Value
        }

        result := ComCall(28, this, "ptr", bstrUniqueName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxServer::RegisterInboundRoutingExtension method registers a fax inbound routing extension with the fax service. Registration takes place after the fax service restarts.
     * @remarks
     * Only an administrator can register a routing extension. Also, this method works only on the local fax server.
     * 
     * This property is not supported in Windows XP, and will return the error: <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-error-codes">FAX_E_NOT_SUPPORTED_ON_THIS_SKU</a>. 
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-registerinboundroutingextension
     */
    RegisterInboundRoutingExtension(bstrExtensionName, bstrFriendlyName, bstrImageName, vMethods) {
        if(bstrExtensionName is String) {
            pin := BSTR.Alloc(bstrExtensionName)
            bstrExtensionName := pin.Value
        }
        if(bstrFriendlyName is String) {
            pin := BSTR.Alloc(bstrFriendlyName)
            bstrFriendlyName := pin.Value
        }
        if(bstrImageName is String) {
            pin := BSTR.Alloc(bstrImageName)
            bstrImageName := pin.Value
        }

        result := ComCall(29, this, "ptr", bstrExtensionName, "ptr", bstrFriendlyName, "ptr", bstrImageName, "ptr", vMethods, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxServer::UnregisterInboundRoutingExtension method unregisters an existing inbound routing extension. Unregistration will take place only after the fax server is restarted.
     * @remarks
     * Only an administrator can unregister a routing extension. Also, this method works only on the local fax server.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @param {BSTR} bstrExtensionUniqueName Type: <b>BSTR</b>
     * 
     * String value that specifies the internal name of the fax routing extension DLL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-unregisterinboundroutingextension
     */
    UnregisterInboundRoutingExtension(bstrExtensionUniqueName) {
        if(bstrExtensionUniqueName is String) {
            pin := BSTR.Alloc(bstrExtensionUniqueName)
            bstrExtensionUniqueName := pin.Value
        }

        result := ComCall(30, this, "ptr", bstrExtensionUniqueName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxServer::get_RegisteredEvents property is a value from an enumeration that indicates the types of fax service events a client application is listening for.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_registeredevents
     */
    get_RegisteredEvents() {
        result := ComCall(31, this, "int*", &pEventTypes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pEventTypes
    }

    /**
     * The IFaxServer::get_APIVersion property is a value that indicates the version of the fax server API.
     * @remarks
     * In general, each new version of the fax server API is fully compatible with previous API versions. When connecting to a fax server using the Component Object Model (COM) objects, the API version of the fax server is not required because the COM layer performs the conversions and mapping to transparently support the fax API version of the server. However, if you want to detect the version of the fax server you are connected to, you can use the <b>IFaxServer::get_APIVersion</b> property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxserver-get_apiversion
     */
    get_APIVersion() {
        result := ComCall(32, this, "int*", &pAPIVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pAPIVersion
    }
}
