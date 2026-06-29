#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IRecordInfo.ahk" { IRecordInfo }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct _wireBRECORD {
    #StructPack 8

    fFlags : UInt32

    clSize : UInt32

    pRecInfo : IRecordInfo

    pRecord : IntPtr

}
