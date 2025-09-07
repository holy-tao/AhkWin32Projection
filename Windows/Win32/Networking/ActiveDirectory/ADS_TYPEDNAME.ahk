#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an ADSI representation of Typed Name attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_typedname
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_TYPEDNAME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains an object name.
     * @type {Pointer<Ptr>}
     */
    ObjectName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The priority associated with the object.
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The frequency of reference of the object.
     * @type {Integer}
     */
    Interval {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
