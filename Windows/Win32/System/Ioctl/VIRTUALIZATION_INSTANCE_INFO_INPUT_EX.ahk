#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct VIRTUALIZATION_INSTANCE_INFO_INPUT_EX {
    #StructPack 4

    HeaderSize : UInt16

    Flags : UInt32

    NotificationInfoSize : UInt32

    NotificationInfoOffset : UInt16

    ProviderMajorVersion : UInt16

}
