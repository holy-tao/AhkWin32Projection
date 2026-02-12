#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SceneObject.ahk
#Include .\ISceneBoundingBox.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a box that encloses a 3D scene.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.sceneboundingbox
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneBoundingBox extends SceneObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneBoundingBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneBoundingBox.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the center of the bounding box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.sceneboundingbox.center
     * @type {Vector3} 
     */
    Center {
        get => this.get_Center()
    }

    /**
     * Gets the extents of the bounding box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.sceneboundingbox.extents
     * @type {Vector3} 
     */
    Extents {
        get => this.get_Extents()
    }

    /**
     * Gets the maximum coordinates of the bounding box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.sceneboundingbox.max
     * @type {Vector3} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the minimum coordinates of the bounding box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.sceneboundingbox.min
     * @type {Vector3} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the size of the bounding box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.sceneboundingbox.size
     * @type {Vector3} 
     */
    Size {
        get => this.get_Size()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Center() {
        if (!this.HasProp("__ISceneBoundingBox")) {
            if ((queryResult := this.QueryInterface(ISceneBoundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneBoundingBox := ISceneBoundingBox(outPtr)
        }

        return this.__ISceneBoundingBox.get_Center()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Extents() {
        if (!this.HasProp("__ISceneBoundingBox")) {
            if ((queryResult := this.QueryInterface(ISceneBoundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneBoundingBox := ISceneBoundingBox(outPtr)
        }

        return this.__ISceneBoundingBox.get_Extents()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Max() {
        if (!this.HasProp("__ISceneBoundingBox")) {
            if ((queryResult := this.QueryInterface(ISceneBoundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneBoundingBox := ISceneBoundingBox(outPtr)
        }

        return this.__ISceneBoundingBox.get_Max()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Min() {
        if (!this.HasProp("__ISceneBoundingBox")) {
            if ((queryResult := this.QueryInterface(ISceneBoundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneBoundingBox := ISceneBoundingBox(outPtr)
        }

        return this.__ISceneBoundingBox.get_Min()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Size() {
        if (!this.HasProp("__ISceneBoundingBox")) {
            if ((queryResult := this.QueryInterface(ISceneBoundingBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneBoundingBox := ISceneBoundingBox(outPtr)
        }

        return this.__ISceneBoundingBox.get_Size()
    }

;@endregion Instance Methods
}
