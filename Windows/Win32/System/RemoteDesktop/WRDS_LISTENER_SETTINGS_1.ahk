#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains listener settings for a remote session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_listener_settings_1
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_LISTENER_SETTINGS_1 {
    #StructPack 8

    /**
     * The maximum number of protocol listener connections allowed. <b>ULONG_MAX</b> specifies the maximum number of connections.
     */
    MaxProtocolListenerConnectionCount : UInt32

    SecurityDescriptorSize : UInt32

    /**
     * The address of a buffer that contains the security descriptor for the protocol listener.
     */
    pSecurityDescriptor : IntPtr

}
