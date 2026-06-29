#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct ENCRYPTION_KEY_CTRL_INPUT {
    #StructPack 8

    HeaderSize : UInt32

    StructureSize : UInt32

    KeyOffset : UInt16

    KeySize : UInt16

    DplLock : UInt32

    DplUserId : Int64

    DplCredentialId : Int64

}
