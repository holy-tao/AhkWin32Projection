#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector2.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include .\CompositionClip.ahk
#Include ..\..\Foundation\Numerics\Quaternion.ahk
#Include .\ContainerVisual.ahk
#Include ..\..\Foundation\Numerics\Matrix4x4.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Marks an object to indicate to the system that it can resolve to a composition [Visual](visual.md).
 * @remarks
 * This interface is implemented by [UIElement](../windows.ui.xaml/uielement.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ivisualelement
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IVisual extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisual
     * @type {Guid}
     */
    static IID => Guid("{117e202d-a859-4c89-873b-c2aa566788e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnchorPoint", "put_AnchorPoint", "get_BackfaceVisibility", "put_BackfaceVisibility", "get_BorderMode", "put_BorderMode", "get_CenterPoint", "put_CenterPoint", "get_Clip", "put_Clip", "get_CompositeMode", "put_CompositeMode", "get_IsVisible", "put_IsVisible", "get_Offset", "put_Offset", "get_Opacity", "put_Opacity", "get_Orientation", "put_Orientation", "get_Parent", "get_RotationAngle", "put_RotationAngle", "get_RotationAngleInDegrees", "put_RotationAngleInDegrees", "get_RotationAxis", "put_RotationAxis", "get_Scale", "put_Scale", "get_Size", "put_Size", "get_TransformMatrix", "put_TransformMatrix"]

    /**
     * @type {Vector2} 
     */
    AnchorPoint {
        get => this.get_AnchorPoint()
        set => this.put_AnchorPoint(value)
    }

    /**
     * @type {Integer} 
     */
    BackfaceVisibility {
        get => this.get_BackfaceVisibility()
        set => this.put_BackfaceVisibility(value)
    }

    /**
     * @type {Integer} 
     */
    BorderMode {
        get => this.get_BorderMode()
        set => this.put_BorderMode(value)
    }

    /**
     * @type {Vector3} 
     */
    CenterPoint {
        get => this.get_CenterPoint()
        set => this.put_CenterPoint(value)
    }

    /**
     * @type {CompositionClip} 
     */
    Clip {
        get => this.get_Clip()
        set => this.put_Clip(value)
    }

    /**
     * @type {Integer} 
     */
    CompositeMode {
        get => this.get_CompositeMode()
        set => this.put_CompositeMode(value)
    }

    /**
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
        set => this.put_IsVisible(value)
    }

    /**
     * @type {Vector3} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * @type {ContainerVisual} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {Float} 
     */
    RotationAngle {
        get => this.get_RotationAngle()
        set => this.put_RotationAngle(value)
    }

    /**
     * @type {Float} 
     */
    RotationAngleInDegrees {
        get => this.get_RotationAngleInDegrees()
        set => this.put_RotationAngleInDegrees(value)
    }

    /**
     * @type {Vector3} 
     */
    RotationAxis {
        get => this.get_RotationAxis()
        set => this.put_RotationAxis(value)
    }

    /**
     * @type {Vector3} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * @type {Vector2} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * @type {Matrix4x4} 
     */
    TransformMatrix {
        get => this.get_TransformMatrix()
        set => this.put_TransformMatrix(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_AnchorPoint() {
        value := Vector2()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_AnchorPoint(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackfaceVisibility() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_BackfaceVisibility(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BorderMode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_BorderMode(value) {
        result := ComCall(11, this, "int", value, "int")
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
        result := ComCall(12, this, "ptr", value, "int")
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
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionClip} 
     */
    get_Clip() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionClip(value)
    }

    /**
     * 
     * @param {CompositionClip} value 
     * @returns {HRESULT} 
     */
    put_Clip(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompositeMode() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_CompositeMode(value) {
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
    get_IsVisible() {
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
    put_IsVisible(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Offset() {
        value := Vector3()
        result := ComCall(20, this, "ptr", value, "int")
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
    put_Offset(value) {
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
    get_Opacity() {
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
    put_Opacity(value) {
        result := ComCall(23, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        value := Quaternion()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ContainerVisual} 
     */
    get_Parent() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContainerVisual(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngle() {
        result := ComCall(27, this, "float*", &value := 0, "int")
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
    put_RotationAngle(value) {
        result := ComCall(28, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngleInDegrees() {
        result := ComCall(29, this, "float*", &value := 0, "int")
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
    put_RotationAngleInDegrees(value) {
        result := ComCall(30, this, "float", value, "int")
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
        result := ComCall(31, this, "ptr", value, "int")
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
        result := ComCall(32, this, "ptr", value, "int")
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
        result := ComCall(33, this, "ptr", value, "int")
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
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Size() {
        value := Vector2()
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        result := ComCall(36, this, "ptr", value, "int")
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
        result := ComCall(37, this, "ptr", value, "int")
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
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
