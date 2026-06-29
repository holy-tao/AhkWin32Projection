#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_EVENT_LOG_ENTRY_TYPE.ahk" { WHEA_EVENT_LOG_ENTRY_TYPE }
#Import ".\WHEA_EVENT_LOG_ENTRY_ID.ahk" { WHEA_EVENT_LOG_ENTRY_ID }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_EVENT_LOG_ENTRY_HEADER {
    #StructPack 8

    Signature : UInt32

    Version : UInt32

    Length : UInt32

    Type : WHEA_EVENT_LOG_ENTRY_TYPE

    OwnerTag : UInt32

    Id : WHEA_EVENT_LOG_ENTRY_ID

    Flags : IntPtr

    PayloadLength : UInt32

}
