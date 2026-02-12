#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFaceDetectionEffect.ahk
#Include ..\IMediaExtension.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\FaceDetectionEffect.ahk
#Include .\FaceDetectedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an effect that attempts to detect faces in a video stream.
 * @remarks
 * Get an instance of this class by passing a [FaceDetectionEffectDefinition](facedetectioneffectdefinition.md) object into [AddVideoEffectAsync](../windows.media.capture/mediacapture_addvideoeffectasync_1410216019.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffect
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class FaceDetectionEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFaceDetectionEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFaceDetectionEffect.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether face detection is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffect.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Gets or sets the time span for which face detection should be performed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffect.desireddetectioninterval
     * @type {TimeSpan} 
     */
    DesiredDetectionInterval {
        get => this.get_DesiredDetectionInterval()
        set => this.put_DesiredDetectionInterval(value)
    }

    /**
     * Occurs when a face is detected. See [FaceDetectedEventArgs](facedetectedeventargs.md).
     * @type {TypedEventHandler<FaceDetectionEffect, FaceDetectedEventArgs>}
    */
    OnFaceDetected {
        get {
            if(!this.HasProp("__OnFaceDetected")){
                this.__OnFaceDetected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{01f0d7a6-f9bd-5bc1-aaa9-dff396f72f87}"),
                    FaceDetectionEffect,
                    FaceDetectedEventArgs
                )
                this.__OnFaceDetectedToken := this.add_FaceDetected(this.__OnFaceDetected.iface)
            }
            return this.__OnFaceDetected
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFaceDetectedToken")) {
            this.remove_FaceDetected(this.__OnFaceDetectedToken)
            this.__OnFaceDetected.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__IFaceDetectionEffect")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffect := IFaceDetectionEffect(outPtr)
        }

        return this.__IFaceDetectionEffect.put_Enabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__IFaceDetectionEffect")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffect := IFaceDetectionEffect(outPtr)
        }

        return this.__IFaceDetectionEffect.get_Enabled()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DesiredDetectionInterval(value) {
        if (!this.HasProp("__IFaceDetectionEffect")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffect := IFaceDetectionEffect(outPtr)
        }

        return this.__IFaceDetectionEffect.put_DesiredDetectionInterval(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DesiredDetectionInterval() {
        if (!this.HasProp("__IFaceDetectionEffect")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffect := IFaceDetectionEffect(outPtr)
        }

        return this.__IFaceDetectionEffect.get_DesiredDetectionInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<FaceDetectionEffect, FaceDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FaceDetected(handler) {
        if (!this.HasProp("__IFaceDetectionEffect")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffect := IFaceDetectionEffect(outPtr)
        }

        return this.__IFaceDetectionEffect.add_FaceDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_FaceDetected(cookie) {
        if (!this.HasProp("__IFaceDetectionEffect")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffect := IFaceDetectionEffect(outPtr)
        }

        return this.__IFaceDetectionEffect.remove_FaceDetected(cookie)
    }

    /**
     * Sets properties on the [IMediaExtension](../windows.media/imediaextension.md).
     * @remarks
     * This method is inherited from the [IMediaExtension](../windows.media/imediaextension.md) interface and is not intended to be used from your code. Instead, set the properties of the [FaceDetectionEffect](facedetectioneffect.md) directly.
     * @param {IPropertySet} configuration The property set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffect.setproperties
     */
    SetProperties(configuration) {
        if (!this.HasProp("__IMediaExtension")) {
            if ((queryResult := this.QueryInterface(IMediaExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtension := IMediaExtension(outPtr)
        }

        return this.__IMediaExtension.SetProperties(configuration)
    }

;@endregion Instance Methods
}
