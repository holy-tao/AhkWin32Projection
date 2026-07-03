#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }
#Import "..\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }
#Import "..\Com\StructuredStorage\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct NATLANGUAGERESTRICTION {
    #StructPack 8

    prop : FULLPROPSPEC

    pwcsPhrase : PWSTR

    lcid : UInt32

}
