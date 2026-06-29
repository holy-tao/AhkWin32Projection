#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_SERIALIZED_USER_CREDENTIAL {
    #StructPack 8

    SerializationLength : UInt32

    Serialization : IntPtr

}
