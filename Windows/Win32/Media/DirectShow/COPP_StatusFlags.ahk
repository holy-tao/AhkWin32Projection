#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the status of a Certified Output Protection Protocol (COPP) session.
 * @remarks
 * 
 * If COPP_LinkLost is returned, the application should release the current instance of the VMR, create a new instance of the VMR, and establish a new COPP session (including key exchange and certificate validation).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ne-dxva9typ-copp_statusflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_StatusFlags{

    /**
     * Normal status.
     * @type {Integer (Int32)}
     */
    static COPP_StatusNormal => 0

    /**
     * The integrity of the connection has been compromised. Examples of events that cause the driver to set this flag include:
     * 
     * <ul>
     * <li>The driver can no longer enforce the current protection level.</li>
     * <li>The driver detected an internal integrity error.</li>
     * <li>The connector between the computer and the display device was unplugged.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static COPP_LinkLost => 1

    /**
     * The connection configuration has changed. For example, the user has changed the desktop display mode.
     * @type {Integer (Int32)}
     */
    static COPP_RenegotiationRequired => 2

    /**
     * Reserved. Must be zero.
     * @type {Integer (Int32)}
     */
    static COPP_StatusFlagsReserved => -4
}
