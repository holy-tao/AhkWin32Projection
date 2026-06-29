#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFLT_VOLUME.ahk" { PFLT_VOLUME }
#Import ".\FLT_FILE_NAME_INFORMATION.ahk" { FLT_FILE_NAME_INFORMATION }
#Import ".\PFLT_INSTANCE.ahk" { PFLT_INSTANCE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_CREATEFILE_TARGET_ECP_CONTEXT {
    #StructPack 8

    Instance : PFLT_INSTANCE

    Volume : PFLT_VOLUME

    FileNameInformation : FLT_FILE_NAME_INFORMATION.Ptr

    Flags : UInt16

}
