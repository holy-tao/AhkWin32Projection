#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables access to PlayToManager methods in a Windows Store app that manages multiple windows.
 * @see https://learn.microsoft.com/windows/win32/api//content/playtomanagerinterop/nn-playtomanagerinterop-iplaytomanagerinterop
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class IPlayToManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToManager
     * @type {Guid}
     */
    static IID => Guid("{f56a206e-1b77-42ef-8f0d-b949f8d9b260}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_SourceRequested", "remove_SourceRequested", "add_SourceSelected", "remove_SourceSelected", "put_DefaultSourceSelection", "get_DefaultSourceSelection"]

    /**
     * @type {Boolean} 
     */
    DefaultSourceSelection {
        get => this.get_DefaultSourceSelection()
        set => this.put_DefaultSourceSelection(value)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToManager, PlayToSourceRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_SourceRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToManager, PlayToSourceSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceSelected(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_SourceSelected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DefaultSourceSelection(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DefaultSourceSelection() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
