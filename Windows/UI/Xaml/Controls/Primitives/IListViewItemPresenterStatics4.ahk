#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IListViewItemPresenterStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewItemPresenterStatics4
     * @type {Guid}
     */
    static IID => Guid("{3917159e-74a1-5e7e-a743-e45be9fb919b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedDisabledBackgroundProperty", "get_CheckPressedBrushProperty", "get_CheckDisabledBrushProperty", "get_CheckBoxPointerOverBrushProperty", "get_CheckBoxPressedBrushProperty", "get_CheckBoxDisabledBrushProperty", "get_CheckBoxSelectedBrushProperty", "get_CheckBoxSelectedPointerOverBrushProperty", "get_CheckBoxSelectedPressedBrushProperty", "get_CheckBoxSelectedDisabledBrushProperty", "get_CheckBoxBorderBrushProperty", "get_CheckBoxPointerOverBorderBrushProperty", "get_CheckBoxPressedBorderBrushProperty", "get_CheckBoxDisabledBorderBrushProperty", "get_CheckBoxCornerRadiusProperty", "get_SelectionIndicatorCornerRadiusProperty", "get_SelectionIndicatorVisualEnabledProperty", "get_SelectionIndicatorModeProperty", "get_SelectionIndicatorBrushProperty", "get_SelectionIndicatorPointerOverBrushProperty", "get_SelectionIndicatorPressedBrushProperty", "get_SelectionIndicatorDisabledBrushProperty", "get_SelectedBorderBrushProperty", "get_SelectedPressedBorderBrushProperty", "get_SelectedDisabledBorderBrushProperty", "get_SelectedInnerBorderBrushProperty", "get_PointerOverBorderBrushProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectedDisabledBackgroundProperty {
        get => this.get_SelectedDisabledBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckPressedBrushProperty {
        get => this.get_CheckPressedBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckDisabledBrushProperty {
        get => this.get_CheckDisabledBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxPointerOverBrushProperty {
        get => this.get_CheckBoxPointerOverBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxPressedBrushProperty {
        get => this.get_CheckBoxPressedBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxDisabledBrushProperty {
        get => this.get_CheckBoxDisabledBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxSelectedBrushProperty {
        get => this.get_CheckBoxSelectedBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxSelectedPointerOverBrushProperty {
        get => this.get_CheckBoxSelectedPointerOverBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxSelectedPressedBrushProperty {
        get => this.get_CheckBoxSelectedPressedBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxSelectedDisabledBrushProperty {
        get => this.get_CheckBoxSelectedDisabledBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxBorderBrushProperty {
        get => this.get_CheckBoxBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxPointerOverBorderBrushProperty {
        get => this.get_CheckBoxPointerOverBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxPressedBorderBrushProperty {
        get => this.get_CheckBoxPressedBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxDisabledBorderBrushProperty {
        get => this.get_CheckBoxDisabledBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBoxCornerRadiusProperty {
        get => this.get_CheckBoxCornerRadiusProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionIndicatorCornerRadiusProperty {
        get => this.get_SelectionIndicatorCornerRadiusProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionIndicatorVisualEnabledProperty {
        get => this.get_SelectionIndicatorVisualEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionIndicatorModeProperty {
        get => this.get_SelectionIndicatorModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionIndicatorBrushProperty {
        get => this.get_SelectionIndicatorBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionIndicatorPointerOverBrushProperty {
        get => this.get_SelectionIndicatorPointerOverBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionIndicatorPressedBrushProperty {
        get => this.get_SelectionIndicatorPressedBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionIndicatorDisabledBrushProperty {
        get => this.get_SelectionIndicatorDisabledBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedBorderBrushProperty {
        get => this.get_SelectedBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedPressedBorderBrushProperty {
        get => this.get_SelectedPressedBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedDisabledBorderBrushProperty {
        get => this.get_SelectedDisabledBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedInnerBorderBrushProperty {
        get => this.get_SelectedInnerBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerOverBorderBrushProperty {
        get => this.get_PointerOverBorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedDisabledBackgroundProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckPressedBrushProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckDisabledBrushProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxPointerOverBrushProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxPressedBrushProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxDisabledBrushProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxSelectedBrushProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxSelectedPointerOverBrushProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxSelectedPressedBrushProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxSelectedDisabledBrushProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxBorderBrushProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxPointerOverBorderBrushProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxPressedBorderBrushProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxDisabledBorderBrushProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CheckBoxCornerRadiusProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionIndicatorCornerRadiusProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionIndicatorVisualEnabledProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionIndicatorModeProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionIndicatorBrushProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionIndicatorPointerOverBrushProperty() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionIndicatorPressedBrushProperty() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionIndicatorDisabledBrushProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedBorderBrushProperty() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedPressedBorderBrushProperty() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedDisabledBorderBrushProperty() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedInnerBorderBrushProperty() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PointerOverBorderBrushProperty() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
