#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Storage\StorageFolder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackage7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackage7
     * @type {Guid}
     */
    static IID => Guid("{86ff8d31-a2e4-45e0-9732-283a6d88fde1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MutableLocation", "get_EffectiveLocation"]

    /**
     * @type {StorageFolder} 
     */
    MutableLocation {
        get => this.get_MutableLocation()
    }

    /**
     * @type {StorageFolder} 
     */
    EffectiveLocation {
        get => this.get_EffectiveLocation()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_MutableLocation() {
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
    get_EffectiveLocation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }
}
