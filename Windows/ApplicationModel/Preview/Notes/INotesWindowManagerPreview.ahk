#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Preview.Notes
 * @version WindowsRuntime 1.4
 */
class INotesWindowManagerPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotesWindowManagerPreview
     * @type {Guid}
     */
    static IID => Guid("{dc2ac23e-4850-4f13-9cc7-ff487efdfcde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsScreenLocked", "ShowNote", "ShowNoteRelativeTo", "ShowNoteWithPlacement", "HideNote", "GetNotePlacement", "TrySetNoteSize", "SetFocusToNextView", "SetNotesThumbnailAsync", "add_SystemLockStateChanged", "remove_SystemLockStateChanged", "add_NotePlacementChanged", "remove_NotePlacementChanged", "add_NoteVisibilityChanged", "remove_NoteVisibilityChanged"]

    /**
     * @type {Boolean} 
     */
    IsScreenLocked {
        get => this.get_IsScreenLocked()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScreenLocked() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} noteViewId 
     * @returns {HRESULT} 
     */
    ShowNote(noteViewId) {
        result := ComCall(7, this, "int", noteViewId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} noteViewId 
     * @param {Integer} anchorNoteViewId 
     * @returns {HRESULT} 
     */
    ShowNoteRelativeTo(noteViewId, anchorNoteViewId) {
        result := ComCall(8, this, "int", noteViewId, "int", anchorNoteViewId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} noteViewId 
     * @param {IBuffer} data 
     * @returns {HRESULT} 
     */
    ShowNoteWithPlacement(noteViewId, data) {
        result := ComCall(9, this, "int", noteViewId, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} noteViewId 
     * @returns {HRESULT} 
     */
    HideNote(noteViewId) {
        result := ComCall(10, this, "int", noteViewId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} noteViewId 
     * @returns {IBuffer} 
     */
    GetNotePlacement(noteViewId) {
        result := ComCall(11, this, "int", noteViewId, "ptr*", &data := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(data)
    }

    /**
     * 
     * @param {Integer} noteViewId 
     * @param {SIZE} size_ 
     * @returns {Boolean} 
     */
    TrySetNoteSize(noteViewId, size_) {
        result := ComCall(12, this, "int", noteViewId, "ptr", size_, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetFocusToNextView() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IBuffer} thumbnail 
     * @returns {IAsyncAction} 
     */
    SetNotesThumbnailAsync(thumbnail) {
        result := ComCall(14, this, "ptr", thumbnail, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {TypedEventHandler<NotesWindowManagerPreview, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SystemLockStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SystemLockStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<NotesWindowManagerPreview, NotePlacementChangedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NotePlacementChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NotePlacementChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<NotesWindowManagerPreview, NoteVisibilityChangedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NoteVisibilityChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NoteVisibilityChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
