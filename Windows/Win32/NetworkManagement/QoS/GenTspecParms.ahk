#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GenTspecParms structure stores generic Tspec parameters.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-gentspecparms
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class GenTspecParms extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Token bucket rate, in bytes per second.
     * @type {Float}
     */
    TB_Tspec_r {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Token bucket depth, in bytes.
     * @type {Float}
     */
    TB_Tspec_b {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Peak data rate, in bytes per second.
     * @type {Float}
     */
    TB_Tspec_p {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Minimum policed unit, in bytes.
     * @type {Integer}
     */
    TB_Tspec_m {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Maximum packet size, in bytes.
     * @type {Integer}
     */
    TB_Tspec_M1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
