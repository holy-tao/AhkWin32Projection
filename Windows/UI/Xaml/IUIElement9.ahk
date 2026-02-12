#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ScalarTransition.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include .\Vector3Transition.ahk
#Include ..\..\Foundation\Numerics\Matrix4x4.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElement9 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElement9
     * @type {Guid}
     */
    static IID => Guid("{b4a04776-4e88-50ca-8f2b-08940d6c5f94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanBeScrollAnchor", "put_CanBeScrollAnchor", "get_OpacityTransition", "put_OpacityTransition", "get_Translation", "put_Translation", "get_TranslationTransition", "put_TranslationTransition", "get_Rotation", "put_Rotation", "get_RotationTransition", "put_RotationTransition", "get_Scale", "put_Scale", "get_ScaleTransition", "put_ScaleTransition", "get_TransformMatrix", "put_TransformMatrix", "get_CenterPoint", "put_CenterPoint", "get_RotationAxis", "put_RotationAxis", "StartAnimation", "StopAnimation"]

    /**
     * @type {Boolean} 
     */
    CanBeScrollAnchor {
        get => this.get_CanBeScrollAnchor()
        set => this.put_CanBeScrollAnchor(value)
    }

    /**
     * @type {ScalarTransition} 
     */
    OpacityTransition {
        get => this.get_OpacityTransition()
        set => this.put_OpacityTransition(value)
    }

    /**
     * @type {Vector3} 
     */
    Translation {
        get => this.get_Translation()
        set => this.put_Translation(value)
    }

    /**
     * @type {Vector3Transition} 
     */
    TranslationTransition {
        get => this.get_TranslationTransition()
        set => this.put_TranslationTransition(value)
    }

    /**
     * @type {Float} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * @type {ScalarTransition} 
     */
    RotationTransition {
        get => this.get_RotationTransition()
        set => this.put_RotationTransition(value)
    }

    /**
     * @type {Vector3} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * @type {Vector3Transition} 
     */
    ScaleTransition {
        get => this.get_ScaleTransition()
        set => this.put_ScaleTransition(value)
    }

    /**
     * @type {Matrix4x4} 
     */
    TransformMatrix {
        get => this.get_TransformMatrix()
        set => this.put_TransformMatrix(value)
    }

    /**
     * @type {Vector3} 
     */
    CenterPoint {
        get => this.get_CenterPoint()
        set => this.put_CenterPoint(value)
    }

    /**
     * @type {Vector3} 
     */
    RotationAxis {
        get => this.get_RotationAxis()
        set => this.put_RotationAxis(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanBeScrollAnchor() {
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
    put_CanBeScrollAnchor(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ScalarTransition} 
     */
    get_OpacityTransition() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScalarTransition(value)
    }

    /**
     * 
     * @param {ScalarTransition} value 
     * @returns {HRESULT} 
     */
    put_OpacityTransition(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Translation() {
        value := Vector3()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Translation(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3Transition} 
     */
    get_TranslationTransition() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Vector3Transition(value)
    }

    /**
     * 
     * @param {Vector3Transition} value 
     * @returns {HRESULT} 
     */
    put_TranslationTransition(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Rotation() {
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
    put_Rotation(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ScalarTransition} 
     */
    get_RotationTransition() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScalarTransition(value)
    }

    /**
     * 
     * @param {ScalarTransition} value 
     * @returns {HRESULT} 
     */
    put_RotationTransition(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Scale() {
        value := Vector3()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3Transition} 
     */
    get_ScaleTransition() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Vector3Transition(value)
    }

    /**
     * 
     * @param {Vector3Transition} value 
     * @returns {HRESULT} 
     */
    put_ScaleTransition(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_TransformMatrix() {
        value := Matrix4x4()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Matrix4x4} value 
     * @returns {HRESULT} 
     */
    put_TransformMatrix(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_CenterPoint() {
        value := Vector3()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_CenterPoint(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RotationAxis() {
        value := Vector3()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_RotationAxis(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ICompositionAnimationBase} animation 
     * @returns {HRESULT} 
     */
    StartAnimation(animation) {
        result := ComCall(28, this, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ICompositionAnimationBase} animation 
     * @returns {HRESULT} 
     */
    StopAnimation(animation) {
        result := ComCall(29, this, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
