#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies whether the session is a reconnection and retrieves a value that identifies the session.
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-secpkgcontext_sessioninfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_SessionInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Bit flags that specify the type of session. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSL_SESSION_RECONNECT"></a><a id="ssl_session_reconnect"></a><dl>
     * <dt><b>SSL_SESSION_RECONNECT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session is a reconnection.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the <b>rgbSessionId</b> array.
     * @type {Integer}
     */
    cbSessionId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of up to 32 bytes that identifies the session.
     * @type {Array<Byte>}
     */
    rgbSessionId{
        get {
            if(!this.HasProp("__rgbSessionIdProxyArray"))
                this.__rgbSessionIdProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__rgbSessionIdProxyArray
        }
    }
}
