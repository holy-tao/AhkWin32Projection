#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FS_BPIO_OPERATIONS.ahk" { FS_BPIO_OPERATIONS }
#Import ".\FS_BPIO_OUTFLAGS.ahk" { FS_BPIO_OUTFLAGS }
#Import ".\FS_BPIO_RESULTS.ahk" { FS_BPIO_RESULTS }
#Import ".\FS_BPIO_INFO.ahk" { FS_BPIO_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FS_BPIO_OUTPUT {
    #StructPack 8

    Operation : FS_BPIO_OPERATIONS

    OutFlags : FS_BPIO_OUTFLAGS

    Reserved1 : Int64

    Reserved2 : Int64

    Enable : FS_BPIO_RESULTS

    static __New() {
        DefineProp(this.Prototype, 'Query', { type: FS_BPIO_RESULTS, offset: 24 })
        DefineProp(this.Prototype, 'VolumeStackResume', { type: FS_BPIO_RESULTS, offset: 24 })
        DefineProp(this.Prototype, 'StreamResume', { type: FS_BPIO_RESULTS, offset: 24 })
        DefineProp(this.Prototype, 'GetInfo', { type: FS_BPIO_INFO, offset: 24 })
        this.DeleteProp("__New")
    }
}
