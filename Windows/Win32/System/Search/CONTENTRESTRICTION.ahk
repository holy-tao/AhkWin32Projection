#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\StructuredStorage\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct CONTENTRESTRICTION {
    #StructPack 8

    prop : FULLPROPSPEC

    pwcsPhrase : PWSTR

    lcid : UInt32

    ulGenerateMethod : UInt32

}
