#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9PresentationFlags enumeration type contains flags that describe the status of a video sample. These flags are used in the VMR9PresentationInfo structure.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9presentationflags
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMR9PresentationFlags extends Win32Enum {

    /**
     * Indicates that the sample is a sync point.
     * Native name: VMR9Sample_SyncPoint
     * @type {Integer (Int32)}
     */
    static Sample_SyncPoint => 1

    /**
     * Indicates that the sample is part of the preroll.
     * Native name: VMR9Sample_Preroll
     * @type {Integer (Int32)}
     */
    static Sample_Preroll => 2

    /**
     * Indicates that the sample is a discontinuity.
     * Native name: VMR9Sample_Discontinuity
     * @type {Integer (Int32)}
     */
    static Sample_Discontinuity => 4

    /**
     * Indicates that the time stamp on the sample is valid.
     * Native name: VMR9Sample_TimeValid
     * @type {Integer (Int32)}
     */
    static Sample_TimeValid => 8

    /**
     * Native name: VMR9Sample_SrcDstRectsValid
     * @type {Integer (Int32)}
     */
    static Sample_SrcDstRectsValid => 16
}
