#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionBrush.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionNineGridBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionNineGridBrush
     * @type {Guid}
     */
    static IID => Guid("{f25154e4-bc8c-4be7-b80f-8685b83c0186}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BottomInset", "put_BottomInset", "get_BottomInsetScale", "put_BottomInsetScale", "get_IsCenterHollow", "put_IsCenterHollow", "get_LeftInset", "put_LeftInset", "get_LeftInsetScale", "put_LeftInsetScale", "get_RightInset", "put_RightInset", "get_RightInsetScale", "put_RightInsetScale", "get_Source", "put_Source", "get_TopInset", "put_TopInset", "get_TopInsetScale", "put_TopInsetScale", "SetInsets", "SetInsetsWithValues", "SetInsetScales", "SetInsetScalesWithValues"]

    /**
     * @type {Float} 
     */
    BottomInset {
        get => this.get_BottomInset()
        set => this.put_BottomInset(value)
    }

    /**
     * @type {Float} 
     */
    BottomInsetScale {
        get => this.get_BottomInsetScale()
        set => this.put_BottomInsetScale(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCenterHollow {
        get => this.get_IsCenterHollow()
        set => this.put_IsCenterHollow(value)
    }

    /**
     * @type {Float} 
     */
    LeftInset {
        get => this.get_LeftInset()
        set => this.put_LeftInset(value)
    }

    /**
     * @type {Float} 
     */
    LeftInsetScale {
        get => this.get_LeftInsetScale()
        set => this.put_LeftInsetScale(value)
    }

    /**
     * @type {Float} 
     */
    RightInset {
        get => this.get_RightInset()
        set => this.put_RightInset(value)
    }

    /**
     * @type {Float} 
     */
    RightInsetScale {
        get => this.get_RightInsetScale()
        set => this.put_RightInsetScale(value)
    }

    /**
     * @type {CompositionBrush} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {Float} 
     */
    TopInset {
        get => this.get_TopInset()
        set => this.put_TopInset(value)
    }

    /**
     * @type {Float} 
     */
    TopInsetScale {
        get => this.get_TopInsetScale()
        set => this.put_TopInsetScale(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BottomInset() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_BottomInset(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BottomInsetScale() {
        result := ComCall(8, this, "float*", &value := 0, "int")
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
    put_BottomInsetScale(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCenterHollow() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_IsCenterHollow(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftInset() {
        result := ComCall(12, this, "float*", &value := 0, "int")
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
    put_LeftInset(value) {
        result := ComCall(13, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftInsetScale() {
        result := ComCall(14, this, "float*", &value := 0, "int")
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
    put_LeftInsetScale(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightInset() {
        result := ComCall(16, this, "float*", &value := 0, "int")
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
    put_RightInset(value) {
        result := ComCall(17, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightInsetScale() {
        result := ComCall(18, this, "float*", &value := 0, "int")
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
    put_RightInsetScale(value) {
        result := ComCall(19, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Source() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionBrush(value)
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopInset() {
        result := ComCall(22, this, "float*", &value := 0, "int")
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
    put_TopInset(value) {
        result := ComCall(23, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopInsetScale() {
        result := ComCall(24, this, "float*", &value := 0, "int")
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
    put_TopInsetScale(value) {
        result := ComCall(25, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} inset 
     * @returns {HRESULT} 
     */
    SetInsets(inset) {
        result := ComCall(26, this, "float", inset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} left 
     * @param {Float} top 
     * @param {Float} right 
     * @param {Float} bottom 
     * @returns {HRESULT} 
     */
    SetInsetsWithValues(left, top, right, bottom) {
        result := ComCall(27, this, "float", left, "float", top, "float", right, "float", bottom, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} scale 
     * @returns {HRESULT} 
     */
    SetInsetScales(scale) {
        result := ComCall(28, this, "float", scale, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} left 
     * @param {Float} top 
     * @param {Float} right 
     * @param {Float} bottom 
     * @returns {HRESULT} 
     */
    SetInsetScalesWithValues(left, top, right, bottom) {
        result := ComCall(29, this, "float", left, "float", top, "float", right, "float", bottom, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
