#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PS_CREATE_NOTIFY_INFO {
    #StructPack 8

    Size : IntPtr

    Flags : UInt32


    /**
     * @type {Integer}
     */
    FileOpenNameAvailable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    IsSubsystemProcess {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    ParentProcessId : HANDLE

    CreatingThreadId : IntPtr

    FileObject : FILE_OBJECT.Ptr

    ImageFileName : UNICODE_STRING.Ptr

    CommandLine : UNICODE_STRING.Ptr

    CreationStatus : NTSTATUS

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 8 })
        this.DeleteProp("__New")
    }
}
