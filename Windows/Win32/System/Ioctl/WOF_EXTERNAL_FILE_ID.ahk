#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\FileSystem\FILE_ID_128.ahk" { FILE_ID_128 }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WOF_EXTERNAL_FILE_ID {
    #StructPack 1

    FileId : FILE_ID_128

}
