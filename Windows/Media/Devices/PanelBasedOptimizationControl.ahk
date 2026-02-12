#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPanelBasedOptimizationControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * When supported, allows an app to enable the capture device driver to optimize camera capture functionality based on the panel location of the camera.
 * @remarks
 * <!-- Get an instance of this class by accessing the [VideoDeviceController.PanelBasedOptimizationControl](videodevicecontroller_panelbasedoptimizationcontrol.md) property. -->
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.panelbasedoptimizationcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class PanelBasedOptimizationControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPanelBasedOptimizationControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPanelBasedOptimizationControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether photo confirmation is supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.panelbasedoptimizationcontrol.issupported
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * Gets or sets the panel on which the camera is located, allowing the camera driver to optimize capture based on the camera location.
     * @remarks
     * The only valid values for this property are **Front**, **Back**, and **Unknown** which is used for external camera devices.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.panelbasedoptimizationcontrol.panel
     * @type {Integer} 
     */
    Panel {
        get => this.get_Panel()
        set => this.put_Panel(value)
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
    get_IsSupported() {
        if (!this.HasProp("__IPanelBasedOptimizationControl")) {
            if ((queryResult := this.QueryInterface(IPanelBasedOptimizationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanelBasedOptimizationControl := IPanelBasedOptimizationControl(outPtr)
        }

        return this.__IPanelBasedOptimizationControl.get_IsSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Panel() {
        if (!this.HasProp("__IPanelBasedOptimizationControl")) {
            if ((queryResult := this.QueryInterface(IPanelBasedOptimizationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanelBasedOptimizationControl := IPanelBasedOptimizationControl(outPtr)
        }

        return this.__IPanelBasedOptimizationControl.get_Panel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Panel(value) {
        if (!this.HasProp("__IPanelBasedOptimizationControl")) {
            if ((queryResult := this.QueryInterface(IPanelBasedOptimizationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPanelBasedOptimizationControl := IPanelBasedOptimizationControl(outPtr)
        }

        return this.__IPanelBasedOptimizationControl.put_Panel(value)
    }

;@endregion Instance Methods
}
