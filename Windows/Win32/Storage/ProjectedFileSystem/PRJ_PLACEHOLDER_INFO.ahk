#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_FILE_BASIC_INFO.ahk" { PRJ_FILE_BASIC_INFO }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\PRJ_PLACEHOLDER_VERSION_INFO.ahk" { PRJ_PLACEHOLDER_VERSION_INFO }

/**
 * A buffer of metadata for the placeholder file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_placeholder_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_PLACEHOLDER_INFO {
    #StructPack 8


    struct _EaInformation {
        EaBufferSize : UInt32

        OffsetToFirstEa : UInt32

    }

    struct _SecurityInformation {
        SecurityBufferSize : UInt32

        OffsetToSecurityDescriptor : UInt32

    }

    struct _StreamsInformation {
        StreamsInfoBufferSize : UInt32

        OffsetToFirstStreamInfo : UInt32

    }

    /**
     * A structure that supplies basic information about the item: the size of the file in bytes (should be zero if the IsDirectory field is set to TRUE), the item’s timestamps, and its attributes.
     */
    FileBasicInfo : PRJ_FILE_BASIC_INFO

    /**
     * A structure that supplies extended attribute (EA) information about the item.
     */
    EaInformation : PRJ_PLACEHOLDER_INFO._EaInformation

    /**
     * Supplies custom security descriptor information about the item.
     */
    SecurityInformation : PRJ_PLACEHOLDER_INFO._SecurityInformation

    /**
     * Supplies information about alternate data streams for the item.
     */
    StreamsInformation : PRJ_PLACEHOLDER_INFO._StreamsInformation

    VersionInfo : PRJ_PLACEHOLDER_VERSION_INFO

    /**
     * Start of the variable-length buffer to hold EAs, a custom security descriptor, and alternate data stream information.
     */
    VariableData : Int8[1]

}
