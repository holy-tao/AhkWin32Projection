#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class REFS_SMR_VOLUME_GC_METHOD extends Win32Enum {

    /**
     * Native name: SmrGcMethodCompaction
     * @type {Integer (Int32)}
     */
    static Compaction => 1

    /**
     * Native name: SmrGcMethodCompression
     * @type {Integer (Int32)}
     */
    static Compression => 2

    /**
     * Native name: SmrGcMethodRotation
     * @type {Integer (Int32)}
     */
    static Rotation => 3
}
