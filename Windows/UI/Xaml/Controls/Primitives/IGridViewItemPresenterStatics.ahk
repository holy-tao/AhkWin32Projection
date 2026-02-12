#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IGridViewItemPresenterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridViewItemPresenterStatics
     * @type {Guid}
     */
    static IID => Guid("{e958f8c4-277e-4a72-a01e-9e1688980178}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionCheckMarkVisualEnabledProperty", "get_CheckHintBrushProperty", "get_CheckSelectingBrushProperty", "get_CheckBrushProperty", "get_DragBackgroundProperty", "get_DragForegroundProperty", "get_FocusBorderBrushProperty", "get_PlaceholderBackgroundProperty", "get_PointerOverBackgroundProperty", "get_SelectedBackgroundProperty", "get_SelectedForegroundProperty", "get_SelectedPointerOverBackgroundProperty", "get_SelectedPointerOverBorderBrushProperty", "get_SelectedBorderThicknessProperty", "get_DisabledOpacityProperty", "get_DragOpacityProperty", "get_ReorderHintOffsetProperty", "get_GridViewItemPresenterHorizontalContentAlignmentProperty", "get_GridViewItemPresenterVerticalContentAlignmentProperty", "get_GridViewItemPresenterPaddingProperty", "get_PointerOverBackgroundMarginProperty", "get_ContentMarginProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectionCheckMarkVisualEnabledProperty {
        get => this.get_SelectionCheckMarkVisualEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckHintBrushProperty {
        get => this.get_CheckHintBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckSelectingBrushProperty {
        get => this.get_CheckSelectingBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CheckBrushProperty {
        get => this.get_CheckBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DragBackgroundProperty {
        get => this.get_DragBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DragForegroundProperty {
        get => this.get_DragForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FocusBorderBrushProperty {
        get => this.get_FocusBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlaceholderBackgroundProperty {
        get => this.get_PlaceholderBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerOverBackgroundProperty {
        get => this.get_PointerOverBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedBackgroundProperty {
        get => this.get_SelectedBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedForegroundProperty {
        get => this.get_SelectedForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedPointerOverBackgroundProperty {
        get => this.get_SelectedPointerOverBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedPointerOverBorderBrushProperty {
        get => this.get_SelectedPointerOverBorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedBorderThicknessProperty {
        get => this.get_SelectedBorderThicknessProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DisabledOpacityProperty {
        get => this.get_DisabledOpacityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DragOpacityProperty {
        get => this.get_DragOpacityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ReorderHintOffsetProperty {
        get => this.get_ReorderHintOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GridViewItemPresenterHorizontalContentAlignmentProperty {
        get => this.get_GridViewItemPresenterHorizontalContentAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GridViewItemPresenterVerticalContentAlignmentProperty {
        get => this.get_GridViewItemPresenterVerticalContentAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GridViewItemPresenterPaddingProperty {
        get => this.get_GridViewItemPresenterPaddingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerOverBackgroundMarginProperty {
        get => this.get_PointerOverBackgroundMarginProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentMarginProperty {
        get => this.get_ContentMarginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionCheckMarkVisualEnabledProperty() {
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
    get_CheckHintBrushProperty() {
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
    get_CheckSelectingBrushProperty() {
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
    get_CheckBrushProperty() {
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
    get_DragBackgroundProperty() {
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
    get_DragForegroundProperty() {
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
    get_FocusBorderBrushProperty() {
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
    get_PlaceholderBackgroundProperty() {
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
    get_PointerOverBackgroundProperty() {
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
    get_SelectedBackgroundProperty() {
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
    get_SelectedForegroundProperty() {
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
    get_SelectedPointerOverBackgroundProperty() {
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
    get_SelectedPointerOverBorderBrushProperty() {
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
    get_SelectedBorderThicknessProperty() {
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
    get_DisabledOpacityProperty() {
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
    get_DragOpacityProperty() {
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
    get_ReorderHintOffsetProperty() {
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
    get_GridViewItemPresenterHorizontalContentAlignmentProperty() {
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
    get_GridViewItemPresenterVerticalContentAlignmentProperty() {
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
    get_GridViewItemPresenterPaddingProperty() {
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
    get_PointerOverBackgroundMarginProperty() {
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
    get_ContentMarginProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
