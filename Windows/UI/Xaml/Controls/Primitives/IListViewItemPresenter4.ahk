#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Media\Brush.ahk
#Include ..\..\CornerRadius.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IListViewItemPresenter4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewItemPresenter4
     * @type {Guid}
     */
    static IID => Guid("{da600ac1-adea-5940-a18f-57582f96d99a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedDisabledBackground", "put_SelectedDisabledBackground", "get_CheckPressedBrush", "put_CheckPressedBrush", "get_CheckDisabledBrush", "put_CheckDisabledBrush", "get_CheckBoxPointerOverBrush", "put_CheckBoxPointerOverBrush", "get_CheckBoxPressedBrush", "put_CheckBoxPressedBrush", "get_CheckBoxDisabledBrush", "put_CheckBoxDisabledBrush", "get_CheckBoxSelectedBrush", "put_CheckBoxSelectedBrush", "get_CheckBoxSelectedPointerOverBrush", "put_CheckBoxSelectedPointerOverBrush", "get_CheckBoxSelectedPressedBrush", "put_CheckBoxSelectedPressedBrush", "get_CheckBoxSelectedDisabledBrush", "put_CheckBoxSelectedDisabledBrush", "get_CheckBoxBorderBrush", "put_CheckBoxBorderBrush", "get_CheckBoxPointerOverBorderBrush", "put_CheckBoxPointerOverBorderBrush", "get_CheckBoxPressedBorderBrush", "put_CheckBoxPressedBorderBrush", "get_CheckBoxDisabledBorderBrush", "put_CheckBoxDisabledBorderBrush", "get_CheckBoxCornerRadius", "put_CheckBoxCornerRadius", "get_SelectionIndicatorCornerRadius", "put_SelectionIndicatorCornerRadius", "get_SelectionIndicatorVisualEnabled", "put_SelectionIndicatorVisualEnabled", "get_SelectionIndicatorMode", "put_SelectionIndicatorMode", "get_SelectionIndicatorBrush", "put_SelectionIndicatorBrush", "get_SelectionIndicatorPointerOverBrush", "put_SelectionIndicatorPointerOverBrush", "get_SelectionIndicatorPressedBrush", "put_SelectionIndicatorPressedBrush", "get_SelectionIndicatorDisabledBrush", "put_SelectionIndicatorDisabledBrush", "get_SelectedBorderBrush", "put_SelectedBorderBrush", "get_SelectedPressedBorderBrush", "put_SelectedPressedBorderBrush", "get_SelectedDisabledBorderBrush", "put_SelectedDisabledBorderBrush", "get_SelectedInnerBorderBrush", "put_SelectedInnerBorderBrush", "get_PointerOverBorderBrush", "put_PointerOverBorderBrush"]

    /**
     * @type {Brush} 
     */
    SelectedDisabledBackground {
        get => this.get_SelectedDisabledBackground()
        set => this.put_SelectedDisabledBackground(value)
    }

    /**
     * @type {Brush} 
     */
    CheckPressedBrush {
        get => this.get_CheckPressedBrush()
        set => this.put_CheckPressedBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckDisabledBrush {
        get => this.get_CheckDisabledBrush()
        set => this.put_CheckDisabledBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxPointerOverBrush {
        get => this.get_CheckBoxPointerOverBrush()
        set => this.put_CheckBoxPointerOverBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxPressedBrush {
        get => this.get_CheckBoxPressedBrush()
        set => this.put_CheckBoxPressedBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxDisabledBrush {
        get => this.get_CheckBoxDisabledBrush()
        set => this.put_CheckBoxDisabledBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxSelectedBrush {
        get => this.get_CheckBoxSelectedBrush()
        set => this.put_CheckBoxSelectedBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxSelectedPointerOverBrush {
        get => this.get_CheckBoxSelectedPointerOverBrush()
        set => this.put_CheckBoxSelectedPointerOverBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxSelectedPressedBrush {
        get => this.get_CheckBoxSelectedPressedBrush()
        set => this.put_CheckBoxSelectedPressedBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxSelectedDisabledBrush {
        get => this.get_CheckBoxSelectedDisabledBrush()
        set => this.put_CheckBoxSelectedDisabledBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxBorderBrush {
        get => this.get_CheckBoxBorderBrush()
        set => this.put_CheckBoxBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxPointerOverBorderBrush {
        get => this.get_CheckBoxPointerOverBorderBrush()
        set => this.put_CheckBoxPointerOverBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxPressedBorderBrush {
        get => this.get_CheckBoxPressedBorderBrush()
        set => this.put_CheckBoxPressedBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBoxDisabledBorderBrush {
        get => this.get_CheckBoxDisabledBorderBrush()
        set => this.put_CheckBoxDisabledBorderBrush(value)
    }

    /**
     * @type {CornerRadius} 
     */
    CheckBoxCornerRadius {
        get => this.get_CheckBoxCornerRadius()
        set => this.put_CheckBoxCornerRadius(value)
    }

    /**
     * @type {CornerRadius} 
     */
    SelectionIndicatorCornerRadius {
        get => this.get_SelectionIndicatorCornerRadius()
        set => this.put_SelectionIndicatorCornerRadius(value)
    }

    /**
     * @type {Boolean} 
     */
    SelectionIndicatorVisualEnabled {
        get => this.get_SelectionIndicatorVisualEnabled()
        set => this.put_SelectionIndicatorVisualEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    SelectionIndicatorMode {
        get => this.get_SelectionIndicatorMode()
        set => this.put_SelectionIndicatorMode(value)
    }

    /**
     * @type {Brush} 
     */
    SelectionIndicatorBrush {
        get => this.get_SelectionIndicatorBrush()
        set => this.put_SelectionIndicatorBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectionIndicatorPointerOverBrush {
        get => this.get_SelectionIndicatorPointerOverBrush()
        set => this.put_SelectionIndicatorPointerOverBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectionIndicatorPressedBrush {
        get => this.get_SelectionIndicatorPressedBrush()
        set => this.put_SelectionIndicatorPressedBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectionIndicatorDisabledBrush {
        get => this.get_SelectionIndicatorDisabledBrush()
        set => this.put_SelectionIndicatorDisabledBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedBorderBrush {
        get => this.get_SelectedBorderBrush()
        set => this.put_SelectedBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedPressedBorderBrush {
        get => this.get_SelectedPressedBorderBrush()
        set => this.put_SelectedPressedBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedDisabledBorderBrush {
        get => this.get_SelectedDisabledBorderBrush()
        set => this.put_SelectedDisabledBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedInnerBorderBrush {
        get => this.get_SelectedInnerBorderBrush()
        set => this.put_SelectedInnerBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    PointerOverBorderBrush {
        get => this.get_PointerOverBorderBrush()
        set => this.put_PointerOverBorderBrush(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedDisabledBackground() {
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
    put_SelectedDisabledBackground(value) {
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
    get_CheckPressedBrush() {
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
    put_CheckPressedBrush(value) {
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
    get_CheckDisabledBrush() {
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
    put_CheckDisabledBrush(value) {
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
    get_CheckBoxPointerOverBrush() {
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
    put_CheckBoxPointerOverBrush(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxPressedBrush() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxPressedBrush(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxDisabledBrush() {
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
    put_CheckBoxDisabledBrush(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxSelectedBrush() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxSelectedBrush(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxSelectedPointerOverBrush() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxSelectedPointerOverBrush(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxSelectedPressedBrush() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxSelectedPressedBrush(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxSelectedDisabledBrush() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxSelectedDisabledBrush(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxBorderBrush() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxBorderBrush(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxPointerOverBorderBrush() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxPointerOverBorderBrush(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxPressedBorderBrush() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxPressedBorderBrush(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckBoxDisabledBorderBrush() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
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
    put_CheckBoxDisabledBorderBrush(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CheckBoxCornerRadius() {
        value := CornerRadius()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CheckBoxCornerRadius(value) {
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_SelectionIndicatorCornerRadius() {
        value := CornerRadius()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_SelectionIndicatorCornerRadius(value) {
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SelectionIndicatorVisualEnabled() {
        result := ComCall(38, this, "int*", &value := 0, "int")
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
    put_SelectionIndicatorVisualEnabled(value) {
        result := ComCall(39, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionIndicatorMode() {
        result := ComCall(40, this, "int*", &value := 0, "int")
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
    put_SelectionIndicatorMode(value) {
        result := ComCall(41, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectionIndicatorBrush() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
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
    put_SelectionIndicatorBrush(value) {
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectionIndicatorPointerOverBrush() {
        result := ComCall(44, this, "ptr*", &value := 0, "int")
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
    put_SelectionIndicatorPointerOverBrush(value) {
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectionIndicatorPressedBrush() {
        result := ComCall(46, this, "ptr*", &value := 0, "int")
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
    put_SelectionIndicatorPressedBrush(value) {
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectionIndicatorDisabledBrush() {
        result := ComCall(48, this, "ptr*", &value := 0, "int")
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
    put_SelectionIndicatorDisabledBrush(value) {
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedBorderBrush() {
        result := ComCall(50, this, "ptr*", &value := 0, "int")
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
    put_SelectedBorderBrush(value) {
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedPressedBorderBrush() {
        result := ComCall(52, this, "ptr*", &value := 0, "int")
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
    put_SelectedPressedBorderBrush(value) {
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedDisabledBorderBrush() {
        result := ComCall(54, this, "ptr*", &value := 0, "int")
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
    put_SelectedDisabledBorderBrush(value) {
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedInnerBorderBrush() {
        result := ComCall(56, this, "ptr*", &value := 0, "int")
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
    put_SelectedInnerBorderBrush(value) {
        result := ComCall(57, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PointerOverBorderBrush() {
        result := ComCall(58, this, "ptr*", &value := 0, "int")
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
    put_PointerOverBorderBrush(value) {
        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
