#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADSTYPE.ahk" { ADSTYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The ADS_ATTR_DEF structure is used only as a part of IDirectorySchemaMgmt, which is an obsolete interface.
 * @remarks
 * In ADSI, attributes and properties are used interchangeably.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_attr_def
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_ATTR_DEF {
    #StructPack 8

    /**
     * The null-terminated Unicode string that contains the name of the attribute.
     */
    pszAttrName : PWSTR

    /**
     * Data type of the attribute as defined by  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a>.
     */
    dwADsType : ADSTYPE

    /**
     * Minimum legal range for this attribute.
     */
    dwMinRange : UInt32

    /**
     * Maximum legal range for this attribute.
     */
    dwMaxRange : UInt32

    /**
     * Whether or not this attribute takes more than one value.
     */
    fMultiValued : BOOL

}
