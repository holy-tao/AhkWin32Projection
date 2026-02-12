#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapTransform.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains transformations that can be applied to pixel data.
 * @remarks
 * The default values of BitmapTransform result in a pass-through operation.
 * 
 * The order of operations is when setting multiple transform operations is:
 * 
 * 
 * 1. Scale
 * 1. Flip
 * 1. Rotation
 * 1. Crop
 * You should be careful to use the correct coordinate space when specifying each transform’s parameters. Scaling occurs before rotations and flips, and therefore you should specify [ScaledWidth](bitmaptransform_scaledwidth.md) and [ScaledHeight](bitmaptransform_scaledheight.md) in the source image’s coordinate space. Cropping occurs after all other transforms, and therefore you should specify [Bounds](bitmaptransform_bounds.md) in the final scaled/flipped/rotated coordinate space.
 * 
 * If you are using BitmapTransform with a method that performs EXIF orientation, such as [GetPixelDataAsync](bitmapframe_getpixeldataasync_1391309547.md), note that the EXIF orientation operation is combined with the flip/rotate stage. In these cases the behavior of [ScaledWidth](bitmaptransform_scaledwidth.md) and [ScaledHeight](bitmaptransform_scaledheight.md) are not affected as scaling occurs before flip/rotate. However, when specifying [Bounds](bitmaptransform_bounds.md) you need to account for coordinate space changes from [Flip](bitmaptransform_flip.md) and [Rotation](bitmaptransform_rotation.md), as well as the EXIF orientation operation. You can obtain the full image size after EXIF orientation is applied by using [OrientedPixelWidth](bitmapframe_orientedpixelwidth.md) and [OrientedPixelHeight](bitmapframe_orientedpixelheight.md).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptransform
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapTransform extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapTransform.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the width, in pixels, of the bitmap after it is scaled. This is defined in the coordinate space of the source image, before rotation and flip are applied.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptransform.scaledwidth
     * @type {Integer} 
     */
    ScaledWidth {
        get => this.get_ScaledWidth()
        set => this.put_ScaledWidth(value)
    }

    /**
     * Specifies the height, in pixels, of the bitmap after it is scaled. This is defined in the coordinate space of the source image, before rotation and flip are applied.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptransform.scaledheight
     * @type {Integer} 
     */
    ScaledHeight {
        get => this.get_ScaledHeight()
        set => this.put_ScaledHeight(value)
    }

    /**
     * Specifies the interpolation mode that is used to scale the bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptransform.interpolationmode
     * @type {Integer} 
     */
    InterpolationMode {
        get => this.get_InterpolationMode()
        set => this.put_InterpolationMode(value)
    }

    /**
     * Specifies the flip operation that is used to transform the bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptransform.flip
     * @type {Integer} 
     */
    Flip {
        get => this.get_Flip()
        set => this.put_Flip(value)
    }

    /**
     * Specifies the rotation operation that is used to transform the bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptransform.rotation
     * @type {Integer} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * Specifies the bounding rectangle that is used to crop the bitmap. This rectangle is defined in the coordinate space after scale, rotation, and flip are applied.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptransform.bounds
     * @type {BitmapBounds} 
     */
    Bounds {
        get => this.get_Bounds()
        set => this.put_Bounds(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new BitmapTransform object.
     * @remarks
     * The default values of BitmapTransform result in a pass-through operation.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapTransform")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaledWidth() {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.get_ScaledWidth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScaledWidth(value) {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.put_ScaledWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaledHeight() {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.get_ScaledHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScaledHeight(value) {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.put_ScaledHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InterpolationMode() {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.get_InterpolationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InterpolationMode(value) {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.put_InterpolationMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Flip() {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.get_Flip()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Flip(value) {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.put_Flip(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rotation() {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.get_Rotation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Rotation(value) {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.put_Rotation(value)
    }

    /**
     * 
     * @returns {BitmapBounds} 
     */
    get_Bounds() {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.get_Bounds()
    }

    /**
     * 
     * @param {BitmapBounds} value 
     * @returns {HRESULT} 
     */
    put_Bounds(value) {
        if (!this.HasProp("__IBitmapTransform")) {
            if ((queryResult := this.QueryInterface(IBitmapTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTransform := IBitmapTransform(outPtr)
        }

        return this.__IBitmapTransform.put_Bounds(value)
    }

;@endregion Instance Methods
}
