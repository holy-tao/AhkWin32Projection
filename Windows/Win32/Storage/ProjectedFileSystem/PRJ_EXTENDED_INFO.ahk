#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PRJ_EXT_INFO_TYPE.ahk" { PRJ_EXT_INFO_TYPE }

/**
 * Specifies optional extended information for directory enumeration and placeholder information.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_extended_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_EXTENDED_INFO {
    #StructPack 8


    struct _Symlink {
        TargetName : PWSTR

    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ne-projectedfslib-prj_ext_info_type">PRJ_EXT_INFO</a> value describing what kind of extended information this structure contains.
     */
    InfoType : PRJ_EXT_INFO_TYPE

    /**
     * Offset in bytes from the beginning of this structure to the next PRJ_EXTENDED_INFO structure.  If this is the last structure in the buffer this value must be 0.
     */
    NextInfoOffset : UInt32

    Symlink : PRJ_EXTENDED_INFO._Symlink

}
