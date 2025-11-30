#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class EPcxGenLocation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eGenLocPrimaryBox => 0

    /**
     * @type {Integer (Int32)}
     */
    static eGenLocInternal => 1

    /**
     * @type {Integer (Int32)}
     */
    static eGenLocSeparate => 2

    /**
     * @type {Integer (Int32)}
     */
    static eGenLocOther => 3

    /**
     * @type {Integer (Int32)}
     */
    static EPcxGenLocation_enum_count => 4
}
