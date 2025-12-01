#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_NONLOCALVIDMEMCAPS structure contains the capabilities for nonlocal display memory.
 * @remarks
 * On Microsoft Windows 2000 and later versions, the data structure is called DD_NONLOCALVIDMEMCAPS and on Windows 98/Me the data structure is called DDNONLOCALVIDMEMCAPS.
 * 
 * Normally, the <b>dwNLVBCaps</b>, <b>dwNLVBCaps2</b>, <b>dwNFLBCKeyCaps</b>, <b>dwNLVBFXCaps</b>, and <b>dwNLVBRops</b> members contain a subset of the flags used in the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawi/ns-ddrawi-ddcorecaps">DDCORECAPS</a> structure that is relevant to nonlocal-to-local blitting. However, to allow flexibility for device driver writers, any of the flags in DDCORECAPS can be used.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_nonlocalvidmemcaps
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_NONLOCALVIDMEMCAPS extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * Specifies the size in bytes of this DD_NONLOCALVIDMEMCAPS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the driver-specific capabilities for nonlocal-to-local display memory blits. See the Remarks section for more information.
     * @type {Integer}
     */
    dwNLVBCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains more of the driver-specific capabilities for nonlocal-to-local display memory blits. See the Remarks section for more information.
     * @type {Integer}
     */
    dwNLVBCaps2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains driver color key capabilities for nonlocal-to-local display memory blits. See the Remarks section for more information.
     * @type {Integer}
     */
    dwNLVBCKeyCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Contains driver FX capabilities for nonlocal-to-local display memory blits. See the Remarks section for more information.
     * @type {Integer}
     */
    dwNLVBFXCaps {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies an array of DD_ROP_SPACE DWORDs containing the raster operations supported for nonlocal-to-local blits. The constant DD_ROP_SPACE is defined in <i>ddraw.h</i>. See the Remarks section for more information.
     * @type {Array<UInt32>}
     */
    dwNLVBRops{
        get {
            if(!this.HasProp("__dwNLVBRopsProxyArray"))
                this.__dwNLVBRopsProxyArray := Win32FixedArray(this.ptr + 20, 8, Primitive, "uint")
            return this.__dwNLVBRopsProxyArray
        }
    }
}
