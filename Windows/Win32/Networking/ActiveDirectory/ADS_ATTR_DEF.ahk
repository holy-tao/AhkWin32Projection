#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The ADS_ATTR_DEF structure is used only as a part of IDirectorySchemaMgmt, which is an obsolete interface.
 * @remarks
 * 
  * In ADSI, attributes and properties are used interchangeably.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_attr_def
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_ATTR_DEF extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the name of the attribute.
     * @type {PWSTR}
     */
    pszAttrName{
        get {
            if(!this.HasProp("__pszAttrName"))
                this.__pszAttrName := PWSTR(this.ptr + 0)
            return this.__pszAttrName
        }
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
     * @type {BOOL}
     */
    fMultiValued{
        get {
            if(!this.HasProp("__fMultiValued"))
                this.__fMultiValued := BOOL(this.ptr + 20)
            return this.__fMultiValued
        }
    }
}
