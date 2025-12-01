#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of authentication used to connect to Remote Desktop Gateway (RD Gateway).
 * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/ne-tsgpolicyengine-aaauthschemes
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class AAAuthSchemes extends Win32Enum{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_MIN => 0

    /**
     * Basic protocol authentication.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_BASIC => 1

    /**
     * NTLM protocol authentication.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_NTLM => 2

    /**
     * Standard authentication.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_SC => 3

    /**
     * Windows logon credentials authentication.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_LOGGEDONCREDENTIALS => 4

    /**
     * Microsoft Negotiate authentication.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_NEGOTIATE => 5

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_ANY => 6

    /**
     * Cookie-based authentication.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_COOKIE => 7

    /**
     * Digest access authentication.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_DIGEST => 8

    /**
     * Claims-based authentication.
     * 
     * <b>Windows Server 2012, Windows 8, Windows Server 2008 R2 and Windows 7:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_ORGID => 9

    /**
     * Authentication by reverse connection ID.
     * 
     * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012, Windows 8, Windows Server 2008 R2 and Windows 7:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_CONID => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AA_AUTH_SSPI_NTLM => 11

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static AA_AUTH_MAX => 12
}
