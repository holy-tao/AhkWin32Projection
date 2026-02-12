#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\Effects\IVideoEffectDefinition.ahk
#Include .\IFaceDetectionEffectDefinition.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the definition of a face detection video effect.
 * @remarks
 * Get an instance of the [FaceDetectionEffect](facedetectioneffect.md) class by passing a FaceDetectionEffectDefinition object into [AddVideoEffectAsync](../windows.media.capture/mediacapture_addvideoeffectasync_1410216019.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectdefinition
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class FaceDetectionEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoEffectDefinition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string containing the activatable class ID of the face detection effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the set of properties for configuring the [FaceDetectionEffectDefinition](facedetectioneffectdefinition.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectdefinition.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets or sets a value that prioritizes the speed of face detection and the quality of detection results.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectdefinition.detectionmode
     * @type {Integer} 
     */
    DetectionMode {
        get => this.get_DetectionMode()
        set => this.put_DetectionMode(value)
    }

    /**
     * Gets or sets a value indicating whether synchronous face detection is enabled.
     * @remarks
     * When synchronous detection is enabled, the system will delay the return of a video frame until the face detection operation for the frame is complete. When the frames do arrive, the timestamp of the [FaceDetectionEffectFrame](facedetectioneffectframe.md) will match the timestamp of the associated [VideoFrame](../windows.media/videoframe.md). When synchronous detection is disabled, the timestamp of the [FaceDetectionEffectFrame](facedetectioneffectframe.md) will typically be slightly later than the associated[VideoFrame](../windows.media/videoframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectdefinition.synchronousdetectionenabled
     * @type {Boolean} 
     */
    SynchronousDetectionEnabled {
        get => this.get_SynchronousDetectionEnabled()
        set => this.put_SynchronousDetectionEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FaceDetectionEffectDefinition](facedetectioneffectdefinition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.FaceDetectionEffectDefinition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivatableClassId() {
        if (!this.HasProp("__IVideoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEffectDefinition := IVideoEffectDefinition(outPtr)
        }

        return this.__IVideoEffectDefinition.get_ActivatableClassId()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IVideoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEffectDefinition := IVideoEffectDefinition(outPtr)
        }

        return this.__IVideoEffectDefinition.get_Properties()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DetectionMode(value) {
        if (!this.HasProp("__IFaceDetectionEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffectDefinition := IFaceDetectionEffectDefinition(outPtr)
        }

        return this.__IFaceDetectionEffectDefinition.put_DetectionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DetectionMode() {
        if (!this.HasProp("__IFaceDetectionEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffectDefinition := IFaceDetectionEffectDefinition(outPtr)
        }

        return this.__IFaceDetectionEffectDefinition.get_DetectionMode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SynchronousDetectionEnabled(value) {
        if (!this.HasProp("__IFaceDetectionEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffectDefinition := IFaceDetectionEffectDefinition(outPtr)
        }

        return this.__IFaceDetectionEffectDefinition.put_SynchronousDetectionEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SynchronousDetectionEnabled() {
        if (!this.HasProp("__IFaceDetectionEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffectDefinition := IFaceDetectionEffectDefinition(outPtr)
        }

        return this.__IFaceDetectionEffectDefinition.get_SynchronousDetectionEnabled()
    }

;@endregion Instance Methods
}
