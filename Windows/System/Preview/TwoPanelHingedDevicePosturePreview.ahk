#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITwoPanelHingedDevicePosturePreview.ahk
#Include .\ITwoPanelHingedDevicePosturePreviewStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\TwoPanelHingedDevicePosturePreview.ahk
#Include .\TwoPanelHingedDevicePosturePreviewReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about the device posture, including [hinge state](hingestate.md) and orientation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreview
 * @namespace Windows.System.Preview
 * @version WindowsRuntime 1.4
 */
class TwoPanelHingedDevicePosturePreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITwoPanelHingedDevicePosturePreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITwoPanelHingedDevicePosturePreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default posture for the device.
     * @returns {IAsyncOperation<TwoPanelHingedDevicePosturePreview>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreview.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!TwoPanelHingedDevicePosturePreview.HasProp("__ITwoPanelHingedDevicePosturePreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Preview.TwoPanelHingedDevicePosturePreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITwoPanelHingedDevicePosturePreviewStatics.IID)
            TwoPanelHingedDevicePosturePreview.__ITwoPanelHingedDevicePosturePreviewStatics := ITwoPanelHingedDevicePosturePreviewStatics(factoryPtr)
        }

        return TwoPanelHingedDevicePosturePreview.__ITwoPanelHingedDevicePosturePreviewStatics.GetDefaultAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPostureChangedToken")) {
            this.remove_PostureChanged(this.__OnPostureChangedToken)
            this.__OnPostureChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets the current device posture.
     * @returns {IAsyncOperation<TwoPanelHingedDevicePosturePreviewReading>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreview.getcurrentpostureasync
     */
    GetCurrentPostureAsync() {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreview")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreview := ITwoPanelHingedDevicePosturePreview(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreview.GetCurrentPostureAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<TwoPanelHingedDevicePosturePreview, TwoPanelHingedDevicePosturePreviewReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PostureChanged(handler) {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreview")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreview := ITwoPanelHingedDevicePosturePreview(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreview.add_PostureChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PostureChanged(token) {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreview")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreview := ITwoPanelHingedDevicePosturePreview(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreview.remove_PostureChanged(token)
    }

;@endregion Instance Methods
}
