#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct FILTER_MESSAGE_HEADER {
    #StructPack 8

    ReplyLength : UInt32

    MessageId : Int64

}
