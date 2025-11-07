#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\DirectDraw\DDPIXELFORMAT.ahk

/**
 * The AMVAUncompBufferInfo structure describes the uncompressed surfaces to be allocated by the video renderer.
 * @remarks
 * 
 * The VMR-7 and VMR-9 filters allocate at least <b>dwMinNumSurfaces</b> surfaces. For interlaced content, the VMR-7 allocates additional surfaces equal to the number of forward and backward reference frames required by the deinterlacer. The VMR-7 gets these values by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrdeinterlacecontrol-getdeinterlacemodecaps">IVMRDeinterlaceControl::GetDeinterlaceModeCaps</a>. The VMR-9 does not need to allocate additional surfaces for deinterlacing. Thus:
 * 
 * <ul>
 * <li>For the VMR-7, the number of allocated surfaces is <b>dwMinNumSurfaces</b> + <b>dwNumForwardRefSamples</b> + <b>dwNumBackwardRefSamples</b>. For progressive content, the last two values will be zero.</li>
 * <li>For the VMR-9, the number of allocated surfaces is <b>dwMinNumSurfaces</b>.</li>
 * </ul>
 * Initially, the decoder should set <b>dwMinNumSurfaces</b> equal to the optimal number of surfaces needed to decode smoothly. If the renderer cannot allocate that many surfaces, the connection will fail with the error code E_OUTOFMEMORY. The decoder should reconnect with the same media type but set <b>dwMinNumSurfaces</b> equal to the minimum number of surfaces required for decoding. For example, the optimal number of surfaces might be 8, while the minimum is 4.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//amva/ns-amva-amvauncompbufferinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVAUncompBufferInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Minimum number of surfaces to allocate.
     * @type {Integer}
     */
    dwMinNumSurfaces {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Maximum number of surfaces to allocate.
     * @type {Integer}
     */
    dwMaxNumSurfaces {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <b>DDPIXELFORMAT</b> structure, describing the pixel format of the allocated surfaces.
     * @type {DDPIXELFORMAT}
     */
    ddUncompPixelFormat{
        get {
            if(!this.HasProp("__ddUncompPixelFormat"))
                this.__ddUncompPixelFormat := DDPIXELFORMAT(8, this)
            return this.__ddUncompPixelFormat
        }
    }
}
