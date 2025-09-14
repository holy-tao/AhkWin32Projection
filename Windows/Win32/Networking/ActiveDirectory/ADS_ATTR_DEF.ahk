#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_ATTR_DEF structure is used only as a part of IDirectorySchemaMgmt, which is an obsolete interface.
 * @remarks
 * In ADSI, attributes and properties are used interchangeably.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_attr_def
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_ATTR_DEF extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the name of the attribute.
     * @type {Pointer<PWSTR>}
     */
    pszAttrName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Data type of the attribute as defined by  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a>.
     * @type {Integer}
     */
    dwADsType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Minimum legal range for this attribute.
     * @type {Integer}
     */
    dwMinRange {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Maximum legal range for this attribute.
     * @type {Integer}
     */
    dwMaxRange {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Whether or not this attribute takes more than one value.
     * @type {Integer}
     */
    fMultiValued {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
