#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_PROTECTED_SESSION_STATUS.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYPROTECTEDSESSIONSTATUS extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    hHandle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DKMT_PROTECTED_SESSION_STATUS}
     */
    Status {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
