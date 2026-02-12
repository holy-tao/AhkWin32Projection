#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INoteVisibilityChangedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information about the [NoteVisibilityChanged](noteswindowmanagerpreview_notevisibilitychanged.md) event.
 * @remarks
 * This class is instantiated automatically when the [NoteVisibilityChanged](noteswindowmanagerpreview_notevisibilitychanged.md) event is raised.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.notevisibilitychangedprevieweventargs
 * @namespace Windows.ApplicationModel.Preview.Notes
 * @version WindowsRuntime 1.4
 */
class NoteVisibilityChangedPreviewEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INoteVisibilityChangedPreviewEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INoteVisibilityChangedPreviewEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The unique identifier of the note for which the [NoteVisibilityChanged](noteswindowmanagerpreview_notevisibilitychanged.md) event was raised.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.notevisibilitychangedprevieweventargs.viewid
     * @type {Integer} 
     */
    ViewId {
        get => this.get_ViewId()
    }

    /**
     * Indicates whether the note (specified by [ViewId](notevisibilitychangedprevieweventargs_viewid.md) property) is visible on the device screen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.notevisibilitychangedprevieweventargs.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
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
        if (!this.HasProp("__INoteVisibilityChangedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(INoteVisibilityChangedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INoteVisibilityChangedPreviewEventArgs := INoteVisibilityChangedPreviewEventArgs(outPtr)
        }

        return this.__INoteVisibilityChangedPreviewEventArgs.get_ViewId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        if (!this.HasProp("__INoteVisibilityChangedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(INoteVisibilityChangedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INoteVisibilityChangedPreviewEventArgs := INoteVisibilityChangedPreviewEventArgs(outPtr)
        }

        return this.__INoteVisibilityChangedPreviewEventArgs.get_IsVisible()
    }

;@endregion Instance Methods
}
