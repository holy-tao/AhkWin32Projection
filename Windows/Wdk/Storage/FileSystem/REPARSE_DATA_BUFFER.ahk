#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REPARSE_DATA_BUFFER {
    #StructPack 4


    struct _SymbolicLinkReparseBuffer {
        SubstituteNameOffset : UInt16

        SubstituteNameLength : UInt16

        PrintNameOffset : UInt16

        PrintNameLength : UInt16

        Flags : UInt32

        PathBuffer : WCHAR[1]

    }

    struct _MountPointReparseBuffer {
        SubstituteNameOffset : UInt16

        SubstituteNameLength : UInt16

        PrintNameOffset : UInt16

        PrintNameLength : UInt16

        PathBuffer : WCHAR[1]

    }

    struct _GenericReparseBuffer {
        DataBuffer : Int8[1]

    }

    ReparseTag : UInt32

    ReparseDataLength : UInt16

    Reserved : UInt16

    SymbolicLinkReparseBuffer : REPARSE_DATA_BUFFER._SymbolicLinkReparseBuffer

    static __New() {
        DefineProp(this.Prototype, 'MountPointReparseBuffer', { type: REPARSE_DATA_BUFFER._MountPointReparseBuffer, offset: 8 })
        DefineProp(this.Prototype, 'GenericReparseBuffer', { type: REPARSE_DATA_BUFFER._GenericReparseBuffer, offset: 8 })
        this.DeleteProp("__New")
    }
}
