#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWdsTransportNamespace.ahk
#Include .\IWdsTransportCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a namespace on a WDS transport server.
 * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespace
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportNamespace extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportNamespace
     * @type {Guid}
     */
    static IID => Guid("{fa561f57-fbef-4ed3-b056-127cb1b33b84}")

    /**
     * The class identifier for WdsTransportNamespace
     * @type {Guid}
     */
    static CLSID => Guid("{d8385768-0732-4ec1-95ea-16da581908a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Id", "get_Name", "put_Name", "get_FriendlyName", "put_FriendlyName", "get_Description", "put_Description", "get_ContentProvider", "put_ContentProvider", "get_Configuration", "put_Configuration", "get_Registered", "get_Tombstoned", "get_TombstoneTime", "get_TransmissionStarted", "Register", "Deregister", "Clone", "Refresh", "RetrieveContents"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    ContentProvider {
        get => this.get_ContentProvider()
        set => this.put_ContentProvider(value)
    }

    /**
     * @type {BSTR} 
     */
    Configuration {
        get => this.get_Configuration()
        set => this.put_Configuration(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Registered {
        get => this.get_Registered()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Tombstoned {
        get => this.get_Tombstoned()
    }

    /**
     * @type {Float} 
     */
    TombstoneTime {
        get => this.get_TombstoneTime()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    TransmissionStarted {
        get => this.get_TransmissionStarted()
    }

    /**
     * Enables an application to retrieve the type of the namespace for this object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_type
     */
    get_Type() {
        result := ComCall(7, this, "int*", &pType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pType
    }

    /**
     * Receives the unique namespace ID for a namespace that has been registered on the server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulId
    }

    /**
     * Sets or retrieves the name of the namespace. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_name
     */
    get_Name() {
        pbszName := BSTR()
        result := ComCall(9, this, "ptr", pbszName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbszName
    }

    /**
     * Sets or retrieves the name of the namespace. (Put)
     * @param {BSTR} bszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_name
     */
    put_Name(bszName) {
        if(bszName is String) {
            pin := BSTR.Alloc(bszName)
            bszName := pin.Value
        }

        result := ComCall(10, this, "ptr", bszName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves the user-friendly name of the namespace. (Get)
     * @remarks
     * This property is optional and can be set to an empty string.
     * 
     * 
     * This property cannot be set on a namespace that is or has been registered.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_friendlyname
     */
    get_FriendlyName() {
        pbszFriendlyName := BSTR()
        result := ComCall(11, this, "ptr", pbszFriendlyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbszFriendlyName
    }

    /**
     * Sets or retrieves the user-friendly name of the namespace. (Put)
     * @remarks
     * This property is optional and can be set to an empty string.
     * 
     * 
     * This property cannot be set on a namespace that is or has been registered.
     * @param {BSTR} bszFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_friendlyname
     */
    put_FriendlyName(bszFriendlyName) {
        if(bszFriendlyName is String) {
            pin := BSTR.Alloc(bszFriendlyName)
            bszFriendlyName := pin.Value
        }

        result := ComCall(12, this, "ptr", bszFriendlyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves the description of the namespace. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_description
     */
    get_Description() {
        pbszDescription := BSTR()
        result := ComCall(13, this, "ptr", pbszDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbszDescription
    }

    /**
     * Sets or retrieves the description of the namespace. (Put)
     * @param {BSTR} bszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_description
     */
    put_Description(bszDescription) {
        if(bszDescription is String) {
            pin := BSTR.Alloc(bszDescription)
            bszDescription := pin.Value
        }

        result := ComCall(14, this, "ptr", bszDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves the content provider for the namespace. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_contentprovider
     */
    get_ContentProvider() {
        pbszContentProvider := BSTR()
        result := ComCall(15, this, "ptr", pbszContentProvider, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbszContentProvider
    }

    /**
     * Sets or retrieves the content provider for the namespace. (Put)
     * @param {BSTR} bszContentProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_contentprovider
     */
    put_ContentProvider(bszContentProvider) {
        if(bszContentProvider is String) {
            pin := BSTR.Alloc(bszContentProvider)
            bszContentProvider := pin.Value
        }

        result := ComCall(16, this, "ptr", bszContentProvider, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves the configuration information for the content provider of the namespace. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_configuration
     */
    get_Configuration() {
        pbszConfiguration := BSTR()
        result := ComCall(17, this, "ptr", pbszConfiguration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbszConfiguration
    }

    /**
     * Sets or retrieves the configuration information for the content provider of the namespace. (Put)
     * @param {BSTR} bszConfiguration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_configuration
     */
    put_Configuration(bszConfiguration) {
        if(bszConfiguration is String) {
            pin := BSTR.Alloc(bszConfiguration)
            bszConfiguration := pin.Value
        }

        result := ComCall(18, this, "ptr", bszConfiguration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a value that indicates whether the namespace is registered on the server.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_registered
     */
    get_Registered() {
        result := ComCall(19, this, "short*", &pbRegistered := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbRegistered
    }

    /**
     * Returns a value that indicates whether the server has saved the namespace object of a deregistered namespace in memory until all active sessions are completed or terminated.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_tombstoned
     */
    get_Tombstoned() {
        result := ComCall(20, this, "short*", &pbTombstoned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbTombstoned
    }

    /**
     * Returns the UTC date and time when the server saved the namespace object of a deregistered namespace.
     * @remarks
     * If the namespace has not been deregistered, this property fails with an error that indicates that the namespace is not valid at this time.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_tombstonetime
     */
    get_TombstoneTime() {
        result := ComCall(21, this, "double*", &pTombstoneTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pTombstoneTime
    }

    /**
     * Receives a value that indicates whether the server has started transmitting data under this namespace.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_transmissionstarted
     */
    get_TransmissionStarted() {
        result := ComCall(22, this, "short*", &pbTransmissionStarted := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbTransmissionStarted
    }

    /**
     * Registers the namespace on the server.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-register
     */
    Register() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deregisters the namespace on the server.
     * @param {VARIANT_BOOL} bTerminateSessions A boolean value indicating if sessions should be terminated.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-deregister
     */
    Deregister(bTerminateSessions) {
        result := ComCall(24, this, "short", bTerminateSessions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Copies the information from this namespace object into a new, unregistered namespace object in memory.
     * @returns {IWdsTransportNamespace} An interface pointer to a new, unregistered copy of this namespace.
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-clone
     */
    Clone() {
        result := ComCall(25, this, "ptr*", &ppWdsTransportNamespaceClone := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWdsTransportNamespace(ppWdsTransportNamespaceClone)
    }

    /**
     * Resets the property values of the namespace with values from the server.
     * @remarks
     * The method fails if the namespace object has never been registered on the server.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-refresh
     */
    Refresh() {
        result := ComCall(26, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a collection of active transport content objects associated with the namespace.
     * @returns {IWdsTransportCollection} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcollection">IWdsTransportCollection</a> object that contains a collection of <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcontent">IWdsTransportContent</a> objects that represent active sessions under this namespace.
     * @see https://learn.microsoft.com/windows/win32/api//content/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-retrievecontents
     */
    RetrieveContents() {
        result := ComCall(27, this, "ptr*", &ppWdsTransportContents := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWdsTransportCollection(ppWdsTransportContents)
    }
}
