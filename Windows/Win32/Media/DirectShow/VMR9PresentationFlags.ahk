#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMR9PresentationFlags enumeration type contains flags that describe the status of a video sample. These flags are used in the VMR9PresentationInfo structure.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9presentationflags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9PresentationFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the sample is a sync point.
     * @type {Integer (Int32)}
     */
    static VMR9Sample_SyncPoint => 1

    /**
     * Indicates that the sample is part of the preroll.
     * @type {Integer (Int32)}
     */
    static VMR9Sample_Preroll => 2

    /**
     * Indicates that the sample is a discontinuity.
     * @type {Integer (Int32)}
     */
    static VMR9Sample_Discontinuity => 4

    /**
     * Indicates that the time stamp on the sample is valid.
     * @type {Integer (Int32)}
     */
    static VMR9Sample_TimeValid => 8

    /**
     * @type {Integer (Int32)}
     */
    static VMR9Sample_SrcDstRectsValid => 16
}
