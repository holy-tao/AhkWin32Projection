#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of authentication used to connect to Remote Desktop Gateway (RD Gateway).
 * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/ne-tsgpolicyengine-aaauthschemes
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class AAAuthSchemes extends Win32Enum {

    /**
     * This value is reserved.
     * Native name: AA_AUTH_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 0

    /**
     * Basic protocol authentication.
     * Native name: AA_AUTH_BASIC
     * @type {Integer (Int32)}
     */
    static BASIC => 1

    /**
     * NTLM protocol authentication.
     * Native name: AA_AUTH_NTLM
     * @type {Integer (Int32)}
     */
    static NTLM => 2

    /**
     * Standard authentication.
     * Native name: AA_AUTH_SC
     * @type {Integer (Int32)}
     */
    static SC => 3

    /**
     * Windows logon credentials authentication.
     * Native name: AA_AUTH_LOGGEDONCREDENTIALS
     * @type {Integer (Int32)}
     */
    static LOGGEDONCREDENTIALS => 4

    /**
     * Microsoft Negotiate authentication.
     * Native name: AA_AUTH_NEGOTIATE
     * @type {Integer (Int32)}
     */
    static NEGOTIATE => 5

    /**
     * This value is reserved.
     * Native name: AA_AUTH_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 6

    /**
     * Cookie-based authentication.
     * Native name: AA_AUTH_COOKIE
     * @type {Integer (Int32)}
     */
    static COOKIE => 7

    /**
     * Digest access authentication.
     * Native name: AA_AUTH_DIGEST
     * @type {Integer (Int32)}
     */
    static DIGEST => 8

    /**
     * Claims-based authentication.
     * 
     * <b>Windows Server 2012, Windows 8, Windows Server 2008 R2 and Windows 7:  </b>Not supported.
     * Native name: AA_AUTH_ORGID
     * @type {Integer (Int32)}
     */
    static ORGID => 9

    /**
     * Authentication by reverse connection ID.
     * 
     * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012, Windows 8, Windows Server 2008 R2 and Windows 7:  </b>Not supported.
     * Native name: AA_AUTH_CONID
     * @type {Integer (Int32)}
     */
    static CONID => 10

    /**
     * Native name: AA_AUTH_SSPI_NTLM
     * @type {Integer (Int32)}
     */
    static SSPI_NTLM => 11

    /**
     * This value is reserved.
     * Native name: AA_AUTH_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 12
}
