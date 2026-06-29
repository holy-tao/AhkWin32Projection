#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct LDR_DATA_TABLE_ENTRY {
    #StructPack 8

    Reserved1 : IntPtr[2]

    InMemoryOrderLinks : LIST_ENTRY

    Reserved2 : IntPtr[2]

    DllBase : IntPtr

    Reserved3 : IntPtr[2]

    FullDllName : UNICODE_STRING

    Reserved4 : Int8[8]

    Reserved5 : IntPtr[3]

    CheckSum : UInt32

    TimeDateStamp : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Reserved6', { type: IntPtr, offset: 120 })
        this.DeleteProp("__New")
    }
}
