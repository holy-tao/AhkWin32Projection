#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of structure that a Remote Desktop Services function has returned in a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ne-wtsapi32-wts_type_class
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_TYPE_CLASS extends Win32Enum{

    /**
     * The buffer contains one or more <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_infoa">WTS_PROCESS_INFO</a> structures.
     * @type {Integer (Int32)}
     */
    static WTSTypeProcessInfoLevel0 => 0

    /**
     * The buffer contains one or more <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_info_exa">WTS_PROCESS_INFO_EX</a> structures.
     * @type {Integer (Int32)}
     */
    static WTSTypeProcessInfoLevel1 => 1

    /**
     * The buffer contains one or more <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_info_1a">WTS_SESSION_INFO_1</a> structures.
     * @type {Integer (Int32)}
     */
    static WTSTypeSessionInfoLevel1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static WTSTypeCloudAuthServerNonce => 3

    /**
     * @type {Integer (Int32)}
     */
    static WTSTypeSerializedUserCredential => 4
}
