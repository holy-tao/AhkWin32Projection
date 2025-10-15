#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class SPLCLIENT_INFO_1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pMachineName{
        get {
            if(!this.HasProp("__pMachineName"))
                this.__pMachineName := PWSTR(this.ptr + 8)
            return this.__pMachineName
        }
    }

    /**
     * @type {PWSTR}
     */
    pUserName{
        get {
            if(!this.HasProp("__pUserName"))
                this.__pUserName := PWSTR(this.ptr + 16)
            return this.__pUserName
        }
    }

    /**
     * @type {Integer}
     */
    dwBuildNum {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    wProcessorArchitecture {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }
}
