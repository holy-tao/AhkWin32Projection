#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoTransformSphericalProjection.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables configuration of the spherical projection parameters used by the [VideoTransformEffectDefinition](videotransformeffectdefinition.md).
 * @remarks
 * Get an instance of this class by accessing the [VideoTransformEffectDefinition.SphericalProjection](videotransformeffectdefinition_sphericalprojection.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformsphericalprojection
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class VideoTransformSphericalProjection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoTransformSphericalProjection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoTransformSphericalProjection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value specifying whether spherical projection is enabled for the [VideoTransformEffectDefinition](videotransformeffectdefinition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformsphericalprojection.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a value from the [SphericalVideoFrameFormat](../windows.media.mediaproperties/sphericalvideoframeformat.md) enumeration specifying the spherical projection format of the video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformsphericalprojection.frameformat
     * @type {Integer} 
     */
    FrameFormat {
        get => this.get_FrameFormat()
        set => this.put_FrameFormat(value)
    }

    /**
     * Gets or sets a value that specifies the projection mode used for spherical video.
     * @remarks
     * This setting determines whether the video is spherically projected or rendered as flat, with no spherical projection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformsphericalprojection.projectionmode
     * @type {Integer} 
     */
    ProjectionMode {
        get => this.get_ProjectionMode()
        set => this.put_ProjectionMode(value)
    }

    /**
     * Gets or sets the horizontal field of view, expressed in degrees, used for spherical video projection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformsphericalprojection.horizontalfieldofviewindegrees
     * @type {Float} 
     */
    HorizontalFieldOfViewInDegrees {
        get => this.get_HorizontalFieldOfViewInDegrees()
        set => this.put_HorizontalFieldOfViewInDegrees(value)
    }

    /**
     * Gets or sets a quaternion that specifies the current view orientation used to project spherical video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformsphericalprojection.vieworientation
     * @type {Quaternion} 
     */
    ViewOrientation {
        get => this.get_ViewOrientation()
        set => this.put_ViewOrientation(value)
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
    get_IsEnabled() {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameFormat() {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.get_FrameFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FrameFormat(value) {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.put_FrameFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProjectionMode() {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.get_ProjectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProjectionMode(value) {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.put_ProjectionMode(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalFieldOfViewInDegrees() {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.get_HorizontalFieldOfViewInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalFieldOfViewInDegrees(value) {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.put_HorizontalFieldOfViewInDegrees(value)
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_ViewOrientation() {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.get_ViewOrientation()
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_ViewOrientation(value) {
        if (!this.HasProp("__IVideoTransformSphericalProjection")) {
            if ((queryResult := this.QueryInterface(IVideoTransformSphericalProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformSphericalProjection := IVideoTransformSphericalProjection(outPtr)
        }

        return this.__IVideoTransformSphericalProjection.put_ViewOrientation(value)
    }

;@endregion Instance Methods
}
