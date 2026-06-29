#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NTMS_NOTIFICATIONINFORMATION structure defines an object and operation that occurred in the RSM database.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_notificationinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_NOTIFICATIONINFORMATION {
    #StructPack 4

    dwOperation : UInt32

    /**
     * Object Identifier.
     */
    ObjectId : Guid

}
