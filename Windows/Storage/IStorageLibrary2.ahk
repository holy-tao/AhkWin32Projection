#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\StorageLibraryChangeTracker.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageLibrary2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibrary2
     * @type {Guid}
     */
    static IID => Guid("{5b0ce348-fcb3-4031-afb0-a68d7bd44534}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeTracker"]

    /**
     * @type {StorageLibraryChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * 
     * @returns {StorageLibraryChangeTracker} 
     */
    get_ChangeTracker() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageLibraryChangeTracker(value)
    }
}
