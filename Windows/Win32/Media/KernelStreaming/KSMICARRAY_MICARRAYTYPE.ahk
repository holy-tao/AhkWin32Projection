#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSMICARRAY_MICARRAYTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICARRAYTYPE_LINEAR => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICARRAYTYPE_PLANAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMICARRAY_MICARRAYTYPE_3D => 2
}
