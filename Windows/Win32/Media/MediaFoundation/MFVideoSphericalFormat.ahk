#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoSphericalFormat extends Win32Enum {

    /**
     * Native name: MFVideoSphericalFormat_Unsupported
     * @type {Integer (Int32)}
     */
    static Unsupported => 0

    /**
     * Native name: MFVideoSphericalFormat_Equirectangular
     * @type {Integer (Int32)}
     */
    static Equirectangular => 1

    /**
     * Native name: MFVideoSphericalFormat_CubeMap
     * @type {Integer (Int32)}
     */
    static CubeMap => 2

    /**
     * Native name: MFVideoSphericalFormat_3DMesh
     * @type {Integer (Int32)}
     */
    static 3DMesh => 3
}
