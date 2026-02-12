#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Streams\IBuffer.ahk
#Include ..\IStorageFolder.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\StorageProviderItemPropertyDefinition.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSyncRootInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSyncRootInfo
     * @type {Guid}
     */
    static IID => Guid("{7c1305c4-99f9-41ac-8904-ab055d654926}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "put_Id", "get_Context", "put_Context", "get_Path", "put_Path", "get_DisplayNameResource", "put_DisplayNameResource", "get_IconResource", "put_IconResource", "get_HydrationPolicy", "put_HydrationPolicy", "get_HydrationPolicyModifier", "put_HydrationPolicyModifier", "get_PopulationPolicy", "put_PopulationPolicy", "get_InSyncPolicy", "put_InSyncPolicy", "get_HardlinkPolicy", "put_HardlinkPolicy", "get_ShowSiblingsAsGroup", "put_ShowSiblingsAsGroup", "get_Version", "put_Version", "get_ProtectionMode", "put_ProtectionMode", "get_AllowPinning", "put_AllowPinning", "get_StorageProviderItemPropertyDefinitions", "get_RecycleBinUri", "put_RecycleBinUri"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * @type {IBuffer} 
     */
    Context {
        get => this.get_Context()
        set => this.put_Context(value)
    }

    /**
     * @type {IStorageFolder} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {HSTRING} 
     */
    DisplayNameResource {
        get => this.get_DisplayNameResource()
        set => this.put_DisplayNameResource(value)
    }

    /**
     * @type {HSTRING} 
     */
    IconResource {
        get => this.get_IconResource()
        set => this.put_IconResource(value)
    }

    /**
     * @type {Integer} 
     */
    HydrationPolicy {
        get => this.get_HydrationPolicy()
        set => this.put_HydrationPolicy(value)
    }

    /**
     * @type {Integer} 
     */
    HydrationPolicyModifier {
        get => this.get_HydrationPolicyModifier()
        set => this.put_HydrationPolicyModifier(value)
    }

    /**
     * @type {Integer} 
     */
    PopulationPolicy {
        get => this.get_PopulationPolicy()
        set => this.put_PopulationPolicy(value)
    }

    /**
     * @type {Integer} 
     */
    InSyncPolicy {
        get => this.get_InSyncPolicy()
        set => this.put_InSyncPolicy(value)
    }

    /**
     * @type {Integer} 
     */
    HardlinkPolicy {
        get => this.get_HardlinkPolicy()
        set => this.put_HardlinkPolicy(value)
    }

    /**
     * @type {Boolean} 
     */
    ShowSiblingsAsGroup {
        get => this.get_ShowSiblingsAsGroup()
        set => this.put_ShowSiblingsAsGroup(value)
    }

    /**
     * @type {HSTRING} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * @type {Integer} 
     */
    ProtectionMode {
        get => this.get_ProtectionMode()
        set => this.put_ProtectionMode(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowPinning {
        get => this.get_AllowPinning()
        set => this.put_AllowPinning(value)
    }

    /**
     * @type {IVector<StorageProviderItemPropertyDefinition>} 
     */
    StorageProviderItemPropertyDefinitions {
        get => this.get_StorageProviderItemPropertyDefinitions()
    }

    /**
     * @type {Uri} 
     */
    RecycleBinUri {
        get => this.get_RecycleBinUri()
        set => this.put_RecycleBinUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Context() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Context(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IStorageFolder} 
     */
    get_Path() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageFolder(value)
    }

    /**
     * 
     * @param {IStorageFolder} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayNameResource() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayNameResource(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IconResource() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IconResource(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HydrationPolicy() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HydrationPolicy(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HydrationPolicyModifier() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HydrationPolicyModifier(value) {
        result := ComCall(19, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PopulationPolicy() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PopulationPolicy(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InSyncPolicy() {
        result := ComCall(22, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InSyncPolicy(value) {
        result := ComCall(23, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardlinkPolicy() {
        result := ComCall(24, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HardlinkPolicy(value) {
        result := ComCall(25, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowSiblingsAsGroup() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowSiblingsAsGroup(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Version() {
        value := HSTRING()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Version(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionMode() {
        result := ComCall(30, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProtectionMode(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowPinning() {
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowPinning(value) {
        result := ComCall(33, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<StorageProviderItemPropertyDefinition>} 
     */
    get_StorageProviderItemPropertyDefinitions() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(StorageProviderItemPropertyDefinition, value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RecycleBinUri() {
        result := ComCall(35, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_RecycleBinUri(value) {
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
