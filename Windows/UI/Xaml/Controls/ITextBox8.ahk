#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\FlyoutBase.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBox8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBox8
     * @type {Guid}
     */
    static IID => Guid("{1eb6d027-0317-5c37-8aea-f747ae7f0463}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanPasteClipboardContent", "get_CanUndo", "get_CanRedo", "get_SelectionFlyout", "put_SelectionFlyout", "get_ProofingMenuFlyout", "get_Description", "put_Description", "add_SelectionChanging", "remove_SelectionChanging", "Undo", "Redo", "PasteFromClipboard", "CopySelectionToClipboard", "CutSelectionToClipboard", "ClearUndoRedoHistory"]

    /**
     * @type {Boolean} 
     */
    CanPasteClipboardContent {
        get => this.get_CanPasteClipboardContent()
    }

    /**
     * @type {Boolean} 
     */
    CanUndo {
        get => this.get_CanUndo()
    }

    /**
     * @type {Boolean} 
     */
    CanRedo {
        get => this.get_CanRedo()
    }

    /**
     * @type {FlyoutBase} 
     */
    SelectionFlyout {
        get => this.get_SelectionFlyout()
        set => this.put_SelectionFlyout(value)
    }

    /**
     * @type {FlyoutBase} 
     */
    ProofingMenuFlyout {
        get => this.get_ProofingMenuFlyout()
    }

    /**
     * @type {IInspectable} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPasteClipboardContent() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanUndo() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRedo() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_SelectionFlyout() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FlyoutBase(value)
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_SelectionFlyout(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_ProofingMenuFlyout() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FlyoutBase(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Description() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextBox, TextBoxSelectionChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanging(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_SelectionChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Restore the active configuration of the collector from the previous backup file (determined by going back from the current original timestamp).
     * @returns {HRESULT} <dl> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 0
     * 
     * Failure
     * 
     * </dd> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 1
     * 
     * Success
     * 
     * </dd> </dl>
     * @see https://learn.microsoft.com/windows/win32/ktop-src/BEvtColProv/control-undo
     */
    Undo() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reset the active configuration of the collector from the later backup file (determined by going forward from the current original timestamp). If the configuration has been undone, this means redoing the undone change.
     * @returns {HRESULT} <dl> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 0
     * 
     * Failure
     * 
     * </dd> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 1
     * 
     * Success
     * 
     * </dd> </dl>
     * @see https://learn.microsoft.com/windows/win32/ktop-src/BEvtColProv/control-redo
     */
    Redo() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PasteFromClipboard() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CopySelectionToClipboard() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CutSelectionToClipboard() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearUndoRedoHistory() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
