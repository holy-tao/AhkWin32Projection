#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RUN structure is used to describe a linear set of pixels that is not clipped by the CLIPLINE structure.
 * @remarks
 * If the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> is complex, a single line segment can be broken into many RUNs. The same segment is returned as many times as necessary to list all of its RUNs.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-run
 * @namespace Windows.Win32.Devices.Display
 */
export default struct RUN {
    #StructPack 4

    /**
     * Specifies the starting point for a field of pixels to be drawn. The first pixel of the unclipped line is pixel 0.
     */
    iStart : Int32

    /**
     * Specifies the stopping point for a field of pixels to be drawn.
     */
    iStop : Int32

}
