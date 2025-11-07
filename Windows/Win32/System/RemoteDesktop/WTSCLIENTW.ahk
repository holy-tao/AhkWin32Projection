#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Remote Desktop Connection (RDC) client.
 * @remarks
 * 
 * For the <b>ClientAddressFamily</b> member, <b>AF_INET</b>  (IPv4) will return in string format, for example "127.0.0.1". 
 * <b>AF_INET6</b> (IPv6) will return in binary form.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wtsapi32.h header defines WTSCLIENT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ns-wtsapi32-wtsclientw
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class WTSCLIENTW extends Win32Struct
{
    static sizeof => 2304

    static packingSize => 4

    /**
     * The NetBIOS name of the client computer.
     * @type {String}
     */
    ClientName {
        get => StrGet(this.ptr + 0, 20, "UTF-16")
        set => StrPut(value, this.ptr + 0, 20, "UTF-16")
    }

    /**
     * The domain name of the client computer.
     * @type {String}
     */
    Domain {
        get => StrGet(this.ptr + 42, 17, "UTF-16")
        set => StrPut(value, this.ptr + 42, 17, "UTF-16")
    }

    /**
     * The client user name.
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 78, 20, "UTF-16")
        set => StrPut(value, this.ptr + 78, 20, "UTF-16")
    }

    /**
     * The folder for the initial program.
     * @type {String}
     */
    WorkDirectory {
        get => StrGet(this.ptr + 120, 260, "UTF-16")
        set => StrPut(value, this.ptr + 120, 260, "UTF-16")
    }

    /**
     * The program to start on connection.
     * @type {String}
     */
    InitialProgram {
        get => StrGet(this.ptr + 642, 260, "UTF-16")
        set => StrPut(value, this.ptr + 642, 260, "UTF-16")
    }

    /**
     * The security level of encryption.
     * @type {Integer}
     */
    EncryptionLevel {
        get => NumGet(this, 1164, "char")
        set => NumPut("char", value, this, 1164)
    }

    /**
     * The address family. This member can be <b>AF_INET</b>, <b>AF_INET6</b>, <b>AF_IPX</b>, <b>AF_NETBIOS</b>, or <b>AF_UNSPEC</b>.
     * @type {Integer}
     */
    ClientAddressFamily {
        get => NumGet(this, 1168, "uint")
        set => NumPut("uint", value, this, 1168)
    }

    /**
     * The client network address.
     * @type {Array<UInt16>}
     */
    ClientAddress{
        get {
            if(!this.HasProp("__ClientAddressProxyArray"))
                this.__ClientAddressProxyArray := Win32FixedArray(this.ptr + 1172, 31, Primitive, "ushort")
            return this.__ClientAddressProxyArray
        }
    }

    /**
     * Horizontal dimension, in pixels, of the client's display.
     * @type {Integer}
     */
    HRes {
        get => NumGet(this, 1234, "ushort")
        set => NumPut("ushort", value, this, 1234)
    }

    /**
     * Vertical dimension, in pixels, of the client's display.
     * @type {Integer}
     */
    VRes {
        get => NumGet(this, 1236, "ushort")
        set => NumPut("ushort", value, this, 1236)
    }

    /**
     * Color depth of the client's display. For possible values, see the <b>ColorDepth</b> 
     *       member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> 
     *       structure.
     * @type {Integer}
     */
    ColorDepth {
        get => NumGet(this, 1238, "ushort")
        set => NumPut("ushort", value, this, 1238)
    }

    /**
     * The location of the client ActiveX control DLL.
     * @type {String}
     */
    ClientDirectory {
        get => StrGet(this.ptr + 1240, 260, "UTF-16")
        set => StrPut(value, this.ptr + 1240, 260, "UTF-16")
    }

    /**
     * The client build number.
     * @type {Integer}
     */
    ClientBuildNumber {
        get => NumGet(this, 1764, "uint")
        set => NumPut("uint", value, this, 1764)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ClientHardwareId {
        get => NumGet(this, 1768, "uint")
        set => NumPut("uint", value, this, 1768)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ClientProductId {
        get => NumGet(this, 1772, "ushort")
        set => NumPut("ushort", value, this, 1772)
    }

    /**
     * The number of output buffers on the server per session.
     * @type {Integer}
     */
    OutBufCountHost {
        get => NumGet(this, 1774, "ushort")
        set => NumPut("ushort", value, this, 1774)
    }

    /**
     * The number of output buffers on the client.
     * @type {Integer}
     */
    OutBufCountClient {
        get => NumGet(this, 1776, "ushort")
        set => NumPut("ushort", value, this, 1776)
    }

    /**
     * The length of the output buffers, in bytes.
     * @type {Integer}
     */
    OutBufLength {
        get => NumGet(this, 1778, "ushort")
        set => NumPut("ushort", value, this, 1778)
    }

    /**
     * The device ID of the network adapter.
     * @type {String}
     */
    DeviceId {
        get => StrGet(this.ptr + 1780, 260, "UTF-16")
        set => StrPut(value, this.ptr + 1780, 260, "UTF-16")
    }
}
