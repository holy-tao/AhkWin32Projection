#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\StructuredStorage\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }
#Import "..\..\Storage\IndexServer\FULLPROPSPEC.ahk" { FULLPROPSPEC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SORTKEY {
    #StructPack 8

    propColumn : FULLPROPSPEC

    dwOrder : UInt32

    locale : UInt32

}
