#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UIElement.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\UIContext.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IXamlRoot extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlRoot
     * @type {Guid}
     */
    static IID => Guid("{34b50756-1696-5b6d-8e9b-c71464ccad5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "get_Size", "get_RasterizationScale", "get_IsHostVisible", "get_UIContext", "add_Changed", "remove_Changed"]

    /**
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {Float} 
     */
    RasterizationScale {
        get => this.get_RasterizationScale()
    }

    /**
     * @type {Boolean} 
     */
    IsHostVisible {
        get => this.get_IsHostVisible()
    }

    /**
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        value := SIZE()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RasterizationScale() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHostVisible() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIContext(value)
    }

    /**
     * 
     * @param {TypedEventHandler<XamlRoot, XamlRootChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_Changed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
