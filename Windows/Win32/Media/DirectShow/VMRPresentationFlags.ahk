#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMRPresentationFlags enumeration type is a member of the VMRPRESENTATIONINFO structure .
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-vmrpresentationflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRPresentationFlags extends Win32Enum{

    /**
     * Indicates that the sample is a sync point.
     * @type {Integer (Int32)}
     */
    static VMRSample_SyncPoint => 1

    /**
     * Indicates that the sample is part of the preroll.
     * @type {Integer (Int32)}
     */
    static VMRSample_Preroll => 2

    /**
     * Indicates that the sample is a discontinuity.
     * @type {Integer (Int32)}
     */
    static VMRSample_Discontinuity => 4

    /**
     * Indicates that the time stamp on the sample is valid.
     * @type {Integer (Int32)}
     */
    static VMRSample_TimeValid => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VMRSample_SrcDstRectsValid => 16
}
