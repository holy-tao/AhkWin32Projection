#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPSEX.ahk

/**
 * The DD_MORESURFACECAPS structure defines more driver surface capabilities in addition to those described in DDCORECAPS.
 * @remarks
 * This structure contains the caps bits added to the <b>DDCAPS.ddsCaps</b> structure in DirectX 6.0. See the DirectDraw SDK documentation for a description of the DDCAPS structure.
 * 
 * <b>Note for Microsoft Windows 98/Me:</b>  DD_MORESURFACECAPS is the definition for Windows 2000 and later versions. Drivers that run on Windows 98/Me use the name DDMORESURFACECAPS, which is aliased in <i>dx95type.h</i>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_moresurfacecaps
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_MORESURFACECAPS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class NTExtendedHeapRestrictions extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {DDSCAPSEX}
         */
        ddsCapsEx{
            get {
                if(!this.HasProp("__ddsCapsEx"))
                    this.__ddsCapsEx := DDSCAPSEX(0, this)
                return this.__ddsCapsEx
            }
        }
    
        /**
         * @type {DDSCAPSEX}
         */
        ddsCapsExAlt{
            get {
                if(!this.HasProp("__ddsCapsExAlt"))
                    this.__ddsCapsExAlt := DDSCAPSEX(16, this)
                return this.__ddsCapsExAlt
            }
        }
    
    }

    /**
     * Specifies the size of this DD_MORESURFACECAPS structure. The DD_MORESURFACECAPS structure is of variable size. There should be exactly <b>DD_HALINFO.vmiData.dwNumHeaps</b> copies of the <b>ddsExtendedHeapRestrictions</b> structure within the array member of this structure. The total size of a DD_MORESURFACECAPS structure is thus: 
     * 
     * 
     * ```
     * dwSize = 
     *    sizeof(DD_MORESURFACECAPS) +
     *    (DD_HALINFO.vmiData.dwNumHeaps - 1) * sizeof(DDSCAPSEX) * 2
     * ```
     * 
     * 
     * This calculation accounts for the minimum size of the DD_MORESURFACECAPS structure, which includes only one <b>ddsExtendedHeapRestrictions</b> array element. Any additional <b>ddsExtendedHeapRestrictions</b> array elements must be accounted for by adding the sizes of the remaining array elements. That is, by adding the product of the number of remaining <b>ddsExtendedHeapRestrictions</b> structures times the size of each one.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a DDSCAPSEX structure that provides the extensions to <b>ddcaps.ddsCaps</b> that describe the types of extended surfaces the driver can create. When a DDCAPS structure is returned to the application, it is a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure manufactured from <b>DDCAPS.ddsCaps</b> and <b>DD_MORESURFACECAPS.ddsCapsMore</b>. A DDSCAPSEX structure is the same as a DDSCAPS2 structure without the <b>dwCaps</b> member.
     * @type {DDSCAPSEX}
     */
    ddsCapsMore{
        get {
            if(!this.HasProp("__ddsCapsMore"))
                this.__ddsCapsMore := DDSCAPSEX(8, this)
            return this.__ddsCapsMore
        }
    }

    /**
     * Specifies a structure containing two members. These members are filled in by Microsoft DirectX 6.0-aware drivers (and drivers compliant with later versions of DirectX), to restrict the video memory heaps that are exposed to Microsoft DirectDraw to certain sets of DDSCAPS_<i>Xxx</i> bits. The DirectDraw version is determined by looking at DDVERSIONINFO, which is defined in <i>ddrawi.h</i>. The <b>ddsCapsEx</b> and <b>ddsCapsExAlt</b> members of the DD_MORESURFACECAPS structure are exactly analogous to the <b>ddsCaps</b> and <b>ddsCapsAlt</b> members of the VIDEOMEMORY structures listed in the <b>VIDMEMINFO.pvmList</b> member of <b>DD_HALINFO.vmiData</b>.
     * @type {Array<NTExtendedHeapRestrictions>}
     */
    ddsExtendedHeapRestrictions{
        get {
            if(!this.HasProp("__ddsExtendedHeapRestrictionsProxyArray"))
                this.__ddsExtendedHeapRestrictionsProxyArray := Win32FixedArray(this.ptr + 24, 1, %this.__Class%.NTExtendedHeapRestrictions, "")
            return this.__ddsExtendedHeapRestrictionsProxyArray
        }
    }
}
