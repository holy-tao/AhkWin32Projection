#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderSyncRootInfo.ahk
#Include .\IStorageProviderSyncRootInfo2.ahk
#Include .\IStorageProviderSyncRootInfo3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the properties of a Cloud Storage Provider's sync root to be registered with the operating system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderSyncRootInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderSyncRootInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderSyncRootInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A unique identifier that distinguishes this sync root from other sync roots registered on the system. This identifier is used by the Windows storage provider framework to manage and track the sync root throughout its lifecycle.
     * @remarks
     * An example of an ID might look something like: "OneDrive!S-1-1234!Personal".
     * 
     * Note that the maximum allowed length for an ID is 174 characters. Setting a longer ID can result in an error (ERROR_INSUFFICIENT_BUFFER).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Contains the sync root identity information.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.context
     * @type {IBuffer} 
     */
    Context {
        get => this.get_Context()
        set => this.put_Context(value)
    }

    /**
     * A storage folder that represents the path to the root of the cloud based folder system.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.path
     * @type {IStorageFolder} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * An optional display name that maps to the existing sync root registration.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.displaynameresource
     * @type {HSTRING} 
     */
    DisplayNameResource {
        get => this.get_DisplayNameResource()
        set => this.put_DisplayNameResource(value)
    }

    /**
     * A path to an icon resource for the custom state of a file or folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.iconresource
     * @type {HSTRING} 
     */
    IconResource {
        get => this.get_IconResource()
        set => this.put_IconResource(value)
    }

    /**
     * The hydration policy of the sync root registration.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.hydrationpolicy
     * @type {Integer} 
     */
    HydrationPolicy {
        get => this.get_HydrationPolicy()
        set => this.put_HydrationPolicy(value)
    }

    /**
     * The hydration policy modifier of the sync root registration.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.hydrationpolicymodifier
     * @type {Integer} 
     */
    HydrationPolicyModifier {
        get => this.get_HydrationPolicyModifier()
        set => this.put_HydrationPolicyModifier(value)
    }

    /**
     * The population policy of the sync root registration.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.populationpolicy
     * @type {Integer} 
     */
    PopulationPolicy {
        get => this.get_PopulationPolicy()
        set => this.put_PopulationPolicy(value)
    }

    /**
     * Provides access to the sync policy for the Cloud Storage Provider.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.insyncpolicy
     * @type {Integer} 
     */
    InSyncPolicy {
        get => this.get_InSyncPolicy()
        set => this.put_InSyncPolicy(value)
    }

    /**
     * The hard link policy of the sync root.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.hardlinkpolicy
     * @type {Integer} 
     */
    HardlinkPolicy {
        get => this.get_HardlinkPolicy()
        set => this.put_HardlinkPolicy(value)
    }

    /**
     * Shows sibling sync roots listed under the main sync root in the File Explorer.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.showsiblingsasgroup
     * @type {Boolean} 
     */
    ShowSiblingsAsGroup {
        get => this.get_ShowSiblingsAsGroup()
        set => this.put_ShowSiblingsAsGroup(value)
    }

    /**
     * The version number of the sync root.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.version
     * @type {HSTRING} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * The protection mode of the sync root registration.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.protectionmode
     * @type {Integer} 
     */
    ProtectionMode {
        get => this.get_ProtectionMode()
        set => this.put_ProtectionMode(value)
    }

    /**
     * Enables or disables the ability for files to be made available offline.
     * @remarks
     * Pinning refers to a file being made available offline.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.allowpinning
     * @type {Boolean} 
     */
    AllowPinning {
        get => this.get_AllowPinning()
        set => this.put_AllowPinning(value)
    }

    /**
     * Gets the StorageProviderItemPropertyDefinition information for a sync root.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.storageprovideritempropertydefinitions
     * @type {IVector<StorageProviderItemPropertyDefinition>} 
     */
    StorageProviderItemPropertyDefinitions {
        get => this.get_StorageProviderItemPropertyDefinitions()
    }

    /**
     * A Uri to a cloud storage recycle bin.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.recyclebinuri
     * @type {Uri} 
     */
    RecycleBinUri {
        get => this.get_RecycleBinUri()
        set => this.put_RecycleBinUri(value)
    }

    /**
     * Gets or sets a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that represents the ID of the storage provider.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.providerid
     * @type {Guid} 
     */
    ProviderId {
        get => this.get_ProviderId()
        set => this.put_ProviderId(value)
    }

    /**
     * > [!NOTE]
     * > Scenarios for this API are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootinfo.fallbackfiletypeinfo
     * @type {IVector<StorageProviderFileTypeInfo>} 
     */
    FallbackFileTypeInfo {
        get => this.get_FallbackFileTypeInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * A StorageProviderSyncRootInfo default constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSyncRootInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_Id(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Context() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_Context()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Context(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_Context(value)
    }

    /**
     * 
     * @returns {IStorageFolder} 
     */
    get_Path() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_Path()
    }

    /**
     * 
     * @param {IStorageFolder} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_Path(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayNameResource() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_DisplayNameResource()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayNameResource(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_DisplayNameResource(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IconResource() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_IconResource()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IconResource(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_IconResource(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HydrationPolicy() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_HydrationPolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HydrationPolicy(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_HydrationPolicy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HydrationPolicyModifier() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_HydrationPolicyModifier()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HydrationPolicyModifier(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_HydrationPolicyModifier(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PopulationPolicy() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_PopulationPolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PopulationPolicy(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_PopulationPolicy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InSyncPolicy() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_InSyncPolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InSyncPolicy(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_InSyncPolicy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardlinkPolicy() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_HardlinkPolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HardlinkPolicy(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_HardlinkPolicy(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowSiblingsAsGroup() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_ShowSiblingsAsGroup()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowSiblingsAsGroup(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_ShowSiblingsAsGroup(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Version() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_Version()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Version(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_Version(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionMode() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_ProtectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProtectionMode(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_ProtectionMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowPinning() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_AllowPinning()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowPinning(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_AllowPinning(value)
    }

    /**
     * 
     * @returns {IVector<StorageProviderItemPropertyDefinition>} 
     */
    get_StorageProviderItemPropertyDefinitions() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_StorageProviderItemPropertyDefinitions()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RecycleBinUri() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.get_RecycleBinUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_RecycleBinUri(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo := IStorageProviderSyncRootInfo(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo.put_RecycleBinUri(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo2")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo2 := IStorageProviderSyncRootInfo2(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo2.get_ProviderId()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_ProviderId(value) {
        if (!this.HasProp("__IStorageProviderSyncRootInfo2")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo2 := IStorageProviderSyncRootInfo2(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo2.put_ProviderId(value)
    }

    /**
     * 
     * @returns {IVector<StorageProviderFileTypeInfo>} 
     */
    get_FallbackFileTypeInfo() {
        if (!this.HasProp("__IStorageProviderSyncRootInfo3")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSyncRootInfo3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSyncRootInfo3 := IStorageProviderSyncRootInfo3(outPtr)
        }

        return this.__IStorageProviderSyncRootInfo3.get_FallbackFileTypeInfo()
    }

;@endregion Instance Methods
}
