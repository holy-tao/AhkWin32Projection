#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFCameraIntrinsic_DistortionModelType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MFCameraIntrinsic_DistortionModelType_6KT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFCameraIntrinsic_DistortionModelType_ArcTan => 1
}
