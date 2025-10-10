#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the result from a Certified Output Protection Protocol (COPP) status request.
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ns-dxva9typ-dxva_coppstatusdata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA_COPPStatusData extends Win32Struct
{
    static sizeof => 24

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
     * Response to the status query. The meaning of this value depends on the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/copp-query-reference">COPP Query Reference</a>.
     * @type {Integer}
     */
    dwData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved. Must be zero.
     * @type {Integer}
     */
    ExtendedInfoValidMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved. Must be zero.
     * @type {Integer}
     */
    ExtendedInfoData {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
