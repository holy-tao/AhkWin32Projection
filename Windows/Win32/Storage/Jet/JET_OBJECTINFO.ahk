#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Learn more about: JET_OBJECTINFO constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-objectinfo-constructor
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_OBJECTINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

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
    objtyp {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Float}
     */
    dtCreate {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Float}
     */
    dtUpdate {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    grbit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    cRecord {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    cPage {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
