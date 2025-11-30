#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class WRITE_ROTATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CdromDefaultRotation => 0

    /**
     * @type {Integer (Int32)}
     */
    static CdromCAVRotation => 1
}
