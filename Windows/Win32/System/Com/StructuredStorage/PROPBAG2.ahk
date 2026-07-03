#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Variant\VARENUM.ahk" { VARENUM }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct PROPBAG2 {
    #StructPack 8

    dwType : UInt32

    vt : VARENUM

    cfType : UInt16

    dwHint : UInt32

    pstrName : PWSTR

    clsid : Guid

}
