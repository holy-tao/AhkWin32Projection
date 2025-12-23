#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoSphericalProjectionMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalProjectionMode_Spherical => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalProjectionMode_Flat => 1
}
