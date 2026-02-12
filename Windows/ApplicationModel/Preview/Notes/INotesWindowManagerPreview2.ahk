#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Preview.Notes
 * @version WindowsRuntime 1.4
 */
class INotesWindowManagerPreview2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotesWindowManagerPreview2
     * @type {Guid}
     */
    static IID => Guid("{edfe864a-1f54-4b09-9823-ff477f6fa3bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowNoteRelativeToWithOptions", "ShowNoteWithPlacementWithOptions", "SetFocusToPreviousView", "SetThumbnailImageForTaskSwitcherAsync"]

    /**
     * 
     * @param {Integer} noteViewId 
     * @param {Integer} anchorNoteViewId 
     * @param {NotesWindowManagerPreviewShowNoteOptions} options 
     * @returns {HRESULT} 
     */
    ShowNoteRelativeToWithOptions(noteViewId, anchorNoteViewId, options) {
        result := ComCall(6, this, "int", noteViewId, "int", anchorNoteViewId, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} noteViewId 
     * @param {IBuffer} data 
     * @param {NotesWindowManagerPreviewShowNoteOptions} options 
     * @returns {HRESULT} 
     */
    ShowNoteWithPlacementWithOptions(noteViewId, data, options) {
        result := ComCall(7, this, "int", noteViewId, "ptr", data, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetFocusToPreviousView() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SoftwareBitmap} bitmap_ 
     * @returns {IAsyncAction} 
     */
    SetThumbnailImageForTaskSwitcherAsync(bitmap_) {
        result := ComCall(9, this, "ptr", bitmap_, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }
}
