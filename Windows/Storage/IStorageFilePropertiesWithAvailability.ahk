#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to the [IsAvailable](istoragefilepropertieswithavailability_isavailable.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefilepropertieswithavailability
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageFilePropertiesWithAvailability extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFilePropertiesWithAvailability
     * @type {Guid}
     */
    static IID => Guid("{afcbbe9b-582b-4133-9648-e44ca46ee491}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAvailable"]

    /**
     * Indicates if the file is local, is cached locally, or can be downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefilepropertieswithavailability.isavailable
     * @type {Boolean} 
     */
    IsAvailable {
        get => this.get_IsAvailable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAvailable() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
