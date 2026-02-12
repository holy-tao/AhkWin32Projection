#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IParallaxView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParallaxView
     * @type {Guid}
     */
    static IID => Guid("{6b84fcd4-4083-5b4b-bc40-d9204e19b41a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Child", "put_Child", "get_HorizontalShift", "put_HorizontalShift", "get_HorizontalSourceEndOffset", "put_HorizontalSourceEndOffset", "get_HorizontalSourceOffsetKind", "put_HorizontalSourceOffsetKind", "get_HorizontalSourceStartOffset", "put_HorizontalSourceStartOffset", "get_IsHorizontalShiftClamped", "put_IsHorizontalShiftClamped", "get_IsVerticalShiftClamped", "put_IsVerticalShiftClamped", "get_MaxHorizontalShiftRatio", "put_MaxHorizontalShiftRatio", "get_MaxVerticalShiftRatio", "put_MaxVerticalShiftRatio", "get_Source", "put_Source", "get_VerticalShift", "put_VerticalShift", "get_VerticalSourceEndOffset", "put_VerticalSourceEndOffset", "get_VerticalSourceOffsetKind", "put_VerticalSourceOffsetKind", "get_VerticalSourceStartOffset", "put_VerticalSourceStartOffset", "RefreshAutomaticHorizontalOffsets", "RefreshAutomaticVerticalOffsets"]

    /**
     * @type {UIElement} 
     */
    Child {
        get => this.get_Child()
        set => this.put_Child(value)
    }

    /**
     * @type {Float} 
     */
    HorizontalShift {
        get => this.get_HorizontalShift()
        set => this.put_HorizontalShift(value)
    }

    /**
     * @type {Float} 
     */
    HorizontalSourceEndOffset {
        get => this.get_HorizontalSourceEndOffset()
        set => this.put_HorizontalSourceEndOffset(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalSourceOffsetKind {
        get => this.get_HorizontalSourceOffsetKind()
        set => this.put_HorizontalSourceOffsetKind(value)
    }

    /**
     * @type {Float} 
     */
    HorizontalSourceStartOffset {
        get => this.get_HorizontalSourceStartOffset()
        set => this.put_HorizontalSourceStartOffset(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHorizontalShiftClamped {
        get => this.get_IsHorizontalShiftClamped()
        set => this.put_IsHorizontalShiftClamped(value)
    }

    /**
     * @type {Boolean} 
     */
    IsVerticalShiftClamped {
        get => this.get_IsVerticalShiftClamped()
        set => this.put_IsVerticalShiftClamped(value)
    }

    /**
     * @type {Float} 
     */
    MaxHorizontalShiftRatio {
        get => this.get_MaxHorizontalShiftRatio()
        set => this.put_MaxHorizontalShiftRatio(value)
    }

    /**
     * @type {Float} 
     */
    MaxVerticalShiftRatio {
        get => this.get_MaxVerticalShiftRatio()
        set => this.put_MaxVerticalShiftRatio(value)
    }

    /**
     * @type {UIElement} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {Float} 
     */
    VerticalShift {
        get => this.get_VerticalShift()
        set => this.put_VerticalShift(value)
    }

    /**
     * @type {Float} 
     */
    VerticalSourceEndOffset {
        get => this.get_VerticalSourceEndOffset()
        set => this.put_VerticalSourceEndOffset(value)
    }

    /**
     * @type {Integer} 
     */
    VerticalSourceOffsetKind {
        get => this.get_VerticalSourceOffsetKind()
        set => this.put_VerticalSourceOffsetKind(value)
    }

    /**
     * @type {Float} 
     */
    VerticalSourceStartOffset {
        get => this.get_VerticalSourceStartOffset()
        set => this.put_VerticalSourceStartOffset(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Child() {
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
    put_Child(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalShift() {
        result := ComCall(8, this, "double*", &value := 0, "int")
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
    put_HorizontalShift(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalSourceEndOffset() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_HorizontalSourceEndOffset(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalSourceOffsetKind() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_HorizontalSourceOffsetKind(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalSourceStartOffset() {
        result := ComCall(14, this, "double*", &value := 0, "int")
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
    put_HorizontalSourceStartOffset(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalShiftClamped() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_IsHorizontalShiftClamped(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVerticalShiftClamped() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_IsVerticalShiftClamped(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxHorizontalShiftRatio() {
        result := ComCall(20, this, "double*", &value := 0, "int")
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
    put_MaxHorizontalShiftRatio(value) {
        result := ComCall(21, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxVerticalShiftRatio() {
        result := ComCall(22, this, "double*", &value := 0, "int")
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
    put_MaxVerticalShiftRatio(value) {
        result := ComCall(23, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Source() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
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
    put_Source(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalShift() {
        result := ComCall(26, this, "double*", &value := 0, "int")
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
    put_VerticalShift(value) {
        result := ComCall(27, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalSourceEndOffset() {
        result := ComCall(28, this, "double*", &value := 0, "int")
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
    put_VerticalSourceEndOffset(value) {
        result := ComCall(29, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalSourceOffsetKind() {
        result := ComCall(30, this, "int*", &value := 0, "int")
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
    put_VerticalSourceOffsetKind(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalSourceStartOffset() {
        result := ComCall(32, this, "double*", &value := 0, "int")
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
    put_VerticalSourceStartOffset(value) {
        result := ComCall(33, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshAutomaticHorizontalOffsets() {
        result := ComCall(34, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshAutomaticVerticalOffsets() {
        result := ComCall(35, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
