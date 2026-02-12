#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include .\NavigationViewTemplateSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationView3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationView3
     * @type {Guid}
     */
    static IID => Guid("{8fdfab66-9bbc-5fa3-9043-a02bb4f8ef37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PaneDisplayMode", "put_PaneDisplayMode", "get_PaneHeader", "put_PaneHeader", "get_PaneCustomContent", "put_PaneCustomContent", "get_ContentOverlay", "put_ContentOverlay", "get_IsPaneVisible", "put_IsPaneVisible", "get_SelectionFollowsFocus", "put_SelectionFollowsFocus", "get_TemplateSettings", "get_ShoulderNavigationEnabled", "put_ShoulderNavigationEnabled", "get_OverflowLabelMode", "put_OverflowLabelMode"]

    /**
     * @type {Integer} 
     */
    PaneDisplayMode {
        get => this.get_PaneDisplayMode()
        set => this.put_PaneDisplayMode(value)
    }

    /**
     * @type {UIElement} 
     */
    PaneHeader {
        get => this.get_PaneHeader()
        set => this.put_PaneHeader(value)
    }

    /**
     * @type {UIElement} 
     */
    PaneCustomContent {
        get => this.get_PaneCustomContent()
        set => this.put_PaneCustomContent(value)
    }

    /**
     * @type {UIElement} 
     */
    ContentOverlay {
        get => this.get_ContentOverlay()
        set => this.put_ContentOverlay(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPaneVisible {
        get => this.get_IsPaneVisible()
        set => this.put_IsPaneVisible(value)
    }

    /**
     * @type {Integer} 
     */
    SelectionFollowsFocus {
        get => this.get_SelectionFollowsFocus()
        set => this.put_SelectionFollowsFocus(value)
    }

    /**
     * @type {NavigationViewTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * @type {Integer} 
     */
    ShoulderNavigationEnabled {
        get => this.get_ShoulderNavigationEnabled()
        set => this.put_ShoulderNavigationEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    OverflowLabelMode {
        get => this.get_OverflowLabelMode()
        set => this.put_OverflowLabelMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PaneDisplayMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PaneDisplayMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_PaneHeader() {
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
    put_PaneHeader(value) {
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
    get_PaneCustomContent() {
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
    put_PaneCustomContent(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_ContentOverlay() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
    put_ContentOverlay(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaneVisible() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_IsPaneVisible(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionFollowsFocus() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionFollowsFocus(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {NavigationViewTemplateSettings} 
     */
    get_TemplateSettings() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NavigationViewTemplateSettings(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShoulderNavigationEnabled() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ShoulderNavigationEnabled(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OverflowLabelMode() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OverflowLabelMode(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
