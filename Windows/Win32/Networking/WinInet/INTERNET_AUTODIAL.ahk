#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Causes 
  * <b>InternetAutodial</b> to fail if file and printer sharing is disabled for Windows 95 or later.
  * 
  * <b>Windows Server 2008 and Windows Vista:  </b>This flag is  obsolete.
 * @see https://learn.microsoft.com/windows/win32/api//content/wininet/nf-wininet-internetautodial
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_AUTODIAL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTODIAL_FAILIFSECURITYCHECK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTODIAL_FORCE_ONLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTODIAL_FORCE_UNATTENDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT => 8
}
