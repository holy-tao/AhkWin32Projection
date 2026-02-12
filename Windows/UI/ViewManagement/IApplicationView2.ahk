#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationView2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationView2
     * @type {Guid}
     */
    static IID => Guid("{e876b196-a545-40dc-b594-450cba68cc00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SuppressSystemOverlays", "put_SuppressSystemOverlays", "get_VisibleBounds", "add_VisibleBoundsChanged", "remove_VisibleBoundsChanged", "SetDesiredBoundsMode", "get_DesiredBoundsMode"]

    /**
     * @type {Boolean} 
     */
    SuppressSystemOverlays {
        get => this.get_SuppressSystemOverlays()
        set => this.put_SuppressSystemOverlays(value)
    }

    /**
     * @type {RECT} 
     */
    VisibleBounds {
        get => this.get_VisibleBounds()
    }

    /**
     * @type {Integer} 
     */
    DesiredBoundsMode {
        get => this.get_DesiredBoundsMode()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SuppressSystemOverlays() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SuppressSystemOverlays(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_VisibleBounds() {
        value := RECT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<ApplicationView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisibleBoundsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_VisibleBoundsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} boundsMode 
     * @returns {Boolean} 
     */
    SetDesiredBoundsMode(boundsMode) {
        result := ComCall(11, this, "int", boundsMode, "int*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredBoundsMode() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
