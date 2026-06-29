#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\WDSTRANSPORT_NAMESPACE_TYPE.ahk" { WDSTRANSPORT_NAMESPACE_TYPE }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IWdsTransportCollection.ahk" { IWdsTransportCollection }

/**
 * Represents a namespace on a WDS transport server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespace
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportNamespace extends IDispatch {
    /**
     * The interface identifier for IWdsTransportNamespace
     * @type {Guid}
     */
    static IID := Guid("{fa561f57-fbef-4ed3-b056-127cb1b33b84}")

    /**
     * The class identifier for WdsTransportNamespace
     * @type {Guid}
     */
    static CLSID := Guid("{d8385768-0732-4ec1-95ea-16da581908a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportNamespace interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type                : IntPtr
        get_Id                  : IntPtr
        get_Name                : IntPtr
        put_Name                : IntPtr
        get_FriendlyName        : IntPtr
        put_FriendlyName        : IntPtr
        get_Description         : IntPtr
        put_Description         : IntPtr
        get_ContentProvider     : IntPtr
        put_ContentProvider     : IntPtr
        get_Configuration       : IntPtr
        put_Configuration       : IntPtr
        get_Registered          : IntPtr
        get_Tombstoned          : IntPtr
        get_TombstoneTime       : IntPtr
        get_TransmissionStarted : IntPtr
        Register                : IntPtr
        Deregister              : IntPtr
        Clone                   : IntPtr
        Refresh                 : IntPtr
        RetrieveContents        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportNamespace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {WDSTRANSPORT_NAMESPACE_TYPE} 
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
     * @returns {WDSTRANSPORT_NAMESPACE_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_type
     */
    get_Type() {
        result := ComCall(7, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Receives the unique namespace ID for a namespace that has been registered on the server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * Sets or retrieves the name of the namespace. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_name
     */
    get_Name() {
        pbszName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbszName, "HRESULT")
        return pbszName
    }

    /**
     * Sets or retrieves the name of the namespace. (Put)
     * @param {BSTR} bszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_name
     */
    put_Name(bszName) {
        bszName := bszName is String ? BSTR.Alloc(bszName).Value : bszName

        result := ComCall(10, this, BSTR, bszName, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_friendlyname
     */
    get_FriendlyName() {
        pbszFriendlyName := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbszFriendlyName, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_friendlyname
     */
    put_FriendlyName(bszFriendlyName) {
        bszFriendlyName := bszFriendlyName is String ? BSTR.Alloc(bszFriendlyName).Value : bszFriendlyName

        result := ComCall(12, this, BSTR, bszFriendlyName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the description of the namespace. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_description
     */
    get_Description() {
        pbszDescription := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbszDescription, "HRESULT")
        return pbszDescription
    }

    /**
     * Sets or retrieves the description of the namespace. (Put)
     * @param {BSTR} bszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_description
     */
    put_Description(bszDescription) {
        bszDescription := bszDescription is String ? BSTR.Alloc(bszDescription).Value : bszDescription

        result := ComCall(14, this, BSTR, bszDescription, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the content provider for the namespace. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_contentprovider
     */
    get_ContentProvider() {
        pbszContentProvider := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbszContentProvider, "HRESULT")
        return pbszContentProvider
    }

    /**
     * Sets or retrieves the content provider for the namespace. (Put)
     * @param {BSTR} bszContentProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_contentprovider
     */
    put_ContentProvider(bszContentProvider) {
        bszContentProvider := bszContentProvider is String ? BSTR.Alloc(bszContentProvider).Value : bszContentProvider

        result := ComCall(16, this, BSTR, bszContentProvider, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the configuration information for the content provider of the namespace. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_configuration
     */
    get_Configuration() {
        pbszConfiguration := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbszConfiguration, "HRESULT")
        return pbszConfiguration
    }

    /**
     * Sets or retrieves the configuration information for the content provider of the namespace. (Put)
     * @param {BSTR} bszConfiguration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-put_configuration
     */
    put_Configuration(bszConfiguration) {
        bszConfiguration := bszConfiguration is String ? BSTR.Alloc(bszConfiguration).Value : bszConfiguration

        result := ComCall(18, this, BSTR, bszConfiguration, "HRESULT")
        return result
    }

    /**
     * Returns a value that indicates whether the namespace is registered on the server.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_registered
     */
    get_Registered() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &pbRegistered := 0, "HRESULT")
        return pbRegistered
    }

    /**
     * Returns a value that indicates whether the server has saved the namespace object of a deregistered namespace in memory until all active sessions are completed or terminated.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_tombstoned
     */
    get_Tombstoned() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &pbTombstoned := 0, "HRESULT")
        return pbTombstoned
    }

    /**
     * Returns the UTC date and time when the server saved the namespace object of a deregistered namespace.
     * @remarks
     * If the namespace has not been deregistered, this property fails with an error that indicates that the namespace is not valid at this time.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_tombstonetime
     */
    get_TombstoneTime() {
        result := ComCall(21, this, "double*", &pTombstoneTime := 0, "HRESULT")
        return pTombstoneTime
    }

    /**
     * Receives a value that indicates whether the server has started transmitting data under this namespace.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-get_transmissionstarted
     */
    get_TransmissionStarted() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &pbTransmissionStarted := 0, "HRESULT")
        return pbTransmissionStarted
    }

    /**
     * Registers the namespace on the server.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-register
     */
    Register() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Deregisters the namespace on the server.
     * @param {VARIANT_BOOL} bTerminateSessions A boolean value indicating if sessions should be terminated.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-deregister
     */
    Deregister(bTerminateSessions) {
        result := ComCall(24, this, VARIANT_BOOL, bTerminateSessions, "HRESULT")
        return result
    }

    /**
     * Copies the information from this namespace object into a new, unregistered namespace object in memory.
     * @returns {IWdsTransportNamespace} An interface pointer to a new, unregistered copy of this namespace.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-clone
     */
    Clone() {
        result := ComCall(25, this, "ptr*", &ppWdsTransportNamespaceClone := 0, "HRESULT")
        return IWdsTransportNamespace(ppWdsTransportNamespaceClone)
    }

    /**
     * Resets the property values of the namespace with values from the server.
     * @remarks
     * The method fails if the namespace object has never been registered on the server.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-refresh
     */
    Refresh() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of active transport content objects associated with the namespace.
     * @returns {IWdsTransportCollection} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcollection">IWdsTransportCollection</a> object that contains a collection of <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcontent">IWdsTransportContent</a> objects that represent active sessions under this namespace.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespace-retrievecontents
     */
    RetrieveContents() {
        result := ComCall(27, this, "ptr*", &ppWdsTransportContents := 0, "HRESULT")
        return IWdsTransportCollection(ppWdsTransportContents)
    }

    Query(iid) {
        if (IWdsTransportNamespace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_FriendlyName := CallbackCreate(GetMethod(implObj, "get_FriendlyName"), flags, 2)
        this.vtbl.put_FriendlyName := CallbackCreate(GetMethod(implObj, "put_FriendlyName"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_ContentProvider := CallbackCreate(GetMethod(implObj, "get_ContentProvider"), flags, 2)
        this.vtbl.put_ContentProvider := CallbackCreate(GetMethod(implObj, "put_ContentProvider"), flags, 2)
        this.vtbl.get_Configuration := CallbackCreate(GetMethod(implObj, "get_Configuration"), flags, 2)
        this.vtbl.put_Configuration := CallbackCreate(GetMethod(implObj, "put_Configuration"), flags, 2)
        this.vtbl.get_Registered := CallbackCreate(GetMethod(implObj, "get_Registered"), flags, 2)
        this.vtbl.get_Tombstoned := CallbackCreate(GetMethod(implObj, "get_Tombstoned"), flags, 2)
        this.vtbl.get_TombstoneTime := CallbackCreate(GetMethod(implObj, "get_TombstoneTime"), flags, 2)
        this.vtbl.get_TransmissionStarted := CallbackCreate(GetMethod(implObj, "get_TransmissionStarted"), flags, 2)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 1)
        this.vtbl.Deregister := CallbackCreate(GetMethod(implObj, "Deregister"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.RetrieveContents := CallbackCreate(GetMethod(implObj, "RetrieveContents"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_FriendlyName)
        CallbackFree(this.vtbl.put_FriendlyName)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_ContentProvider)
        CallbackFree(this.vtbl.put_ContentProvider)
        CallbackFree(this.vtbl.get_Configuration)
        CallbackFree(this.vtbl.put_Configuration)
        CallbackFree(this.vtbl.get_Registered)
        CallbackFree(this.vtbl.get_Tombstoned)
        CallbackFree(this.vtbl.get_TombstoneTime)
        CallbackFree(this.vtbl.get_TransmissionStarted)
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.Deregister)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.RetrieveContents)
    }
}
