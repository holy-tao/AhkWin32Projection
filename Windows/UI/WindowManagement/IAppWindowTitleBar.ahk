#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppWindowTitleBarOcclusion.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowTitleBar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowTitleBar
     * @type {Guid}
     */
    static IID => Guid("{6e932c84-f644-541d-a2d7-0c262437842d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundColor", "put_BackgroundColor", "get_ButtonBackgroundColor", "put_ButtonBackgroundColor", "get_ButtonForegroundColor", "put_ButtonForegroundColor", "get_ButtonHoverBackgroundColor", "put_ButtonHoverBackgroundColor", "get_ButtonHoverForegroundColor", "put_ButtonHoverForegroundColor", "get_ButtonInactiveBackgroundColor", "put_ButtonInactiveBackgroundColor", "get_ButtonInactiveForegroundColor", "put_ButtonInactiveForegroundColor", "get_ButtonPressedBackgroundColor", "put_ButtonPressedBackgroundColor", "get_ButtonPressedForegroundColor", "put_ButtonPressedForegroundColor", "get_ExtendsContentIntoTitleBar", "put_ExtendsContentIntoTitleBar", "get_ForegroundColor", "put_ForegroundColor", "get_InactiveBackgroundColor", "put_InactiveBackgroundColor", "get_InactiveForegroundColor", "put_InactiveForegroundColor", "get_IsVisible", "GetTitleBarOcclusions"]

    /**
     * @type {IReference<Color>} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ButtonBackgroundColor {
        get => this.get_ButtonBackgroundColor()
        set => this.put_ButtonBackgroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ButtonForegroundColor {
        get => this.get_ButtonForegroundColor()
        set => this.put_ButtonForegroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ButtonHoverBackgroundColor {
        get => this.get_ButtonHoverBackgroundColor()
        set => this.put_ButtonHoverBackgroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ButtonHoverForegroundColor {
        get => this.get_ButtonHoverForegroundColor()
        set => this.put_ButtonHoverForegroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ButtonInactiveBackgroundColor {
        get => this.get_ButtonInactiveBackgroundColor()
        set => this.put_ButtonInactiveBackgroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ButtonInactiveForegroundColor {
        get => this.get_ButtonInactiveForegroundColor()
        set => this.put_ButtonInactiveForegroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ButtonPressedBackgroundColor {
        get => this.get_ButtonPressedBackgroundColor()
        set => this.put_ButtonPressedBackgroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ButtonPressedForegroundColor {
        get => this.get_ButtonPressedForegroundColor()
        set => this.put_ButtonPressedForegroundColor(value)
    }

    /**
     * @type {Boolean} 
     */
    ExtendsContentIntoTitleBar {
        get => this.get_ExtendsContentIntoTitleBar()
        set => this.put_ExtendsContentIntoTitleBar(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
        set => this.put_ForegroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    InactiveBackgroundColor {
        get => this.get_InactiveBackgroundColor()
        set => this.put_InactiveBackgroundColor(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    InactiveForegroundColor {
        get => this.get_InactiveForegroundColor()
        set => this.put_InactiveForegroundColor(value)
    }

    /**
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BackgroundColor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonBackgroundColor() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonBackgroundColor(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonForegroundColor() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonForegroundColor(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonHoverBackgroundColor() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonHoverBackgroundColor(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonHoverForegroundColor() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonHoverForegroundColor(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonInactiveBackgroundColor() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonInactiveBackgroundColor(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonInactiveForegroundColor() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonInactiveForegroundColor(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonPressedBackgroundColor() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonPressedBackgroundColor(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ButtonPressedForegroundColor() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ButtonPressedForegroundColor(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExtendsContentIntoTitleBar() {
        result := ComCall(24, this, "int*", &value := 0, "int")
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
    put_ExtendsContentIntoTitleBar(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ForegroundColor() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ForegroundColor(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_InactiveBackgroundColor() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_InactiveBackgroundColor(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_InactiveForegroundColor() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_InactiveForegroundColor(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<AppWindowTitleBarOcclusion>} 
     */
    GetTitleBarOcclusions() {
        result := ComCall(33, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppWindowTitleBarOcclusion, result_)
    }
}
