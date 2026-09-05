#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_REGION_FLAG extends Win32Enum {

    /**
     * Native name: ScmRegionFlagNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: ScmRegionFlagLabel
     * @type {Integer (Int32)}
     */
    static Label => 1
}
