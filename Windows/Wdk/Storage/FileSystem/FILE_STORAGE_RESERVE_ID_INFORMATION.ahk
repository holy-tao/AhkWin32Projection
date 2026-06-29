#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Ioctl\STORAGE_RESERVE_ID.ahk" { STORAGE_RESERVE_ID }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_STORAGE_RESERVE_ID_INFORMATION {
    #StructPack 4

    StorageReserveId : STORAGE_RESERVE_ID

}
