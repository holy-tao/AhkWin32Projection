#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportSelectionChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [PhotoImportFindItemsResult.SelectionChanged](photoimportfinditemsresult_selectionchanged.md) event.
 * @remarks
 * Get an instance of this class by handling the [PhotoImportFindItemsResult.SelectionChanged](photoimportfinditemsresult_selectionchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportselectionchangedeventargs
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportSelectionChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportSelectionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportSelectionChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether no items are selected after the selection has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportselectionchangedeventargs.isselectionempty
     * @type {Boolean} 
     */
    IsSelectionEmpty {
        get => this.get_IsSelectionEmpty()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelectionEmpty() {
        if (!this.HasProp("__IPhotoImportSelectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhotoImportSelectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportSelectionChangedEventArgs := IPhotoImportSelectionChangedEventArgs(outPtr)
        }

        return this.__IPhotoImportSelectionChangedEventArgs.get_IsSelectionEmpty()
    }

;@endregion Instance Methods
}
