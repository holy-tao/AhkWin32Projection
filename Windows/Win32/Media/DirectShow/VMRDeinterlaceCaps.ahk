#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VMRDeinterlaceTech.ahk" { VMRDeinterlaceTech }

/**
 * The VMRDeinterlaceCaps structure describes the capabilities of a deinterlacing mode.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrdeinterlacecaps
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRDeinterlaceCaps {
    #StructPack 4

    /**
     * Size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Number of previously de-interlaced frames that must be fed back to the hardware to deinterlace the next field. (Used by recursive deinterlacing algorithms.)
     */
    dwNumPreviousOutputFrames : UInt32

    /**
     * Number of future samples needed to deinterlace the current field.
     */
    dwNumForwardRefSamples : UInt32

    /**
     * Number of past samples needed to deinterlace the current field.
     */
    dwNumBackwardRefSamples : UInt32

    /**
     * Bitwise combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrdeinterlacetech">VMRDeinterlaceTech</a> enumeration type. These flags are used to describe the deinterlacing algorithm.
     */
    DeinterlaceTechnology : VMRDeinterlaceTech

}
