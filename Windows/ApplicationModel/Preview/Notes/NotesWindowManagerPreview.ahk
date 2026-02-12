#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotesWindowManagerPreview.ahk
#Include .\INotesWindowManagerPreview2.ahk
#Include .\INotesWindowManagerPreviewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\NotesWindowManagerPreview.ahk
#Include .\NotePlacementChangedPreviewEventArgs.ahk
#Include .\NoteVisibilityChangedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class owns much of the functionality of the **Preview Notes** application feature (see Remarks).
 * @remarks
 * The **Preview Notes** feature allows a Universal Windows app to utilize the **Windows Ink Workspace** in order to provide a tailored note-taking experience on desktop devices. Apps that are recognized as such will operate with a number of behavioral changes meant to make the note-taking process faster and more convenient. For example, note-taking apps will open without a splash screen, will appear in the "Sticky Notes" section of the **Windows Ink Workspace**, will have their own configurable view-switching mechanism, and can display notes on a locked screen.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview
 * @namespace Windows.ApplicationModel.Preview.Notes
 * @version WindowsRuntime 1.4
 */
class NotesWindowManagerPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotesWindowManagerPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotesWindowManagerPreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns an instance of [NotesWindowManagerPreview](noteswindowmanagerpreview.md), to be used for the majority of Preview Notes operations that an app may execute.
     * @returns {NotesWindowManagerPreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.getforcurrentapp
     */
    static GetForCurrentApp() {
        if (!NotesWindowManagerPreview.HasProp("__INotesWindowManagerPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Preview.Notes.NotesWindowManagerPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INotesWindowManagerPreviewStatics.IID)
            NotesWindowManagerPreview.__INotesWindowManagerPreviewStatics := INotesWindowManagerPreviewStatics(factoryPtr)
        }

        return NotesWindowManagerPreview.__INotesWindowManagerPreviewStatics.GetForCurrentApp()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating whether the device's screen is currently locked.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.isscreenlocked
     * @type {Boolean} 
     */
    IsScreenLocked {
        get => this.get_IsScreenLocked()
    }

    /**
     * Indicates that the device's screen lock state has changed.
     * @type {TypedEventHandler<NotesWindowManagerPreview, IInspectable>}
    */
    OnSystemLockStateChanged {
        get {
            if(!this.HasProp("__OnSystemLockStateChanged")){
                this.__OnSystemLockStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6f2755fb-6c33-543c-9ab4-de486bc7bfe2}"),
                    NotesWindowManagerPreview,
                    IInspectable
                )
                this.__OnSystemLockStateChangedToken := this.add_SystemLockStateChanged(this.__OnSystemLockStateChanged.iface)
            }
            return this.__OnSystemLockStateChanged
        }
    }

    /**
     * Indicates that a note's placement (dimensions and location) has changed.
     * 
     * > [!NOTE]
     * > When this event is raised, the application should call [GetNotePlacement](noteswindowmanagerpreview_getnoteplacement_639894587.md) to update its record with the note's new placement.
     * @type {TypedEventHandler<NotesWindowManagerPreview, NotePlacementChangedPreviewEventArgs>}
    */
    OnNotePlacementChanged {
        get {
            if(!this.HasProp("__OnNotePlacementChanged")){
                this.__OnNotePlacementChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a28af2c7-4012-5999-a322-5236b30d995f}"),
                    NotesWindowManagerPreview,
                    NotePlacementChangedPreviewEventArgs
                )
                this.__OnNotePlacementChangedToken := this.add_NotePlacementChanged(this.__OnNotePlacementChanged.iface)
            }
            return this.__OnNotePlacementChanged
        }
    }

    /**
     * Indicates that a note's visibility state has changed.
     * 
     * > [!NOTE]
     * > When this event is raised, its handler must determine whether the given view was hidden or shown (according to the [isVisible](notevisibilitychangedprevieweventargs_isvisible.md) property in [NoteVisibilityChangedPreviewEventArgs](notevisibilitychangedprevieweventargs.md) class). If hidden, the note's [CoreWindow](../windows.ui.core/corewindow.md) object must be closed (with the [Close](../windows.ui.core/corewindow_close_811482585.md) method) within the event handler.
     * @type {TypedEventHandler<NotesWindowManagerPreview, NoteVisibilityChangedPreviewEventArgs>}
    */
    OnNoteVisibilityChanged {
        get {
            if(!this.HasProp("__OnNoteVisibilityChanged")){
                this.__OnNoteVisibilityChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{16d825c8-5271-51c8-a00f-0cfb1b029ab6}"),
                    NotesWindowManagerPreview,
                    NoteVisibilityChangedPreviewEventArgs
                )
                this.__OnNoteVisibilityChangedToken := this.add_NoteVisibilityChanged(this.__OnNoteVisibilityChanged.iface)
            }
            return this.__OnNoteVisibilityChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSystemLockStateChangedToken")) {
            this.remove_SystemLockStateChanged(this.__OnSystemLockStateChangedToken)
            this.__OnSystemLockStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnNotePlacementChangedToken")) {
            this.remove_NotePlacementChanged(this.__OnNotePlacementChangedToken)
            this.__OnNotePlacementChanged.iface.Dispose()
        }

        if(this.HasProp("__OnNoteVisibilityChangedToken")) {
            this.remove_NoteVisibilityChanged(this.__OnNoteVisibilityChangedToken)
            this.__OnNoteVisibilityChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScreenLocked() {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.get_IsScreenLocked()
    }

    /**
     * Makes a note visible on the device screen.
     * 
     * > [!NOTE]
     * > This method should only be called on a note that has been hidden with [HideNote](noteswindowmanagerpreview_hidenote_1106719948.md).
     * @param {Integer} noteViewId The unique identifier of the note to be shown.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.shownote
     */
    ShowNote(noteViewId) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.ShowNote(noteViewId)
    }

    /**
     * Makes a note visible and places it adjacent to a specified "anchor" view.
     * @param {Integer} noteViewId The unique identifier of the note to be shown.
     * @param {Integer} anchorNoteViewId The Id of the "anchor" view. If this value is 0 (not assigned to any view), the note will appear at the center of the screen.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.shownoterelativeto
     */
    ShowNoteRelativeTo(noteViewId, anchorNoteViewId) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.ShowNoteRelativeTo(noteViewId, anchorNoteViewId)
    }

    /**
     * Makes a note visible and sets its placement data (dimensions and location) as specified.
     * @remarks
     * [GetNotePlacement](noteswindowmanagerpreview_getnoteplacement_639894587.md) and [ShowNoteWithPlacement](/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.shownotewithplacement) can be used together to store the placement of a note (say, while the application is exiting) and then restore the note to its previous placement on the screen (when the application is opened again).
     * @param {Integer} noteViewId The unique identifier of the note to be shown.
     * @param {IBuffer} data An array of bytes holding note placement data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.shownotewithplacement
     */
    ShowNoteWithPlacement(noteViewId, data) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.ShowNoteWithPlacement(noteViewId, data)
    }

    /**
     * Sets a note's view to invisible and moves the focus to the next visible note view (window) or to the Windows Ink Workspace (see Remarks). The views are selected in a cyclic, system-determined order.
     * 
     * > [!NOTE]
     * > Even though the note disappears from the screen, its [CoreWindow](../windows.ui.core/corewindow.md) object remains until the [NoteVisibilityChanged](noteswindowmanagerpreview_notevisibilitychanged.md) event is raised and the handling method closes the note's window by calling the [Close](../windows.ui.core/corewindow_close_811482585.md) method.
     * @remarks
     * When the notes app is loaded from the Windows Ink Workspace, this method will switch focus to the Windows Ink Workspace if it is next in the order.
     * @param {Integer} noteViewId The unique identifier of the note to be hidden.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.hidenote
     */
    HideNote(noteViewId) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.HideNote(noteViewId)
    }

    /**
     * Gets the view placement of a given note, to be stored in program memory or on disk storage and then restored by the application at a later time.
     * @remarks
     * GetNotePlacement and [ShowNoteWithPlacement](/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.shownotewithplacement) can be used together to store the placement of a note (say, while the application is exiting) and then restore the note to its previous placement on the screen (when the application is opened again).
     * @param {Integer} noteViewId The unique identifier of the note whose placement is to be retrieved.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.getnoteplacement
     */
    GetNotePlacement(noteViewId) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.GetNotePlacement(noteViewId)
    }

    /**
     * Resizes the specified note to the desired dimensions. If the given size is not recommended due to screen size/space issues, the note's size will not be changed.
     * @param {Integer} noteViewId The unique identifier of the note to be resized.
     * @param {SIZE} size_ The desired dimensions of the note (use raw pixels when constructing).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.trysetnotesize
     */
    TrySetNoteSize(noteViewId, size_) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.TrySetNoteSize(noteViewId, size_)
    }

    /**
     * Switches focus to the next visible note view (window) or to the Windows Ink Workspace (see Remarks). The views are selected in a cyclic, system-determined order.
     * @remarks
     * When the notes app is loaded from the Windows Ink Workspace, this method also switches focus to the Windows Ink Workspace and then back to views within the notes app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.setfocustonextview
     */
    SetFocusToNextView() {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.SetFocusToNextView()
    }

    /**
     * Sets the thumbnail image for this application as it appears in the Windows Ink Workspace, in the Alt+TAB task switcher, or on hovering in the taskbar.
     * @remarks
     * The *thumbnail* byte array must adhere to the following format in order to describe a thumbnail image: Bytes 0-3: thumbnail type – a string value of either "NTPW" (for Ink Workspace appearance) or "NTTS" (for Alt+TAB switching and taskbar hover).
     * 
     * Bytes 4-7: Image width in pixels – an integer value.
     * 
     * Bytes 8-11: Image height in pixels – an integer value.
     * 
     * The final section must contain 4 * **image width** * **image height** number of bytes. Every 4-byte integer of this section corresponds to the BGRA color data of one pixel.
     * 
     * > [!NOTE]
     * > If the size of the image used (in pixels) exceeds the size of the primary monitor, an InvalidArgumentException will be thrown.
     * @param {IBuffer} thumbnail A byte array describing the thumbnail image and usage (see Remarks).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.setnotesthumbnailasync
     */
    SetNotesThumbnailAsync(thumbnail) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.SetNotesThumbnailAsync(thumbnail)
    }

    /**
     * 
     * @param {TypedEventHandler<NotesWindowManagerPreview, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SystemLockStateChanged(handler) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.add_SystemLockStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SystemLockStateChanged(token) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.remove_SystemLockStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NotesWindowManagerPreview, NotePlacementChangedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NotePlacementChanged(handler) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.add_NotePlacementChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NotePlacementChanged(token) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.remove_NotePlacementChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NotesWindowManagerPreview, NoteVisibilityChangedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NoteVisibilityChanged(handler) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.add_NoteVisibilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NoteVisibilityChanged(token) {
        if (!this.HasProp("__INotesWindowManagerPreview")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview := INotesWindowManagerPreview(outPtr)
        }

        return this.__INotesWindowManagerPreview.remove_NoteVisibilityChanged(token)
    }

    /**
     * Makes a note visible and places it adjacent to a specified "anchor" view.
     * @param {Integer} noteViewId The unique identifier of the note to be shown.
     * @param {Integer} anchorNoteViewId The Id of the "anchor" view. If this value is 0 (not assigned to any view), the note will appear at the center of the screen.
     * @param {NotesWindowManagerPreviewShowNoteOptions} options Options for showing the note specified by the *noteViewId* parameter. For example, show the note with focus.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.shownoterelativeto
     */
    ShowNoteRelativeToWithOptions(noteViewId, anchorNoteViewId, options) {
        if (!this.HasProp("__INotesWindowManagerPreview2")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview2 := INotesWindowManagerPreview2(outPtr)
        }

        return this.__INotesWindowManagerPreview2.ShowNoteRelativeToWithOptions(noteViewId, anchorNoteViewId, options)
    }

    /**
     * Makes a note visible and sets its placement data (dimensions and location) as specified.
     * @remarks
     * [GetNotePlacement](noteswindowmanagerpreview_getnoteplacement_639894587.md) and ShowNoteWithPlacement can be used together to store the placement of a note (say, while the application is exiting) and then restore the note to its previous placement on the screen (when the application is opened again).
     * @param {Integer} noteViewId The unique identifier of the note to be shown.
     * @param {IBuffer} data An array of bytes holding note placement data.
     * @param {NotesWindowManagerPreviewShowNoteOptions} options Options for showing the note specified by the *noteViewId* parameter. For example, show the note with focus.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.shownotewithplacement
     */
    ShowNoteWithPlacementWithOptions(noteViewId, data, options) {
        if (!this.HasProp("__INotesWindowManagerPreview2")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview2 := INotesWindowManagerPreview2(outPtr)
        }

        return this.__INotesWindowManagerPreview2.ShowNoteWithPlacementWithOptions(noteViewId, data, options)
    }

    /**
     * Switches focus to the previous visible note view (window) or to the Windows Ink Workspace (see Remarks). The views are selected in a cyclic, system-determined order.
     * @remarks
     * When the notes app is loaded from the Windows Ink Workspace, this method also switches focus to the Windows Ink Workspace and then back to views within the notes app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.setfocustopreviousview
     */
    SetFocusToPreviousView() {
        if (!this.HasProp("__INotesWindowManagerPreview2")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview2 := INotesWindowManagerPreview2(outPtr)
        }

        return this.__INotesWindowManagerPreview2.SetFocusToPreviousView()
    }

    /**
     * Asynchronously sets the thumbnail image for this application as it appears in the Alt+TAB task switcher.
     * @param {SoftwareBitmap} bitmap_ A bitmap of the thumbnail image.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.notes.noteswindowmanagerpreview.setthumbnailimagefortaskswitcherasync
     */
    SetThumbnailImageForTaskSwitcherAsync(bitmap_) {
        if (!this.HasProp("__INotesWindowManagerPreview2")) {
            if ((queryResult := this.QueryInterface(INotesWindowManagerPreview2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotesWindowManagerPreview2 := INotesWindowManagerPreview2(outPtr)
        }

        return this.__INotesWindowManagerPreview2.SetThumbnailImageForTaskSwitcherAsync(bitmap_)
    }

;@endregion Instance Methods
}
