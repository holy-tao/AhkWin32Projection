#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the result from a Certified Output Protection Protocol (COPP) status request.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppstatusdata
 * @namespace Windows.Win32.Media.DirectShow
 */
class DXVA_COPPStatusData extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * A 128-bit random number that was passed by the application in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusinput">AMCOPPStatusInput</a> structure.
     * @type {Guid}
     */
    rApp {
        get {
            if(!this.HasProp("__rApp"))
                this.__rApp := Guid(0, this)
            return this.__rApp
        }
    }

    /**
     * Status flag. See <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statusflags">COPP_StatusFlags</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Response to the status query. The meaning of this value depends on the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/copp-query-reference">COPP Query Reference</a>.
     * @type {Integer}
     */
    dwData {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved. Must be zero.
     * @type {Integer}
     */
    ExtendedInfoValidMask {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. Must be zero.
     * @type {Integer}
     */
    ExtendedInfoData {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
