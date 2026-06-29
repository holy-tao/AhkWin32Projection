#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_TAG_DATA_BUFFER {
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

    struct _GenericGUIDReparseBuffer {
        TagGuid : Guid

        DataBuffer : Int8[1]

    }

    FileTag : UInt32

    TagDataLength : UInt16

    UnparsedNameLength : UInt16

    SymbolicLinkReparseBuffer : FLT_TAG_DATA_BUFFER._SymbolicLinkReparseBuffer

    static __New() {
        DefineProp(this.Prototype, 'MountPointReparseBuffer', { type: FLT_TAG_DATA_BUFFER._MountPointReparseBuffer, offset: 8 })
        DefineProp(this.Prototype, 'GenericReparseBuffer', { type: FLT_TAG_DATA_BUFFER._GenericReparseBuffer, offset: 8 })
        DefineProp(this.Prototype, 'GenericGUIDReparseBuffer', { type: FLT_TAG_DATA_BUFFER._GenericGUIDReparseBuffer, offset: 8 })
        this.DeleteProp("__New")
    }
}
