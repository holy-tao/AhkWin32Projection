#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDEXT_FILELOCK_OWNER {
    #StructPack 8

    Sizeofstruct : UInt32

    FileObject : Int64

    OwnerThread : Int64

    WaitIrp : Int64

    DeviceObject : Int64

    BlockingDirver : CHAR[32]

}
