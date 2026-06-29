#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_FIRMWARE_TABLE_ACTION.ahk" { SYSTEM_FIRMWARE_TABLE_ACTION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SYSTEM_FIRMWARE_TABLE_INFORMATION {
    #StructPack 4

    ProviderSignature : UInt32

    Action : SYSTEM_FIRMWARE_TABLE_ACTION

    TableID : UInt32

    TableBufferLength : UInt32

    TableBuffer : Int8[1]

}
