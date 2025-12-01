#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WSADATA (winsock.h) structure contains information about the Windows Sockets implementation.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> function initiates the use of the Windows Sockets DLL by a process.  The <b>WSAStartup</b> function returns a pointer to the  
 * <b>WSADATA</b> structure in the <i>lpWSAData</i> parameter.
 * 		
 * 
 * The current version of the Windows Sockets specification returned in the <b>wHighVersion</b> member of the  
 * <b>WSADATA</b> structure is version 2.2 encoded with the major version number in the low-byte and the minor version number in the high-byte. This version of the current Winsock DLL, <i>Ws2_32.dll</i>, supports applications that request  any of the following  versions of the Windows Sockets specification:<ul>
 * <li>1.0</li>
 * <li>1.1</li>
 * <li>2.0</li>
 * <li>2.1</li>
 * <li>2.2</li>
 * </ul>Depending on the version requested by the application, one of the above version numbers is the value encoded as the major version number in the low-byte and the minor version number in the high-byte that is returned in the <b>wVersion</b> member of the <b>WSADATA</b> structure. 
 * 
 * <div class="alert"><b>Note</b>  An application should ignore the <b>iMaxsockets</b>, <b>iMaxUdpDg</b>, and <b>lpVendorInfo</b> members in <b>WSADATA</b> if the value in <b>wVersion</b> after a successful call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> is at least 2. This is because the architecture of Windows Sockets changed in version 2 to support multiple providers, and <b>WSADATA</b> no longer applies to a single vendor's stack. Two new socket options are introduced to supply provider-specific information: SO_MAX_MSG_SIZE (replaces the <b>iMaxUdpDg</b> member) and PVD_CONFIG (allows any other provider-specific configuration to occur).</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-wsadata
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSADATA extends Win32Struct
{
    static sizeof => 792

    static packingSize => 8

    /**
     * Type: <b>WORD</b>
     * 
     * The version of the Windows Sockets specification that the <i>Ws2_32.dll</i> expects the caller to use. The high-order byte specifies the minor version number; the low-order byte specifies the major version number.
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The highest version of the Windows Sockets specification that the <i>Ws2_32.dll</i> can support. The high-order byte specifies the minor version number; the low-order byte specifies the major version number. 
     * 
     * This is the same value as the <b>wVersion</b> member when the version requested in the <i>wVersionRequested</i> parameter passed to the  <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> function is the highest version of the Windows Sockets specification that the <i>Ws2_32.dll</i> can support.
     * @type {Integer}
     */
    wHighVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * The maximum number of sockets that may be opened. This member should be ignored for Windows Sockets version 2 and later. 
     * 
     * The <b>iMaxSockets</b> member is retained for compatibility with Windows Sockets specification 1.1, but should not be used when developing new applications. No single value can be appropriate for all underlying service providers. The architecture of Windows Sockets changed in version 2 to support multiple providers, and the <b>WSADATA</b> structure no longer applies to a single vendor's stack.
     * @type {Integer}
     */
    iMaxSockets {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * The maximum datagram message size. This member is ignored for Windows Sockets version 2 and later. 
     * 
     * The <b>iMaxUdpDg</b> member is retained for compatibility with Windows Sockets specification 1.1, but should not be used when developing new applications. The architecture of Windows Sockets changed in version 2 to support multiple providers, and the <b>WSADATA</b> structure no longer applies to a single vendor's stack. For the actual maximum message size specific to a particular Windows Sockets service provider and socket type, applications should use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> to retrieve the value of option SO_MAX_MSG_SIZE after a socket has been created.
     * @type {Integer}
     */
    iMaxUdpDg {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Type: <b>char FAR*</b>
     * 
     * A pointer to vendor-specific information. This member should be ignored for Windows Sockets version 2 and later. 
     * 
     * The <b>lpVendorInfo</b> member is retained for compatibility with Windows Sockets specification 1.1. The architecture of Windows Sockets changed in version 2 to support multiple providers, and the <b>WSADATA</b> structure no longer applies to a single vendor's stack. Applications needing to access vendor-specific configuration information should use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> to retrieve the value of option PVD_CONFIG for vendor-specific information.
     * @type {PSTR}
     */
    lpVendorInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>char[WSADESCRIPTION_LEN+1]</b>
     * 
     * A <b>NULL</b>-terminated ASCII string into which the <i>Ws2_32.dll</i> copies a description of the Windows Sockets implementation. The text (up to 256 characters in length) can contain any characters except control and formatting characters. The most likely use that an application would have for this member is to display it (possibly truncated) in a status message.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 16, 256, "UTF-16")
        set => StrPut(value, this.ptr + 16, 256, "UTF-16")
    }

    /**
     * Type: <b>char[WSASYS_STATUS_LEN+1]</b>
     * 
     * A <b>NULL</b>-terminated ASCII string into which the <i>Ws2_32.dll</i> copies relevant status or configuration information. The <i>Ws2_32.dll</i> should use this parameter only if the information might be useful to the user or support staff. This member should not be considered as an extension of the <b>szDescription</b> parameter.
     * @type {String}
     */
    szSystemStatus {
        get => StrGet(this.ptr + 530, 128, "UTF-16")
        set => StrPut(value, this.ptr + 530, 128, "UTF-16")
    }
}
