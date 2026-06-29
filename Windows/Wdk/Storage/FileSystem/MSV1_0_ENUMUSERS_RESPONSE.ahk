#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct MSV1_0_ENUMUSERS_RESPONSE {
    #StructPack 8

    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    NumberOfLoggedOnUsers : UInt32

    LogonIds : LUID.Ptr

    EnumHandles : IntPtr

}
