#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowTabCollection.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IWindowTabManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowTabManager
     * @type {Guid}
     */
    static IID => Guid("{97b3c697-f43a-43e7-b3a2-e889a9835599}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Tabs", "SetActiveTab", "add_TabSwitchRequested", "remove_TabSwitchRequested", "add_TabCloseRequested", "remove_TabCloseRequested", "add_TabTearOutRequested", "remove_TabTearOutRequested", "add_TabThumbnailRequested", "remove_TabThumbnailRequested"]

    /**
     * @type {WindowTabCollection} 
     */
    Tabs {
        get => this.get_Tabs()
    }

    /**
     * 
     * @returns {WindowTabCollection} 
     */
    get_Tabs() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowTabCollection(value)
    }

    /**
     * 
     * @param {WindowTab} tab 
     * @returns {HRESULT} 
     */
    SetActiveTab(tab) {
        result := ComCall(7, this, "ptr", tab, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowTabManager, WindowTabSwitchRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TabSwitchRequested(handler) {
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
    remove_TabSwitchRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowTabManager, WindowTabCloseRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TabCloseRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_TabCloseRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowTabManager, WindowTabTearOutRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TabTearOutRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_TabTearOutRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowTabManager, WindowTabThumbnailRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TabThumbnailRequested(handler) {
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
    remove_TabThumbnailRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
