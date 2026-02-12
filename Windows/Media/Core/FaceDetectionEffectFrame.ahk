#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFaceDetectionEffectFrame.ahk
#Include ..\IMediaFrame.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a video frame that includes a list of faces detected by the [FaceDetectionEffect](facedetectioneffect.md).
 * @remarks
 * Get an instance of this class by accessing the [FaceDetectedEventArgs.ResultFrame](facedetectedeventargs_resultframe.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class FaceDetectionEffectFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFaceDetectionEffectFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFaceDetectionEffectFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of objects representing the faces detected in the frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.detectedfaces
     * @type {IVectorView<DetectedFace>} 
     */
    DetectedFaces {
        get => this.get_DetectedFaces()
    }

    /**
     * Gets a string indicating the type of data the frame contains.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a value indicating whether the frame is read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets or sets the relative time of the frame within the video stream.
     * @remarks
     * Use [SystemRelativeTime](facedetectioneffectframe_systemrelativetime.md) to get a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.relativetime
     * @type {IReference<TimeSpan>} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
        set => this.put_RelativeTime(value)
    }

    /**
     * Gets or sets a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @remarks
     * Use [RelativeTime](facedetectioneffectframe_relativetime.md) to get a timestamp that is relative to the video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.systemrelativetime
     * @type {IReference<TimeSpan>} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
        set => this.put_SystemRelativeTime(value)
    }

    /**
     * Gets or sets the duration of the face detection effect frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a value that indicates whether a video frame is the first frame after a gap in the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.isdiscontinuous
     * @type {Boolean} 
     */
    IsDiscontinuous {
        get => this.get_IsDiscontinuous()
        set => this.put_IsDiscontinuous(value)
    }

    /**
     * Gets the extended property set which enables getting and setting properties on the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.extendedproperties
     * @type {IPropertySet} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {IVectorView<DetectedFace>} 
     */
    get_DetectedFaces() {
        if (!this.HasProp("__IFaceDetectionEffectFrame")) {
            if ((queryResult := this.QueryInterface(IFaceDetectionEffectFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFaceDetectionEffectFrame := IFaceDetectionEffectFrame(outPtr)
        }

        return this.__IFaceDetectionEffectFrame.get_DetectedFaces()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_Type()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_IsReadOnly()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_RelativeTime(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_RelativeTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_RelativeTime() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_RelativeTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SystemRelativeTime(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_SystemRelativeTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SystemRelativeTime() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_SystemRelativeTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_Duration(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_Duration()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDiscontinuous(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_IsDiscontinuous(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDiscontinuous() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_IsDiscontinuous()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ExtendedProperties() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_ExtendedProperties()
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectioneffectframe.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
