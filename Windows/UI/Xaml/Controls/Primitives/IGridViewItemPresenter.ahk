#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Media\Brush.ahk
#Include ..\..\Thickness.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IGridViewItemPresenter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridViewItemPresenter
     * @type {Guid}
     */
    static IID => Guid("{214f9010-56e2-4821-8a1c-2305709af94b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionCheckMarkVisualEnabled", "put_SelectionCheckMarkVisualEnabled", "get_CheckHintBrush", "put_CheckHintBrush", "get_CheckSelectingBrush", "put_CheckSelectingBrush", "get_CheckBrush", "put_CheckBrush", "get_DragBackground", "put_DragBackground", "get_DragForeground", "put_DragForeground", "get_FocusBorderBrush", "put_FocusBorderBrush", "get_PlaceholderBackground", "put_PlaceholderBackground", "get_PointerOverBackground", "put_PointerOverBackground", "get_SelectedBackground", "put_SelectedBackground", "get_SelectedForeground", "put_SelectedForeground", "get_SelectedPointerOverBackground", "put_SelectedPointerOverBackground", "get_SelectedPointerOverBorderBrush", "put_SelectedPointerOverBorderBrush", "get_SelectedBorderThickness", "put_SelectedBorderThickness", "get_DisabledOpacity", "put_DisabledOpacity", "get_DragOpacity", "put_DragOpacity", "get_ReorderHintOffset", "put_ReorderHintOffset", "get_GridViewItemPresenterHorizontalContentAlignment", "put_GridViewItemPresenterHorizontalContentAlignment", "get_GridViewItemPresenterVerticalContentAlignment", "put_GridViewItemPresenterVerticalContentAlignment", "get_GridViewItemPresenterPadding", "put_GridViewItemPresenterPadding", "get_PointerOverBackgroundMargin", "put_PointerOverBackgroundMargin", "get_ContentMargin", "put_ContentMargin"]

    /**
     * @type {Boolean} 
     */
    SelectionCheckMarkVisualEnabled {
        get => this.get_SelectionCheckMarkVisualEnabled()
        set => this.put_SelectionCheckMarkVisualEnabled(value)
    }

    /**
     * @type {Brush} 
     */
    CheckHintBrush {
        get => this.get_CheckHintBrush()
        set => this.put_CheckHintBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckSelectingBrush {
        get => this.get_CheckSelectingBrush()
        set => this.put_CheckSelectingBrush(value)
    }

    /**
     * @type {Brush} 
     */
    CheckBrush {
        get => this.get_CheckBrush()
        set => this.put_CheckBrush(value)
    }

    /**
     * @type {Brush} 
     */
    DragBackground {
        get => this.get_DragBackground()
        set => this.put_DragBackground(value)
    }

    /**
     * @type {Brush} 
     */
    DragForeground {
        get => this.get_DragForeground()
        set => this.put_DragForeground(value)
    }

    /**
     * @type {Brush} 
     */
    FocusBorderBrush {
        get => this.get_FocusBorderBrush()
        set => this.put_FocusBorderBrush(value)
    }

    /**
     * @type {Brush} 
     */
    PlaceholderBackground {
        get => this.get_PlaceholderBackground()
        set => this.put_PlaceholderBackground(value)
    }

    /**
     * @type {Brush} 
     */
    PointerOverBackground {
        get => this.get_PointerOverBackground()
        set => this.put_PointerOverBackground(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedBackground {
        get => this.get_SelectedBackground()
        set => this.put_SelectedBackground(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedForeground {
        get => this.get_SelectedForeground()
        set => this.put_SelectedForeground(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedPointerOverBackground {
        get => this.get_SelectedPointerOverBackground()
        set => this.put_SelectedPointerOverBackground(value)
    }

    /**
     * @type {Brush} 
     */
    SelectedPointerOverBorderBrush {
        get => this.get_SelectedPointerOverBorderBrush()
        set => this.put_SelectedPointerOverBorderBrush(value)
    }

    /**
     * @type {Thickness} 
     */
    SelectedBorderThickness {
        get => this.get_SelectedBorderThickness()
        set => this.put_SelectedBorderThickness(value)
    }

    /**
     * @type {Float} 
     */
    DisabledOpacity {
        get => this.get_DisabledOpacity()
        set => this.put_DisabledOpacity(value)
    }

    /**
     * @type {Float} 
     */
    DragOpacity {
        get => this.get_DragOpacity()
        set => this.put_DragOpacity(value)
    }

    /**
     * @type {Float} 
     */
    ReorderHintOffset {
        get => this.get_ReorderHintOffset()
        set => this.put_ReorderHintOffset(value)
    }

    /**
     * @type {Integer} 
     */
    GridViewItemPresenterHorizontalContentAlignment {
        get => this.get_GridViewItemPresenterHorizontalContentAlignment()
        set => this.put_GridViewItemPresenterHorizontalContentAlignment(value)
    }

    /**
     * @type {Integer} 
     */
    GridViewItemPresenterVerticalContentAlignment {
        get => this.get_GridViewItemPresenterVerticalContentAlignment()
        set => this.put_GridViewItemPresenterVerticalContentAlignment(value)
    }

    /**
     * @type {Thickness} 
     */
    GridViewItemPresenterPadding {
        get => this.get_GridViewItemPresenterPadding()
        set => this.put_GridViewItemPresenterPadding(value)
    }

    /**
     * @type {Thickness} 
     */
    PointerOverBackgroundMargin {
        get => this.get_PointerOverBackgroundMargin()
        set => this.put_PointerOverBackgroundMargin(value)
    }

    /**
     * @type {Thickness} 
     */
    ContentMargin {
        get => this.get_ContentMargin()
        set => this.put_ContentMargin(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SelectionCheckMarkVisualEnabled() {
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
    put_SelectionCheckMarkVisualEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_CheckHintBrush() {
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
    put_CheckHintBrush(value) {
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
    get_CheckSelectingBrush() {
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
    put_CheckSelectingBrush(value) {
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
    get_CheckBrush() {
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
    put_CheckBrush(value) {
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
    get_DragBackground() {
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
    put_DragBackground(value) {
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
    get_DragForeground() {
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
    put_DragForeground(value) {
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
    get_FocusBorderBrush() {
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
    put_FocusBorderBrush(value) {
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
    get_PlaceholderBackground() {
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
    put_PlaceholderBackground(value) {
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
    get_PointerOverBackground() {
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
    put_PointerOverBackground(value) {
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
    get_SelectedBackground() {
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
    put_SelectedBackground(value) {
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
    get_SelectedForeground() {
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
    put_SelectedForeground(value) {
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
    get_SelectedPointerOverBackground() {
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
    put_SelectedPointerOverBackground(value) {
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
    get_SelectedPointerOverBorderBrush() {
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
    put_SelectedPointerOverBorderBrush(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_SelectedBorderThickness() {
        value := Thickness()
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_SelectedBorderThickness(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DisabledOpacity() {
        result := ComCall(34, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DisabledOpacity(value) {
        result := ComCall(35, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DragOpacity() {
        result := ComCall(36, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DragOpacity(value) {
        result := ComCall(37, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReorderHintOffset() {
        result := ComCall(38, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ReorderHintOffset(value) {
        result := ComCall(39, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GridViewItemPresenterHorizontalContentAlignment() {
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
    put_GridViewItemPresenterHorizontalContentAlignment(value) {
        result := ComCall(41, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GridViewItemPresenterVerticalContentAlignment() {
        result := ComCall(42, this, "int*", &value := 0, "int")
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
    put_GridViewItemPresenterVerticalContentAlignment(value) {
        result := ComCall(43, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_GridViewItemPresenterPadding() {
        value := Thickness()
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_GridViewItemPresenterPadding(value) {
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_PointerOverBackgroundMargin() {
        value := Thickness()
        result := ComCall(46, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_PointerOverBackgroundMargin(value) {
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_ContentMargin() {
        value := Thickness()
        result := ComCall(48, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_ContentMargin(value) {
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
