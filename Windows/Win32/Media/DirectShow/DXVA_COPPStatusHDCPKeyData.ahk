#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the result from an HDCP Key Data query in Certified Output Protection Protocol (COPP). This query returns the device's HDCP key selection vector (KSV).
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ns-dxva9typ-dxva_coppstatushdcpkeydata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA_COPPStatusHDCPKeyData extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A 128-bit random number that was passed by the application in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusinput">AMCOPPStatusInput</a> structure.
     * @type {Pointer<Guid>}
     */
    rApp {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Status flag. See <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statusflags">COPP_StatusFlags</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Receives zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statushdcpflags">COPP_StatusHDCPFlags</a> enumeration. If the COPP_HDCPRepeater flag is present, the application should not play the content using this graphics adapter.
     * @type {Integer}
     */
    dwHDCPFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Receives the HDCP key selection vector, B<sub>KSV</sub>, from the HDSCP device attached to the graphics adapter.
     * @type {Pointer<Guid>}
     */
    BKey {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reserved. Must be zero.
     * @type {Pointer<Guid>}
     */
    Reserved1 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved. Must be zero.
     * @type {Pointer<Guid>}
     */
    Reserved2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
