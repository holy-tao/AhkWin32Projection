#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct SWbemRpnConst {
    #StructPack 8

    m_pszStrVal : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'm_bBoolVal', { type: BOOL, offset: 0 })
        DefineProp(this.Prototype, 'm_lLongVal', { type: Int32, offset: 0 })
        DefineProp(this.Prototype, 'm_uLongVal', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'm_dblVal', { type: Float64, offset: 0 })
        DefineProp(this.Prototype, 'm_lVal64', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'm_uVal64', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
