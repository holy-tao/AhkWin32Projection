#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\StructuredStorage\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct NATLANGUAGERESTRICTION {
    #StructPack 8

    prop : FULLPROPSPEC

    pwcsPhrase : PWSTR

    lcid : UInt32

}
