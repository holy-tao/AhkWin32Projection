#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMRPresentationFlags enumeration type is a member of the VMRPRESENTATIONINFO structure .
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vmrpresentationflags
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMRPresentationFlags extends Win32Enum {

    /**
     * Indicates that the sample is a sync point.
     * Native name: VMRSample_SyncPoint
     * @type {Integer (Int32)}
     */
    static Sample_SyncPoint => 1

    /**
     * Indicates that the sample is part of the preroll.
     * Native name: VMRSample_Preroll
     * @type {Integer (Int32)}
     */
    static Sample_Preroll => 2

    /**
     * Indicates that the sample is a discontinuity.
     * Native name: VMRSample_Discontinuity
     * @type {Integer (Int32)}
     */
    static Sample_Discontinuity => 4

    /**
     * Indicates that the time stamp on the sample is valid.
     * Native name: VMRSample_TimeValid
     * @type {Integer (Int32)}
     */
    static Sample_TimeValid => 8

    /**
     * Native name: VMRSample_SrcDstRectsValid
     * @type {Integer (Int32)}
     */
    static Sample_SrcDstRectsValid => 16
}
