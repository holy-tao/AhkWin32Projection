#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollViewer2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollViewer2
     * @type {Guid}
     */
    static IID => Guid("{64e9be10-4dd1-494d-abf7-cbd3c577491d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TopLeftHeader", "put_TopLeftHeader", "get_LeftHeader", "put_LeftHeader", "get_TopHeader", "put_TopHeader", "add_ViewChanging", "remove_ViewChanging", "ChangeView", "ChangeViewWithOptionalAnimation"]

    /**
     * @type {UIElement} 
     */
    TopLeftHeader {
        get => this.get_TopLeftHeader()
        set => this.put_TopLeftHeader(value)
    }

    /**
     * @type {UIElement} 
     */
    LeftHeader {
        get => this.get_LeftHeader()
        set => this.put_LeftHeader(value)
    }

    /**
     * @type {UIElement} 
     */
    TopHeader {
        get => this.get_TopHeader()
        set => this.put_TopHeader(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_TopLeftHeader() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_TopLeftHeader(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_LeftHeader() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_LeftHeader(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_TopHeader() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_TopHeader(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<ScrollViewerViewChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ViewChanging(handler) {
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
    remove_ViewChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IReference<Float>} horizontalOffset 
     * @param {IReference<Float>} verticalOffset 
     * @param {IReference<Float>} zoomFactor 
     * @returns {Boolean} 
     */
    ChangeView(horizontalOffset, verticalOffset, zoomFactor) {
        result := ComCall(14, this, "ptr", horizontalOffset, "ptr", verticalOffset, "ptr", zoomFactor, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IReference<Float>} horizontalOffset 
     * @param {IReference<Float>} verticalOffset 
     * @param {IReference<Float>} zoomFactor 
     * @param {Boolean} disableAnimation 
     * @returns {Boolean} 
     */
    ChangeViewWithOptionalAnimation(horizontalOffset, verticalOffset, zoomFactor, disableAnimation) {
        result := ComCall(15, this, "ptr", horizontalOffset, "ptr", verticalOffset, "ptr", zoomFactor, "int", disableAnimation, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
