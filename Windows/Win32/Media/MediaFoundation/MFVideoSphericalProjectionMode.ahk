#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoSphericalProjectionMode extends Win32Enum {

    /**
     * Native name: MFVideoSphericalProjectionMode_Spherical
     * @type {Integer (Int32)}
     */
    static Spherical => 0

    /**
     * Native name: MFVideoSphericalProjectionMode_Flat
     * @type {Integer (Int32)}
     */
    static Flat => 1
}
