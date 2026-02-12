#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileMixedRealityModel.ahk
#Include .\ITileMixedRealityModel2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a 3D model asset for use as an app launcher in the Windows Mixed Reality home environment.
 * @remarks
 * For more information, see [Implementing 3D app launchers](https://developer.microsoft.com/windows/mixed-reality/implementing_3d_app_launchers).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.tilemixedrealitymodel
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class TileMixedRealityModel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITileMixedRealityModel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITileMixedRealityModel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the path to the mixed reality model.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.tilemixedrealitymodel.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets or sets the bounding box that defines the size of the model in the Windows Mixed Reality home in meters.
     * @remarks
     * If a bounding box is not specified, it will be calculated automatically after the model is loaded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.tilemixedrealitymodel.boundingbox
     * @type {IReference<SpatialBoundingBox>} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
        set => this.put_BoundingBox(value)
    }

    /**
     * Gets or sets what the system does when the user selects this tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.tilemixedrealitymodel.activationbehavior
     * @type {Integer} 
     */
    ActivationBehavior {
        get => this.get_ActivationBehavior()
        set => this.put_ActivationBehavior(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__ITileMixedRealityModel")) {
            if ((queryResult := this.QueryInterface(ITileMixedRealityModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileMixedRealityModel := ITileMixedRealityModel(outPtr)
        }

        return this.__ITileMixedRealityModel.put_Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__ITileMixedRealityModel")) {
            if ((queryResult := this.QueryInterface(ITileMixedRealityModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileMixedRealityModel := ITileMixedRealityModel(outPtr)
        }

        return this.__ITileMixedRealityModel.get_Uri()
    }

    /**
     * 
     * @param {IReference<SpatialBoundingBox>} value 
     * @returns {HRESULT} 
     */
    put_BoundingBox(value) {
        if (!this.HasProp("__ITileMixedRealityModel")) {
            if ((queryResult := this.QueryInterface(ITileMixedRealityModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileMixedRealityModel := ITileMixedRealityModel(outPtr)
        }

        return this.__ITileMixedRealityModel.put_BoundingBox(value)
    }

    /**
     * 
     * @returns {IReference<SpatialBoundingBox>} 
     */
    get_BoundingBox() {
        if (!this.HasProp("__ITileMixedRealityModel")) {
            if ((queryResult := this.QueryInterface(ITileMixedRealityModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileMixedRealityModel := ITileMixedRealityModel(outPtr)
        }

        return this.__ITileMixedRealityModel.get_BoundingBox()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ActivationBehavior(value) {
        if (!this.HasProp("__ITileMixedRealityModel2")) {
            if ((queryResult := this.QueryInterface(ITileMixedRealityModel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileMixedRealityModel2 := ITileMixedRealityModel2(outPtr)
        }

        return this.__ITileMixedRealityModel2.put_ActivationBehavior(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivationBehavior() {
        if (!this.HasProp("__ITileMixedRealityModel2")) {
            if ((queryResult := this.QueryInterface(ITileMixedRealityModel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileMixedRealityModel2 := ITileMixedRealityModel2(outPtr)
        }

        return this.__ITileMixedRealityModel2.get_ActivationBehavior()
    }

;@endregion Instance Methods
}
