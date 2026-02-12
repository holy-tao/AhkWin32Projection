#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PhotoImportItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportItemImportedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportItemImportedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{42cb2fdd-7d68-47b5-bc7c-ceb73e0c77dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ImportedItem"]

    /**
     * @type {PhotoImportItem} 
     */
    ImportedItem {
        get => this.get_ImportedItem()
    }

    /**
     * 
     * @returns {PhotoImportItem} 
     */
    get_ImportedItem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhotoImportItem(value)
    }
}
