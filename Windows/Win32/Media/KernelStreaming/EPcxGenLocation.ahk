#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class EPcxGenLocation extends Win32Enum {

    /**
     * Native name: eGenLocPrimaryBox
     * @type {Integer (Int32)}
     */
    static LocPrimaryBox => 0

    /**
     * Native name: eGenLocInternal
     * @type {Integer (Int32)}
     */
    static LocInternal => 1

    /**
     * Native name: eGenLocSeparate
     * @type {Integer (Int32)}
     */
    static LocSeparate => 2

    /**
     * Native name: eGenLocOther
     * @type {Integer (Int32)}
     */
    static LocOther => 3

    /**
     * Native name: EPcxGenLocation_enum_count
     * @type {Integer (Int32)}
     */
    static enum_count => 4
}
