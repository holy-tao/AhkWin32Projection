#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHdmiDisplayInformation.ahk
#Include .\IHdmiDisplayInformationStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\HdmiDisplayInformation.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a class containing methods which can be used to interact with the display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayinformation
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class HdmiDisplayInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHdmiDisplayInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHdmiDisplayInformation.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the [HdmiDisplayInformation](hdmidisplayinformation.md) object which is the display info of a video content that is currently sent to a display, like a TV or monitor.
     * @returns {HdmiDisplayInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayinformation.getforcurrentview
     */
    static GetForCurrentView() {
        if (!HdmiDisplayInformation.HasProp("__IHdmiDisplayInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.Core.HdmiDisplayInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHdmiDisplayInformationStatics.IID)
            HdmiDisplayInformation.__IHdmiDisplayInformationStatics := IHdmiDisplayInformationStatics(factoryPtr)
        }

        return HdmiDisplayInformation.__IHdmiDisplayInformationStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDisplayModesChangedToken")) {
            this.remove_DisplayModesChanged(this.__OnDisplayModesChangedToken)
            this.__OnDisplayModesChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets the display modes that are supported by your current display. This is determined in combination by your device type, specifications, and settings.
     * @returns {IVectorView<HdmiDisplayMode>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayinformation.getsupporteddisplaymodes
     */
    GetSupportedDisplayModes() {
        if (!this.HasProp("__IHdmiDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayInformation := IHdmiDisplayInformation(outPtr)
        }

        return this.__IHdmiDisplayInformation.GetSupportedDisplayModes()
    }

    /**
     * Gets the [HdmiDisplayMode](hdmidisplaymode.md) object, which provides info about the current display mode of a connected device, like a TV.
     * @returns {HdmiDisplayMode} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayinformation.getcurrentdisplaymode
     */
    GetCurrentDisplayMode() {
        if (!this.HasProp("__IHdmiDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayInformation := IHdmiDisplayInformation(outPtr)
        }

        return this.__IHdmiDisplayInformation.GetCurrentDisplayMode()
    }

    /**
     * Sets the display to the back to default settings.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayinformation.setdefaultdisplaymodeasync
     */
    SetDefaultDisplayModeAsync() {
        if (!this.HasProp("__IHdmiDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayInformation := IHdmiDisplayInformation(outPtr)
        }

        return this.__IHdmiDisplayInformation.SetDefaultDisplayModeAsync()
    }

    /**
     * Sends request to set only the display mode and HDR option for the display.
     * @param {HdmiDisplayMode} mode_ The display mode.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayinformation.requestsetcurrentdisplaymodeasync
     */
    RequestSetCurrentDisplayModeAsync(mode_) {
        if (!this.HasProp("__IHdmiDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayInformation := IHdmiDisplayInformation(outPtr)
        }

        return this.__IHdmiDisplayInformation.RequestSetCurrentDisplayModeAsync(mode_)
    }

    /**
     * Sends request to set the display according to the input parameters.
     * @param {HdmiDisplayMode} mode_ The display mode.
     * @param {Integer} hdrOption The electro-optical transfer function (EOTF) used to master the HDR content.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayinformation.requestsetcurrentdisplaymodeasync
     */
    RequestSetCurrentDisplayModeWithHdrAsync(mode_, hdrOption) {
        if (!this.HasProp("__IHdmiDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayInformation := IHdmiDisplayInformation(outPtr)
        }

        return this.__IHdmiDisplayInformation.RequestSetCurrentDisplayModeWithHdrAsync(mode_, hdrOption)
    }

    /**
     * Sends request to set only the display mode for the display.
     * @param {HdmiDisplayMode} mode_ 
     * @param {Integer} hdrOption 
     * @param {HdmiDisplayHdr2086Metadata} hdrMetadata 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayinformation.requestsetcurrentdisplaymodeasync
     */
    RequestSetCurrentDisplayModeWithHdrAndMetadataAsync(mode_, hdrOption, hdrMetadata) {
        if (!this.HasProp("__IHdmiDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayInformation := IHdmiDisplayInformation(outPtr)
        }

        return this.__IHdmiDisplayInformation.RequestSetCurrentDisplayModeWithHdrAndMetadataAsync(mode_, hdrOption, hdrMetadata)
    }

    /**
     * 
     * @param {TypedEventHandler<HdmiDisplayInformation, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_DisplayModesChanged(value) {
        if (!this.HasProp("__IHdmiDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayInformation := IHdmiDisplayInformation(outPtr)
        }

        return this.__IHdmiDisplayInformation.add_DisplayModesChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DisplayModesChanged(token) {
        if (!this.HasProp("__IHdmiDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IHdmiDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdmiDisplayInformation := IHdmiDisplayInformation(outPtr)
        }

        return this.__IHdmiDisplayInformation.remove_DisplayModesChanged(token)
    }

;@endregion Instance Methods
}
