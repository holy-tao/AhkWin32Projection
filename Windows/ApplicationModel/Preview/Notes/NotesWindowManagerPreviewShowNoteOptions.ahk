#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotesWindowManagerPreviewShowNoteOptions.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides options for how to show a note.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreviewshownoteoptions
 * @namespace Windows.ApplicationModel.Preview.Notes
 * @version WindowsRuntime 1.4
 */
class NotesWindowManagerPreviewShowNoteOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotesWindowManagerPreviewShowNoteOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotesWindowManagerPreviewShowNoteOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a Boolean value that specifies if the note should be shown with focus.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreviewshownoteoptions.showwithfocus
     * @type {Boolean} 
     */
    ShowWithFocus {
        get => this.get_ShowWithFocus()
        set => this.put_ShowWithFocus(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [NotesWindowManagerPreviewShowNoteOptions](noteswindowmanagerpreviewshownoteoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Preview.Notes.NotesWindowManagerPreviewShowNoteOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowWithFocus() {
        if (!this.HasProp("__INotesWindowManagerPreviewShowNoteOptions")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreviewShowNoteOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreviewShowNoteOptions := INotesWindowManagerPreviewShowNoteOptions(outPtr)
        }

        return this.__INotesWindowManagerPreviewShowNoteOptions.get_ShowWithFocus()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowWithFocus(value) {
        if (!this.HasProp("__INotesWindowManagerPreviewShowNoteOptions")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreviewShowNoteOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreviewShowNoteOptions := INotesWindowManagerPreviewShowNoteOptions(outPtr)
        }

        return this.__INotesWindowManagerPreviewShowNoteOptions.put_ShowWithFocus(value)
    }

;@endregion Instance Methods
}
