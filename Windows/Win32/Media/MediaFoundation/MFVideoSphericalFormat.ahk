#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoSphericalFormat extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalFormat_Unsupported => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalFormat_Equirectangular => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalFormat_CubeMap => 2

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalFormat_3DMesh => 3
}
