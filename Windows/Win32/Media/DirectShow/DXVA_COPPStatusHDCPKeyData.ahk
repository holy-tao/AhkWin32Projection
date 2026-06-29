#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the result from an HDCP Key Data query in Certified Output Protection Protocol (COPP). This query returns the device's HDCP key selection vector (KSV).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppstatushdcpkeydata
 * @namespace Windows.Win32.Media.DirectShow
 */
class DXVA_COPPStatusHDCPKeyData extends Win32Struct {
    static sizeof => 72

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
     * Receives zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statushdcpflags">COPP_StatusHDCPFlags</a> enumeration. If the COPP_HDCPRepeater flag is present, the application should not play the content using this graphics adapter.
     * @type {Integer}
     */
    dwHDCPFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Receives the HDCP key selection vector, B<sub>KSV</sub>, from the HDSCP device attached to the graphics adapter.
     * @type {Guid}
     */
    BKey {
        get {
            if(!this.HasProp("__BKey"))
                this.__BKey := Guid(24, this)
            return this.__BKey
        }
    }

    /**
     * Reserved. Must be zero.
     * @type {Guid}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1"))
                this.__Reserved1 := Guid(40, this)
            return this.__Reserved1
        }
    }

    /**
     * Reserved. Must be zero.
     * @type {Guid}
     */
    Reserved2 {
        get {
            if(!this.HasProp("__Reserved2"))
                this.__Reserved2 := Guid(56, this)
            return this.__Reserved2
        }
    }
}
