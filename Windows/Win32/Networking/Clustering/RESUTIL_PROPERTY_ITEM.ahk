#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a cluster object property. An array of RESUTIL_PROPERTY_ITEM structures forms a property table which can be used in property operations.
 * @remarks
 * 
 * For more information about building parameter blocks and property tables, see 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/using-lists-and-tables">Using Lists and Tables</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-resutil_property_item
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESUTIL_PROPERTY_ITEM extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The name of the property.
     * @type {PWSTR}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Optional name of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">cluster database</a> subkey for 
     *       the property. This parameter can be <b>NULL</b>.
     * @type {PWSTR}
     */
    KeyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Describes the format of the property such as <b>CLUSPROP_FORMAT_BINARY</b> or 
     *       <b>CLUSPROP_FORMAT_DWORD</b>. For a list of valid format values, see the 
     *       <b>wFormat</b> member of 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_syntax">CLUSPROP_SYNTAX</a>.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    DefaultPtr {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Default {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDefault {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<RESUTIL_LARGEINT_DATA>}
     */
    LargeIntData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<RESUTIL_ULARGEINT_DATA>}
     */
    ULargeIntData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<RESUTIL_FILETIME_DATA>}
     */
    FileTimeData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Minimum data value for the property. For data values with the 
     *       <b>CLUSPROP_FORMAT_BINARY</b> and <b>CLUSPROP_FORMAT_MULTI_SZ</b> 
     *       formats, the <b>Minimum</b> member contains the byte size of the default data value 
     *       specified by <b>Default</b>.
     * @type {Integer}
     */
    Minimum {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Maximum data value for the property.
     * @type {Integer}
     */
    Maximum {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Bitmask that describes the property.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Byte offset to the actual property data. The data is stored in a buffer known as a parameter block.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
