#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotePlacementChangedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information about the [NotePlacementChanged](noteswindowmanagerpreview_noteplacementchanged.md) event.
 * @remarks
 * This class is instantiated automatically when the [NotePlacementChanged](noteswindowmanagerpreview_noteplacementchanged.md) event is raised.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteplacementchangedprevieweventargs
 * @namespace Windows.ApplicationModel.Preview.Notes
 * @version WindowsRuntime 1.4
 */
class NotePlacementChangedPreviewEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotePlacementChangedPreviewEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotePlacementChangedPreviewEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The unique identifier of the note for which the [NotePlacementChanged](noteswindowmanagerpreview_noteplacementchanged.md) event was raised.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteplacementchangedprevieweventargs.viewid
     * @type {Integer} 
     */
    ViewId {
        get => this.get_ViewId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewId() {
        if (!this.HasProp("__INotePlacementChangedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(INotePlacementChangedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotePlacementChangedPreviewEventArgs := INotePlacementChangedPreviewEventArgs(outPtr)
        }

        return this.__INotePlacementChangedPreviewEventArgs.get_ViewId()
    }

;@endregion Instance Methods
}
