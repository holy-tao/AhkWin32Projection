#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MF_FLOAT2.ahk" { MF_FLOAT2 }

/**
 * Represents a pinhole camera model.
 * @remarks
 * For square pixels, the X and Y fields of the <b>FocalLength</b> should be the same. The units of the focal length fields are pixels per meter, so dividing the width and height of the image by the X and Y fields of the focal length, respectively, yields the physical size in meters of the image at a distance of one meter from the sensor.
 * 
 * The <b>PrincipalPoint</b> field is expressed in pixels, not in normalized coordinates. The  origin [0,0] is the bottom, left corner of the image.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfcameraintrinsic_pinholecameramodel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCameraIntrinsic_PinholeCameraModel {
    #StructPack 4

    /**
     * The focal length of the camera.
     */
    FocalLength : MF_FLOAT2

    /**
     * The principal point of the camera.
     */
    PrincipalPoint : MF_FLOAT2

}
