#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationViewTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{2956cbc4-0528-55d5-b2d1-eae807aea6da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TopPadding", "get_OverflowButtonVisibility", "get_PaneToggleButtonVisibility", "get_BackButtonVisibility", "get_TopPaneVisibility", "get_LeftPaneVisibility", "get_SingleSelectionFollowsFocus"]

    /**
     * @type {Float} 
     */
    TopPadding {
        get => this.get_TopPadding()
    }

    /**
     * @type {Integer} 
     */
    OverflowButtonVisibility {
        get => this.get_OverflowButtonVisibility()
    }

    /**
     * @type {Integer} 
     */
    PaneToggleButtonVisibility {
        get => this.get_PaneToggleButtonVisibility()
    }

    /**
     * @type {Integer} 
     */
    BackButtonVisibility {
        get => this.get_BackButtonVisibility()
    }

    /**
     * @type {Integer} 
     */
    TopPaneVisibility {
        get => this.get_TopPaneVisibility()
    }

    /**
     * @type {Integer} 
     */
    LeftPaneVisibility {
        get => this.get_LeftPaneVisibility()
    }

    /**
     * @type {Boolean} 
     */
    SingleSelectionFollowsFocus {
        get => this.get_SingleSelectionFollowsFocus()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopPadding() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OverflowButtonVisibility() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PaneToggleButtonVisibility() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackButtonVisibility() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TopPaneVisibility() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LeftPaneVisibility() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SingleSelectionFollowsFocus() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
