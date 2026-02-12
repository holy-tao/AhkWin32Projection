#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionTransform.ahk
#Include .\ISceneModelTransform.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a group of 3-D transforms on a node, including rotation, scale, and translation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemodeltransform
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneModelTransform extends CompositionTransform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneModelTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneModelTransform.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the orientation of the node.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemodeltransform.orientation
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the rotation angle applied to the node, in radians.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemodeltransform.rotationangle
     * @type {Float} 
     */
    RotationAngle {
        get => this.get_RotationAngle()
        set => this.put_RotationAngle(value)
    }

    /**
     * Gets or sets the rotation angle applied to the node, in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemodeltransform.rotationangleindegrees
     * @type {Float} 
     */
    RotationAngleInDegrees {
        get => this.get_RotationAngleInDegrees()
        set => this.put_RotationAngleInDegrees(value)
    }

    /**
     * Gets or sets the axes around which the node is rotated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemodeltransform.rotationaxis
     * @type {Vector3} 
     */
    RotationAxis {
        get => this.get_RotationAxis()
        set => this.put_RotationAxis(value)
    }

    /**
     * Gets or sets the relative size of the node on the x, y, and z axes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemodeltransform.scale
     * @type {Vector3} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * Gets or sets the position of the node on the x, y, and z axes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemodeltransform.translation
     * @type {Vector3} 
     */
    Translation {
        get => this.get_Translation()
        set => this.put_Translation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.get_Orientation()
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.put_Orientation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngle() {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.get_RotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngle(value) {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.put_RotationAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngleInDegrees() {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.get_RotationAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngleInDegrees(value) {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.put_RotationAngleInDegrees(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RotationAxis() {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.get_RotationAxis()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_RotationAxis(value) {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.put_RotationAxis(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Scale() {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.get_Scale()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.put_Scale(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Translation() {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.get_Translation()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Translation(value) {
        if (!this.HasProp("__ISceneModelTransform")) {
            if ((queryResult := this.QueryInterface(ISceneModelTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModelTransform := ISceneModelTransform(outPtr)
        }

        return this.__ISceneModelTransform.put_Translation(value)
    }

;@endregion Instance Methods
}
