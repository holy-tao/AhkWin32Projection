#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class ACMDRVOPENDESCW extends Win32Struct
{
    static sizeof => 44

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fccType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    fccComp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {PWSTR}
     */
    pszSectionName{
        get {
            if(!this.HasProp("__pszSectionName"))
                this.__pszSectionName := PWSTR(this.ptr + 24)
            return this.__pszSectionName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszAliasName{
        get {
            if(!this.HasProp("__pszAliasName"))
                this.__pszAliasName := PWSTR(this.ptr + 32)
            return this.__pszAliasName
        }
    }

    /**
     * @type {Integer}
     */
    dnDevNode {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
