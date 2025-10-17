#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MF_FLOAT2.ahk

/**
 * Represents a pinhole camera model.
 * @remarks
 * 
  * For square pixels, the X and Y fields of the <b>FocalLength</b> should be the same. The units of the focal length fields are pixels per meter, so dividing the width and height of the image by the X and Y fields of the focal length, respectively, yields the physical size in meters of the image at a distance of one meter from the sensor.
  * 
  * The <b>PrincipalPoint</b> field is expressed in pixels, not in normalized coordinates. The  origin [0,0] is the bottom, left corner of the image.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-mfcameraintrinsic_pinholecameramodel
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCameraIntrinsic_PinholeCameraModel extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The focal length of the camera.
     * @type {MF_FLOAT2}
     */
    FocalLength{
        get {
            if(!this.HasProp("__FocalLength"))
                this.__FocalLength := MF_FLOAT2(0, this)
            return this.__FocalLength
        }
    }

    /**
     * The principal point of the camera.
     * @type {MF_FLOAT2}
     */
    PrincipalPoint{
        get {
            if(!this.HasProp("__PrincipalPoint"))
                this.__PrincipalPoint := MF_FLOAT2(8, this)
            return this.__PrincipalPoint
        }
    }
}
