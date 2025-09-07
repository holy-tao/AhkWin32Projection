#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains listener settings for a remote session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_listener_settings_1
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_LISTENER_SETTINGS_1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The maximum number of protocol listener connections allowed. <b>ULONG_MAX</b> specifies the maximum number of connections.
     * @type {Integer}
     */
    MaxProtocolListenerConnectionCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    SecurityDescriptorSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The address of a buffer that contains the security descriptor for the protocol listener.
     * @type {Pointer<Byte>}
     */
    pSecurityDescriptor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
