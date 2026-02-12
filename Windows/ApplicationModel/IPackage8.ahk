#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Storage\StorageFolder.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Storage\Streams\RandomAccessStreamReference.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include Core\AppListEntry.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackage8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackage8
     * @type {Guid}
     */
    static IID => Guid("{2c584f7b-ce2a-4be6-a093-77cfbb2a7ea1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EffectiveExternalLocation", "get_MachineExternalLocation", "get_UserExternalLocation", "get_InstalledPath", "get_MutablePath", "get_EffectivePath", "get_EffectiveExternalPath", "get_MachineExternalPath", "get_UserExternalPath", "GetLogoAsRandomAccessStreamReference", "GetAppListEntries", "get_IsStub"]

    /**
     * @type {StorageFolder} 
     */
    EffectiveExternalLocation {
        get => this.get_EffectiveExternalLocation()
    }

    /**
     * @type {StorageFolder} 
     */
    MachineExternalLocation {
        get => this.get_MachineExternalLocation()
    }

    /**
     * @type {StorageFolder} 
     */
    UserExternalLocation {
        get => this.get_UserExternalLocation()
    }

    /**
     * @type {HSTRING} 
     */
    InstalledPath {
        get => this.get_InstalledPath()
    }

    /**
     * @type {HSTRING} 
     */
    MutablePath {
        get => this.get_MutablePath()
    }

    /**
     * @type {HSTRING} 
     */
    EffectivePath {
        get => this.get_EffectivePath()
    }

    /**
     * @type {HSTRING} 
     */
    EffectiveExternalPath {
        get => this.get_EffectiveExternalPath()
    }

    /**
     * @type {HSTRING} 
     */
    MachineExternalPath {
        get => this.get_MachineExternalPath()
    }

    /**
     * @type {HSTRING} 
     */
    UserExternalPath {
        get => this.get_UserExternalPath()
    }

    /**
     * @type {Boolean} 
     */
    IsStub {
        get => this.get_IsStub()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_EffectiveExternalLocation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_MachineExternalLocation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_UserExternalLocation() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InstalledPath() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MutablePath() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EffectivePath() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EffectiveExternalPath() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MachineExternalPath() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserExternalPath() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} size_ 
     * @returns {RandomAccessStreamReference} 
     */
    GetLogoAsRandomAccessStreamReference(size_) {
        result := ComCall(15, this, "ptr", size_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RandomAccessStreamReference(result_)
    }

    /**
     * 
     * @returns {IVectorView<AppListEntry>} 
     */
    GetAppListEntries() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppListEntry, result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStub() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
