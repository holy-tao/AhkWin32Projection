#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSMICARRAY_MICARRAYTYPE extends Win32Enum {

    /**
     * Native name: KSMICARRAY_MICARRAYTYPE_LINEAR
     * @type {Integer (Int32)}
     */
    static LINEAR => 0

    /**
     * Native name: KSMICARRAY_MICARRAYTYPE_PLANAR
     * @type {Integer (Int32)}
     */
    static PLANAR => 1

    /**
     * Native name: KSMICARRAY_MICARRAYTYPE_3D
     * @type {Integer (Int32)}
     */
    static 3D => 2
}
