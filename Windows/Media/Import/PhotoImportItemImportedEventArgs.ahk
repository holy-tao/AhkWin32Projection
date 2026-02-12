#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportItemImportedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [PhotoImportFindItemsResult.ItemImported](photoimportfinditemsresult_itemimported.md) event.
 * @remarks
 * Get an instance of this class by handling the [PhotoImportFindItemsResult.ItemImported](photoimportfinditemsresult_itemimported.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitemimportedeventargs
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportItemImportedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportItemImportedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportItemImportedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the imported item associated with the [PhotoImportFindItemsResult.ItemImported](photoimportfinditemsresult_itemimported.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitemimportedeventargs.importeditem
     * @type {PhotoImportItem} 
     */
    ImportedItem {
        get => this.get_ImportedItem()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PhotoImportItem} 
     */
    get_ImportedItem() {
        if (!this.HasProp("__IPhotoImportItemImportedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhotoImportItemImportedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportItemImportedEventArgs := IPhotoImportItemImportedEventArgs(outPtr)
        }

        return this.__IPhotoImportItemImportedEventArgs.get_ImportedItem()
    }

;@endregion Instance Methods
}
