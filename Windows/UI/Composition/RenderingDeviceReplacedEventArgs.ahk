#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\IRenderingDeviceReplacedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Arguments for the [RenderingDeviceReplaced](compositiongraphicsdevice_renderingdevicereplaced.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.renderingdevicereplacedeventargs
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class RenderingDeviceReplacedEventArgs extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRenderingDeviceReplacedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRenderingDeviceReplacedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The new graphics device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.renderingdevicereplacedeventargs.graphicsdevice
     * @type {CompositionGraphicsDevice} 
     */
    GraphicsDevice {
        get => this.get_GraphicsDevice()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionGraphicsDevice} 
     */
    get_GraphicsDevice() {
        if (!this.HasProp("__IRenderingDeviceReplacedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRenderingDeviceReplacedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRenderingDeviceReplacedEventArgs := IRenderingDeviceReplacedEventArgs(outPtr)
        }

        return this.__IRenderingDeviceReplacedEventArgs.get_GraphicsDevice()
    }

;@endregion Instance Methods
}
