#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class REFS_SMR_VOLUME_GC_METHOD extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcMethodCompaction => 1

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcMethodCompression => 2

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcMethodRotation => 3
}
