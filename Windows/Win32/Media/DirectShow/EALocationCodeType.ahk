#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LocationCodeSchemeType.ahk" { LocationCodeSchemeType }

/**
 * The EALocationCodeType structure defines an Emergency Alert (EA) location code, as defined in ANSI/SCTE 28.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface_enums/ns-bdaiface_enums-ealocationcodetype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct EALocationCodeType {
    #StructPack 4

    /**
     * Identifies the standard that shall be used to interpret the other members of this structure. Currently this value must be SCTE_18, meaning SCTE 18, "Emergency Alert Message for Cable."
     */
    LocationCodeScheme : LocationCodeSchemeType

    /**
     * Contains the state_code field.
     */
    state_code : Int8

    /**
     * Contains the county_subdivision field.
     */
    county_subdivision : Int8

    /**
     * Contains the county_code field.
     */
    county_code : UInt16

}
