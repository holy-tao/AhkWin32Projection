#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ODBC_VS_ARGS {
    #StructPack 8

    pguidEvent : Guid.Ptr

    dwFlags : UInt32

    wszArg : PWSTR

    wszCorrelation : PWSTR

    RetCode : Int16

    static __New() {
        DefineProp(this.Prototype, 'szArg', { type: PSTR, offset: 16 })
        DefineProp(this.Prototype, 'szCorrelation', { type: PSTR, offset: 24 })
        this.DeleteProp("__New")
    }
}
