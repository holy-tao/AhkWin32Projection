#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Media\Brush.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IListViewItemPresenter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewItemPresenter2
     * @type {Guid}
     */
    static IID => Guid("{f5dc5496-e122-4c57-a625-ac4b08fb2d4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedPressedBackground", "put_SelectedPressedBackground", "get_PressedBackground", "put_PressedBackground", "get_CheckBoxBrush", "put_CheckBoxBrush", "get_FocusSecondaryBorderBrush", "put_FocusSecondaryBorderBrush", "get_CheckMode", "put_CheckMode", "get_PointerOverForeground", "put_PointerOverForeground"]

    /**
     * @type {Brush} 
     */
    SelectedPressedBackground {
        get => this.get_SelectedPressedBackground()
        set => this.put_SelectedPressedBackground(value)
    }

    /**
     * @type {Brush} 
     */
    PressedBackground {
        get => this.get_PressedBackground()
        set => this.put_PressedBackground(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxBrush {
        get => this.get_CheckBoxBrush()
        set => this.put_CheckBoxBrush(value)
    }

    /**
     * @type {Brush} 
     */
    FocusSecondaryBorderBrush {
        get => this.get_FocusSecondaryBorderBrush()
        set => this.put_FocusSecondaryBorderBrush(value)
    }

    /**
     * @type {Integer} 
     */
    CheckMode {
        get => this.get_CheckMode()
        set => this.put_CheckMode(value)
    }

    /**
     * @type {Brush} 
     */
    PointerOverForeground {
        get => this.get_PointerOverForeground()
        set => this.put_PointerOverForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPressedBackground() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_SelectedPressedBackground(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PressedBackground() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PressedBackground(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxBrush() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxBrush(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_FocusSecondaryBorderBrush() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_FocusSecondaryBorderBrush(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CheckMode() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_CheckMode(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PointerOverForeground() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PointerOverForeground(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
