#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Ioctl\FS_BPIO_INFLAGS.ahk" { FS_BPIO_INFLAGS }
#Import "..\..\..\Win32\System\Ioctl\FS_BPIO_OPERATIONS.ahk" { FS_BPIO_OPERATIONS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FS_BPIO_INPUT {
    #StructPack 8

    Operation : FS_BPIO_OPERATIONS

    InFlags : FS_BPIO_INFLAGS

    Reserved1 : Int64

    Reserved2 : Int64

}
