#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the EXIF orientation flag behavior when obtaining pixel data.
 * @remarks
 * Some image formats, including JPEG, TIFF, and JPEG-XR, support EXIF orientation metadata. This metadata specifies a flip and/or rotation operation that should be applied to the raw image data so it is oriented correctly. You can read the EXIF orientation metadata and apply the corresponding transform yourself, or you can use this enumeration to automatically determine and apply the correct transform.
 * 
 * If you specify **RespectExifOrientation**, the resulting orientation operation is combined with any flip and rotation operations that you have specified using [BitmapTransform](bitmaptransform.md).
 * 
 * For example, you call [BitmapDecoder.GetPixelDataAsync](bitmapdecoder_getpixeldataasync_1391309547.md) using **RespectExifOrientation** and a [BitmapRotation](bitmaprotation.md) value of **Clockwise90Degrees**, and the particular image being decoded has an EXIF orientation flag specifying a counterclockwise 90 degree rotation. In this example, the ExifOrientationMode and [BitmapRotation](bitmaprotation.md) options are added together for a net rotation of 180 degrees clockwise.
 * 
 * In addition, if you specify **RespectExifOrientation** along with a clip using [BitmapTransform.Bounds](bitmaptransform_bounds.md), the bounding rectangle must take into account the change in coordinate space from the EXIF orientation operation. You can obtain the full image size after EXIF orientation is applied by using [OrientedPixelWidth](bitmapframe_orientedpixelwidth.md) and [OrientedPixelHeight](bitmapframe_orientedpixelheight.md).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.exiforientationmode
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class ExifOrientationMode extends Win32Enum{

    /**
     * The EXIF orientation flag is ignored. No rotation or flip operations are performed.
     * @type {Integer (Int32)}
     */
    static IgnoreExifOrientation => 0

    /**
     * If the image frame contains a valid EXIF orientation flag, the specified rotation and/or flip operations are performed on the pixel data.
     * @type {Integer (Int32)}
     */
    static RespectExifOrientation => 1
}
