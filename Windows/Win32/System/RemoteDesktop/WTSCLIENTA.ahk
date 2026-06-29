#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information about a Remote Desktop Connection (RDC) client. (ANSI)
 * @remarks
 * For the <b>ClientAddressFamily</b> member, <b>AF_INET</b>  (IPv4) will return in string format, for example "127.0.0.1". 
 * <b>AF_INET6</b> (IPv6) will return in binary form.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wtsapi32.h header defines WTSCLIENT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsclienta
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct WTSCLIENTA {
    #StructPack 4

    /**
     * The NetBIOS name of the client computer.
     */
    ClientName : CHAR[21]

    /**
     * The domain name of the client computer.
     */
    Domain : CHAR[18]

    /**
     * The client user name.
     */
    UserName : CHAR[21]

    /**
     * The folder for the initial program.
     */
    WorkDirectory : CHAR[261]

    /**
     * The program to start on connection.
     */
    InitialProgram : CHAR[261]

    /**
     * The security level of encryption.
     */
    EncryptionLevel : Int8

    /**
     * The address family. This member can be <b>AF_INET</b>, <b>AF_INET6</b>, <b>AF_IPX</b>, <b>AF_NETBIOS</b>, or <b>AF_UNSPEC</b>.
     */
    ClientAddressFamily : UInt32

    /**
     * The client network address.
     */
    ClientAddress : UInt16[31]

    /**
     * Horizontal dimension, in pixels, of the client's display.
     */
    HRes : UInt16

    /**
     * Vertical dimension, in pixels, of the client's display.
     */
    VRes : UInt16

    /**
     * Color depth of the client's display. For possible values, see the <b>ColorDepth</b> 
     *       member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> 
     *       structure.
     */
    ColorDepth : UInt16

    /**
     * The location of the client ActiveX control DLL.
     */
    ClientDirectory : CHAR[261]

    /**
     * The client build number.
     */
    ClientBuildNumber : UInt32

    /**
     * Reserved.
     */
    ClientHardwareId : UInt32

    /**
     * Reserved.
     */
    ClientProductId : UInt16

    /**
     * The number of output buffers on the server per session.
     */
    OutBufCountHost : UInt16

    /**
     * The number of output buffers on the client.
     */
    OutBufCountClient : UInt16

    /**
     * The length of the output buffers, in bytes.
     */
    OutBufLength : UInt16

    /**
     * The device ID of the network adapter.
     */
    DeviceId : CHAR[261]

}
