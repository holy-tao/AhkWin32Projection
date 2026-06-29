#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_MAILSLOT_QUERY_INFORMATION {
    #StructPack 8

    MaximumMessageSize : UInt32

    MailslotQuota : UInt32

    NextMessageSize : UInt32

    MessagesAvailable : UInt32

    ReadTimeout : Int64

}
