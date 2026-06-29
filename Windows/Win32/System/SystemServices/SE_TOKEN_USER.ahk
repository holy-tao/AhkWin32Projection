#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import "..\..\Security\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import "..\..\Security\TOKEN_USER.ahk" { TOKEN_USER }
#Import "..\..\Security\SID_IDENTIFIER_AUTHORITY.ahk" { SID_IDENTIFIER_AUTHORITY }
#Import "..\..\Security\PSID.ahk" { PSID }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SE_TOKEN_USER {
    #StructPack 8

    TokenUser : TOKEN_USER

    Sid : SID

    static __New() {
        DefineProp(this.Prototype, 'User', { type: SID_AND_ATTRIBUTES, offset: 0 })
        DefineProp(this.Prototype, 'Buffer', { type: Int8[68], offset: 16 })
        this.DeleteProp("__New")
    }
}
