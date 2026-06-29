#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT {
    #StructPack 4

    MarshalCookie : UInt32

    UOW : Guid

}
