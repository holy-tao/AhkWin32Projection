#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionController.ahk
#Include .\ISpatialInteractionController2.ahk
#Include .\ISpatialInteractionController3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the specifics of a motion controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the motion controller has a touchpad.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller.hastouchpad
     * @type {Boolean} 
     */
    HasTouchpad {
        get => this.get_HasTouchpad()
    }

    /**
     * Gets whether the motion controller has a thumbstick.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller.hasthumbstick
     * @type {Boolean} 
     */
    HasThumbstick {
        get => this.get_HasThumbstick()
    }

    /**
     * Provides access to the motion controller's ability to vibrate in the user's hand.
     * @remarks
     * If this motion controller supports haptics, this property returns a [SimpleHapticsController](../windows.devices.haptics/simplehapticscontroller.md) object that provides access to the controller's vibration functionality.  Otherwise, this property returns null.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller.simplehapticscontroller
     * @type {SimpleHapticsController} 
     */
    SimpleHapticsController {
        get => this.get_SimpleHapticsController()
    }

    /**
     * Gets the vendor identifier for this motion controller.
     * @remarks
     * The VendorId, [ProductId](spatialinteractioncontroller_productid.md) and [Version](spatialinteractioncontroller_version.md) properties can be used together to identify a particular controller design.  This can then be used on occluded Mixed Reality headsets to choose a matching render model to display in the user's surroundings.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller.vendorid
     * @type {Integer} 
     */
    VendorId {
        get => this.get_VendorId()
    }

    /**
     * Gets the product identifier for this motion controller.
     * @remarks
     * The [VendorId](spatialinteractioncontroller_vendorid.md), ProductId and [Version](spatialinteractioncontroller_version.md) properties can be used together to identify a particular controller design.  This can then be used on occluded Mixed Reality headsets to choose a matching render model to display in the user's surroundings.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller.productid
     * @type {Integer} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * Gets the version, or revision, number for this motion controller.
     * @remarks
     * The [VendorId](spatialinteractioncontroller_vendorid.md), [ProductId](spatialinteractioncontroller_productid.md) and Version properties can be used together to identify a particular controller design.  This can then be used on occluded Mixed Reality headsets to choose a matching render model to display in the user's surroundings.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller.version
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasTouchpad() {
        if (!this.HasProp("__ISpatialInteractionController")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionController := ISpatialInteractionController(outPtr)
        }

        return this.__ISpatialInteractionController.get_HasTouchpad()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasThumbstick() {
        if (!this.HasProp("__ISpatialInteractionController")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionController := ISpatialInteractionController(outPtr)
        }

        return this.__ISpatialInteractionController.get_HasThumbstick()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__ISpatialInteractionController")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionController := ISpatialInteractionController(outPtr)
        }

        return this.__ISpatialInteractionController.get_SimpleHapticsController()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VendorId() {
        if (!this.HasProp("__ISpatialInteractionController")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionController := ISpatialInteractionController(outPtr)
        }

        return this.__ISpatialInteractionController.get_VendorId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProductId() {
        if (!this.HasProp("__ISpatialInteractionController")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionController := ISpatialInteractionController(outPtr)
        }

        return this.__ISpatialInteractionController.get_ProductId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        if (!this.HasProp("__ISpatialInteractionController")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionController := ISpatialInteractionController(outPtr)
        }

        return this.__ISpatialInteractionController.get_Version()
    }

    /**
     * Gets a renderable model stream for this controller, which can be unpacked and rendered to represent this controller.
     * @remarks
     * The model stream is returned as a glTF 2.0 Core binary file.  Apps may articulate the model to match the motion of the controller's component parts by updating the transforms of the nodes in the model's internal hierarchy.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller.trygetrenderablemodelasync
     */
    TryGetRenderableModelAsync() {
        if (!this.HasProp("__ISpatialInteractionController2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionController2 := ISpatialInteractionController2(outPtr)
        }

        return this.__ISpatialInteractionController2.TryGetRenderableModelAsync()
    }

    /**
     * Gets information about the motion controller's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontroller.trygetbatteryreport
     */
    TryGetBatteryReport() {
        if (!this.HasProp("__ISpatialInteractionController3")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionController3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionController3 := ISpatialInteractionController3(outPtr)
        }

        return this.__ISpatialInteractionController3.TryGetBatteryReport()
    }

;@endregion Instance Methods
}
