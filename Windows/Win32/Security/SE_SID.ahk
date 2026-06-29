#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SID.ahk" { SID }
#Import ".\SID_IDENTIFIER_AUTHORITY.ahk" { SID_IDENTIFIER_AUTHORITY }

/**
 * @namespace Windows.Win32.Security
 */
export default struct SE_SID {
    #StructPack 4

    Sid : SID

    static __New() {
        DefineProp(this.Prototype, 'Buffer', { type: Int8[68], offset: 0 })
        this.DeleteProp("__New")
    }
}
