#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Memory\VIRTUAL_ALLOCATION_TYPE.ahk" { VIRTUAL_ALLOCATION_TYPE }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MINIDUMP_MEMORY_INFO.ahk" { MINIDUMP_MEMORY_INFO }

/**
 * Contains information returned by the MiniDumpCallback function.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_output
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_CALLBACK_OUTPUT {
    #StructPack 8

    ModuleWriteFlags : UInt32

    MemorySize : UInt32

    Continue : BOOL

    static __New() {
        DefineProp(this.Prototype, 'ThreadWriteFlags', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'SecondaryFlags', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'MemoryBase', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'CheckCancel', { type: BOOL, offset: 0 })
        DefineProp(this.Prototype, 'Cancel', { type: BOOL, offset: 4 })
        DefineProp(this.Prototype, 'Handle', { type: HANDLE, offset: 0 })
        DefineProp(this.Prototype, 'VmRegion', { type: MINIDUMP_MEMORY_INFO, offset: 0 })
        DefineProp(this.Prototype, 'VmQueryStatus', { type: HRESULT, offset: 0 })
        DefineProp(this.Prototype, 'VmQueryResult', { type: MINIDUMP_MEMORY_INFO, offset: 8 })
        DefineProp(this.Prototype, 'VmReadStatus', { type: HRESULT, offset: 0 })
        DefineProp(this.Prototype, 'VmReadBytesCompleted', { type: UInt32, offset: 4 })
        DefineProp(this.Prototype, 'Status', { type: HRESULT, offset: 0 })
        this.DeleteProp("__New")
    }
}
