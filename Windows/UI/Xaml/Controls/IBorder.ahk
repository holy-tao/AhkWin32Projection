#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Brush.ahk
#Include ..\Thickness.ahk
#Include ..\CornerRadius.ahk
#Include ..\UIElement.ahk
#Include ..\Media\Animation\TransitionCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IBorder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBorder
     * @type {Guid}
     */
    static IID => Guid("{797c4539-45bd-4633-a044-bfb02ef5170f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BorderBrush", "put_BorderBrush", "get_BorderThickness", "put_BorderThickness", "get_Background", "put_Background", "get_CornerRadius", "put_CornerRadius", "get_Padding", "put_Padding", "get_Child", "put_Child", "get_ChildTransitions", "put_ChildTransitions"]

    /**
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
        set => this.put_BorderBrush(value)
    }

    /**
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
        set => this.put_BorderThickness(value)
    }

    /**
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * @type {CornerRadius} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * @type {UIElement} 
     */
    Child {
        get => this.get_Child()
        set => this.put_Child(value)
    }

    /**
     * @type {TransitionCollection} 
     */
    ChildTransitions {
        get => this.get_ChildTransitions()
        set => this.put_ChildTransitions(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
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
    put_BorderBrush(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        value := Thickness()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_BorderThickness(value) {
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
    get_Background() {
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
    put_Background(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CornerRadius() {
        value := CornerRadius()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_CornerRadius(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        value := Thickness()
        result := ComCall(14, this, "ptr", value, "int")
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
    put_Padding(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Child() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
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
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ChildTransitions() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ChildTransitions(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
