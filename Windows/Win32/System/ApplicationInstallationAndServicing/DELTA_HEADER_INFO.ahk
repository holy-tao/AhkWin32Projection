#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\DELTA_HASH.ahk" { DELTA_HASH }
#Import "..\..\Security\Cryptography\ALG_ID.ahk" { ALG_ID }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct DELTA_HEADER_INFO {
    #StructPack 8

    FileTypeSet : Int64

    FileType : Int64

    Flags : Int64

    TargetSize : IntPtr

    TargetFileTime : FILETIME

    TargetHashAlgId : ALG_ID

    TargetHash : DELTA_HASH

}
