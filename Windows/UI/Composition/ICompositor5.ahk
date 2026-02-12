#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\BounceScalarNaturalMotionAnimation.ahk
#Include .\BounceVector2NaturalMotionAnimation.ahk
#Include .\BounceVector3NaturalMotionAnimation.ahk
#Include .\CompositionContainerShape.ahk
#Include .\CompositionEllipseGeometry.ahk
#Include .\CompositionLineGeometry.ahk
#Include .\CompositionPathGeometry.ahk
#Include .\PathKeyFrameAnimation.ahk
#Include .\CompositionRectangleGeometry.ahk
#Include .\CompositionRoundedRectangleGeometry.ahk
#Include .\ShapeVisual.ahk
#Include .\CompositionSpriteShape.ahk
#Include .\CompositionViewBox.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositor5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositor5
     * @type {Guid}
     */
    static IID => Guid("{48ea31ad-7fcd-4076-a79c-90cc4b852c9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Comment", "put_Comment", "get_GlobalPlaybackRate", "put_GlobalPlaybackRate", "CreateBounceScalarAnimation", "CreateBounceVector2Animation", "CreateBounceVector3Animation", "CreateContainerShape", "CreateEllipseGeometry", "CreateLineGeometry", "CreatePathGeometry", "CreatePathGeometryWithPath", "CreatePathKeyFrameAnimation", "CreateRectangleGeometry", "CreateRoundedRectangleGeometry", "CreateShapeVisual", "CreateSpriteShape", "CreateSpriteShapeWithGeometry", "CreateViewBox", "RequestCommitAsync"]

    /**
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
        set => this.put_Comment(value)
    }

    /**
     * @type {Float} 
     */
    GlobalPlaybackRate {
        get => this.get_GlobalPlaybackRate()
        set => this.put_GlobalPlaybackRate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Comment(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

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
    get_GlobalPlaybackRate() {
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
    put_GlobalPlaybackRate(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BounceScalarNaturalMotionAnimation} 
     */
    CreateBounceScalarAnimation() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BounceScalarNaturalMotionAnimation(result_)
    }

    /**
     * 
     * @returns {BounceVector2NaturalMotionAnimation} 
     */
    CreateBounceVector2Animation() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BounceVector2NaturalMotionAnimation(result_)
    }

    /**
     * 
     * @returns {BounceVector3NaturalMotionAnimation} 
     */
    CreateBounceVector3Animation() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BounceVector3NaturalMotionAnimation(result_)
    }

    /**
     * 
     * @returns {CompositionContainerShape} 
     */
    CreateContainerShape() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionContainerShape(result_)
    }

    /**
     * 
     * @returns {CompositionEllipseGeometry} 
     */
    CreateEllipseGeometry() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionEllipseGeometry(result_)
    }

    /**
     * 
     * @returns {CompositionLineGeometry} 
     */
    CreateLineGeometry() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionLineGeometry(result_)
    }

    /**
     * 
     * @returns {CompositionPathGeometry} 
     */
    CreatePathGeometry() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionPathGeometry(result_)
    }

    /**
     * 
     * @param {CompositionPath} path_ 
     * @returns {CompositionPathGeometry} 
     */
    CreatePathGeometryWithPath(path_) {
        result := ComCall(17, this, "ptr", path_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionPathGeometry(result_)
    }

    /**
     * 
     * @returns {PathKeyFrameAnimation} 
     */
    CreatePathKeyFrameAnimation() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PathKeyFrameAnimation(result_)
    }

    /**
     * 
     * @returns {CompositionRectangleGeometry} 
     */
    CreateRectangleGeometry() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionRectangleGeometry(result_)
    }

    /**
     * 
     * @returns {CompositionRoundedRectangleGeometry} 
     */
    CreateRoundedRectangleGeometry() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionRoundedRectangleGeometry(result_)
    }

    /**
     * 
     * @returns {ShapeVisual} 
     */
    CreateShapeVisual() {
        result := ComCall(21, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ShapeVisual(result_)
    }

    /**
     * 
     * @returns {CompositionSpriteShape} 
     */
    CreateSpriteShape() {
        result := ComCall(22, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionSpriteShape(result_)
    }

    /**
     * 
     * @param {CompositionGeometry} geometry_ 
     * @returns {CompositionSpriteShape} 
     */
    CreateSpriteShapeWithGeometry(geometry_) {
        result := ComCall(23, this, "ptr", geometry_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionSpriteShape(result_)
    }

    /**
     * 
     * @returns {CompositionViewBox} 
     */
    CreateViewBox() {
        result := ComCall(24, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionViewBox(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    RequestCommitAsync() {
        result := ComCall(25, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
