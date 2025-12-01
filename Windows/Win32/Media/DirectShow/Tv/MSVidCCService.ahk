#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This topic applies to Windows XP Service Pack 1 or later.
 * @see https://learn.microsoft.com/windows/win32/api/segment/ne-segment-msvidccservice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MSVidCCService extends Win32Enum{

    /**
     * No current service
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * CC1 (caption channel)
     * @type {Integer (Int32)}
     */
    static Caption1 => 1

    /**
     * CC2 (caption channel)
     * @type {Integer (Int32)}
     */
    static Caption2 => 2

    /**
     * T1 (text channel)
     * @type {Integer (Int32)}
     */
    static Text1 => 3

    /**
     * T2 (text channel)
     * @type {Integer (Int32)}
     */
    static Text2 => 4

    /**
     * Extended data services (XDS or EDS)
     * @type {Integer (Int32)}
     */
    static XDS => 5
}
