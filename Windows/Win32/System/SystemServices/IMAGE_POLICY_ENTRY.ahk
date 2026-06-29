#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_POLICY_ENTRY_TYPE.ahk" { IMAGE_POLICY_ENTRY_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\IMAGE_POLICY_ID.ahk" { IMAGE_POLICY_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_POLICY_ENTRY {
    #StructPack 8


    struct _u {
        None : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'BoolValue', { type: BOOLEAN, offset: 0 })
            DefineProp(this.Prototype, 'Int8Value', { type: Int8, offset: 0 })
            DefineProp(this.Prototype, 'UInt8Value', { type: Int8, offset: 0 })
            DefineProp(this.Prototype, 'Int16Value', { type: Int16, offset: 0 })
            DefineProp(this.Prototype, 'UInt16Value', { type: UInt16, offset: 0 })
            DefineProp(this.Prototype, 'Int32Value', { type: Int32, offset: 0 })
            DefineProp(this.Prototype, 'UInt32Value', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'Int64Value', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'UInt64Value', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'AnsiStringValue', { type: PSTR, offset: 0 })
            DefineProp(this.Prototype, 'UnicodeStringValue', { type: PWSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : IMAGE_POLICY_ENTRY_TYPE

    PolicyId : IMAGE_POLICY_ID

    u : IMAGE_POLICY_ENTRY._u

}
