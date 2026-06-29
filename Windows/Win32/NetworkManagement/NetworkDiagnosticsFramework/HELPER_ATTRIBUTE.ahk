#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LIFE_TIME.ahk" { LIFE_TIME }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\OCTET_STRING.ahk" { OCTET_STRING }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DIAG_SOCKADDR.ahk" { DIAG_SOCKADDR }
#Import ".\ATTRIBUTE_TYPE.ahk" { ATTRIBUTE_TYPE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The HELPER_ATTRIBUTE structure contains all NDF supported data types.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-helper_attribute
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct HELPER_ATTRIBUTE {
    #StructPack 8

    /**
     * Type: <b>[string] LPWSTR</b>
     * 
     * A pointer to a null-terminated string that contains the name of the attribute.
     */
    pwszName : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ne-ndattrib-attribute_type">ATTRIBUTE_TYPE</a></b>
     * 
     * The type of helper attribute.
     */
    type : ATTRIBUTE_TYPE

    Boolean : BOOL

    static __New() {
        DefineProp(this.Prototype, 'Char', { type: Int8, offset: 16 })
        DefineProp(this.Prototype, 'Byte', { type: Int8, offset: 16 })
        DefineProp(this.Prototype, 'Short', { type: Int16, offset: 16 })
        DefineProp(this.Prototype, 'Word', { type: UInt16, offset: 16 })
        DefineProp(this.Prototype, 'Int', { type: Int32, offset: 16 })
        DefineProp(this.Prototype, 'DWord', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'Int64', { type: Int64, offset: 16 })
        DefineProp(this.Prototype, 'UInt64', { type: Int64, offset: 16 })
        DefineProp(this.Prototype, 'PWStr', { type: PWSTR, offset: 16 })
        DefineProp(this.Prototype, 'Guid', { type: Guid, offset: 16 })
        DefineProp(this.Prototype, 'LifeTime', { type: LIFE_TIME, offset: 16 })
        DefineProp(this.Prototype, 'Address', { type: DIAG_SOCKADDR, offset: 16 })
        DefineProp(this.Prototype, 'OctetString', { type: OCTET_STRING, offset: 16 })
        this.DeleteProp("__New")
    }
}
