#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of structure that a Remote Desktop Services function has returned in a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ne-wtsapi32-wts_type_class
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTS_TYPE_CLASS extends Win32Enum {

    /**
     * The buffer contains one or more <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_infoa">WTS_PROCESS_INFO</a> structures.
     * Native name: WTSTypeProcessInfoLevel0
     * @type {Integer (Int32)}
     */
    static ProcessInfoLevel0 => 0

    /**
     * The buffer contains one or more <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_info_exa">WTS_PROCESS_INFO_EX</a> structures.
     * Native name: WTSTypeProcessInfoLevel1
     * @type {Integer (Int32)}
     */
    static ProcessInfoLevel1 => 1

    /**
     * The buffer contains one or more <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_info_1a">WTS_SESSION_INFO_1</a> structures.
     * Native name: WTSTypeSessionInfoLevel1
     * @type {Integer (Int32)}
     */
    static SessionInfoLevel1 => 2

    /**
     * Native name: WTSTypeCloudAuthServerNonce
     * @type {Integer (Int32)}
     */
    static CloudAuthServerNonce => 3

    /**
     * Native name: WTSTypeSerializedUserCredential
     * @type {Integer (Int32)}
     */
    static SerializedUserCredential => 4
}
