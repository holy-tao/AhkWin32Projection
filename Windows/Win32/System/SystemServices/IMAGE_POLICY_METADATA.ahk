#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_POLICY_ENTRY_TYPE.ahk" { IMAGE_POLICY_ENTRY_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMAGE_POLICY_ENTRY.ahk" { IMAGE_POLICY_ENTRY }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\IMAGE_POLICY_ID.ahk" { IMAGE_POLICY_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_POLICY_METADATA {
    #StructPack 8

    Version : Int8

    Reserved0 : Int8[7]

    ApplicationId : Int64

    Policies : IMAGE_POLICY_ENTRY[1]

}
