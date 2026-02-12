#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameFlashCapabilities.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the flash capabilities of the capture device for frames in a variable photo sequences.
 * @remarks
 * Get an instance of this class by accessing the [FrameControlCapabilities.Flash](framecontrolcapabilities_flash.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcapabilities
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameFlashCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameFlashCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameFlashCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the flash control for frames in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcapabilities.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets a value indicating whether red eye reduction is supported for frames in a variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcapabilities.redeyereductionsupported
     * @type {Boolean} 
     */
    RedEyeReductionSupported {
        get => this.get_RedEyeReductionSupported()
    }

    /**
     * Gets a value indicating whether flash power is supported for frames in a variable photo sequences.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcapabilities.powersupported
     * @type {Boolean} 
     */
    PowerSupported {
        get => this.get_PowerSupported()
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
    get_Supported() {
        if (!this.HasProp("__IFrameFlashCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameFlashCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashCapabilities := IFrameFlashCapabilities(outPtr)
        }

        return this.__IFrameFlashCapabilities.get_Supported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RedEyeReductionSupported() {
        if (!this.HasProp("__IFrameFlashCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameFlashCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashCapabilities := IFrameFlashCapabilities(outPtr)
        }

        return this.__IFrameFlashCapabilities.get_RedEyeReductionSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PowerSupported() {
        if (!this.HasProp("__IFrameFlashCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameFlashCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashCapabilities := IFrameFlashCapabilities(outPtr)
        }

        return this.__IFrameFlashCapabilities.get_PowerSupported()
    }

;@endregion Instance Methods
}
