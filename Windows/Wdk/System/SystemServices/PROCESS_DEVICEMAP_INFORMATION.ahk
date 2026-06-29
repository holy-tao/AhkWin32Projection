#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_DEVICEMAP_INFORMATION {
    #StructPack 8


    struct _Set {
        DirectoryHandle : HANDLE

    }

    struct _Query {
        DriveMap : UInt32

        DriveType : Int8[32]

    }

    Set : PROCESS_DEVICEMAP_INFORMATION._Set

    static __New() {
        DefineProp(this.Prototype, 'Query', { type: PROCESS_DEVICEMAP_INFORMATION._Query, offset: 0 })
        this.DeleteProp("__New")
    }
}
