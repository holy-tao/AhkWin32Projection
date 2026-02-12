#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRegionsOfInterestControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality to mange the regions of interest on a device.
 * @remarks
 * The region of interest specifies the rectangular area of preview that functions such as focus and exposure are computed over. This enables scenarios such as tap to focus.
 * 
 * You can access the RegionsOfInterestControl for the capture device through the [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * For how-to guidance for using the **RegionOfInterest** object, see [Effects for analyzing camera frames](/windows/uwp/audio-video-camera/scene-analysis-for-media-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionsofinterestcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class RegionsOfInterestControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRegionsOfInterestControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRegionsOfInterestControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of regions of interest that can be specified.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionsofinterestcontrol.maxregions
     * @type {Integer} 
     */
    MaxRegions {
        get => this.get_MaxRegions()
    }

    /**
     * Gets a value that specifies if auto focus is supported on the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionsofinterestcontrol.autofocussupported
     * @type {Boolean} 
     */
    AutoFocusSupported {
        get => this.get_AutoFocusSupported()
    }

    /**
     * Gets a value that specifies if auto white balance is supported on the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionsofinterestcontrol.autowhitebalancesupported
     * @type {Boolean} 
     */
    AutoWhiteBalanceSupported {
        get => this.get_AutoWhiteBalanceSupported()
    }

    /**
     * Gets a value that specifies if auto exposure is supported on the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionsofinterestcontrol.autoexposuresupported
     * @type {Boolean} 
     */
    AutoExposureSupported {
        get => this.get_AutoExposureSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRegions() {
        if (!this.HasProp("__IRegionsOfInterestControl")) {
            if ((queryResult := this.QueryInterface(IRegionsOfInterestControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionsOfInterestControl := IRegionsOfInterestControl(outPtr)
        }

        return this.__IRegionsOfInterestControl.get_MaxRegions()
    }

    /**
     * Asynchronously sets the regions of interest and specifies if the values should be locked.
     * @param {IIterable<RegionOfInterest>} regions The regions of interests.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionsofinterestcontrol.setregionsasync
     */
    SetRegionsAsync(regions) {
        if (!this.HasProp("__IRegionsOfInterestControl")) {
            if ((queryResult := this.QueryInterface(IRegionsOfInterestControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionsOfInterestControl := IRegionsOfInterestControl(outPtr)
        }

        return this.__IRegionsOfInterestControl.SetRegionsAsync(regions)
    }

    /**
     * Asynchronously sets the regions of interest.
     * @param {IIterable<RegionOfInterest>} regions The regions of interest.
     * @param {Boolean} lockValues 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionsofinterestcontrol.setregionsasync
     */
    SetRegionsWithLockAsync(regions, lockValues) {
        if (!this.HasProp("__IRegionsOfInterestControl")) {
            if ((queryResult := this.QueryInterface(IRegionsOfInterestControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionsOfInterestControl := IRegionsOfInterestControl(outPtr)
        }

        return this.__IRegionsOfInterestControl.SetRegionsWithLockAsync(regions, lockValues)
    }

    /**
     * Asynchronously clears the regions of interests.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.regionsofinterestcontrol.clearregionsasync
     */
    ClearRegionsAsync() {
        if (!this.HasProp("__IRegionsOfInterestControl")) {
            if ((queryResult := this.QueryInterface(IRegionsOfInterestControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionsOfInterestControl := IRegionsOfInterestControl(outPtr)
        }

        return this.__IRegionsOfInterestControl.ClearRegionsAsync()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoFocusSupported() {
        if (!this.HasProp("__IRegionsOfInterestControl")) {
            if ((queryResult := this.QueryInterface(IRegionsOfInterestControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionsOfInterestControl := IRegionsOfInterestControl(outPtr)
        }

        return this.__IRegionsOfInterestControl.get_AutoFocusSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoWhiteBalanceSupported() {
        if (!this.HasProp("__IRegionsOfInterestControl")) {
            if ((queryResult := this.QueryInterface(IRegionsOfInterestControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionsOfInterestControl := IRegionsOfInterestControl(outPtr)
        }

        return this.__IRegionsOfInterestControl.get_AutoWhiteBalanceSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoExposureSupported() {
        if (!this.HasProp("__IRegionsOfInterestControl")) {
            if ((queryResult := this.QueryInterface(IRegionsOfInterestControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegionsOfInterestControl := IRegionsOfInterestControl(outPtr)
        }

        return this.__IRegionsOfInterestControl.get_AutoExposureSupported()
    }

;@endregion Instance Methods
}
