#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a CIM qualifier.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_qualifier
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Qualifier extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Name of this qualifier.
     * @type {Pointer<UInt16>}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type of this qualifier.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Flavor of this qualifier.
     * @type {Integer}
     */
    flavor {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Value of this qualifier.
     * @type {Pointer<Void>}
     */
    value {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
