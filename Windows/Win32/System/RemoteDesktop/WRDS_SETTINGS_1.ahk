#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WRDS_SETTING_STATUS.ahk" { WRDS_SETTING_STATUS }

/**
 * Contains policy-related settings for a remote session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_settings_1
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_SETTINGS_1 {
    #StructPack 4

    /**
     * The clipboard redirection state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     */
    WRdsDisableClipStatus : WRDS_SETTING_STATUS

    /**
     * The clipboard redirection value. A value of 1 indicates that clipboard functionality is disabled (clipboard redirection is enabled); any other value means clipboard functionality is enabled. This value only takes effect if the <b>WRdsDisableClipStatus</b> member is set to enabled.
     */
    WRdsDisableClipValue : UInt32

    /**
     * The LPT printer redirection state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     */
    WRdsDisableLPTStatus : WRDS_SETTING_STATUS

    /**
     * The LPT printer redirection value. A value of 1 indicates that LPT printer redirection is enabled; any other value means LPT printer redirection is disabled. This value only takes effect if the <b>WRdsDisableLPTStatus</b> member is set to enabled.
     */
    WRdsDisableLPTValue : UInt32

    /**
     * The COM port mapping state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     */
    WRdsDisableCcmStatus : WRDS_SETTING_STATUS

    /**
     * The COM port mapping value. A value of 1 indicates that COM port mapping is enabled; any other value means COM port mapping is disabled. This value only takes effect if the <b>WRdsDisableCcmStatus</b> member is set to enabled.
     */
    WRdsDisableCcmValue : UInt32

    /**
     * The drive mapping state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     */
    WRdsDisableCdmStatus : WRDS_SETTING_STATUS

    /**
     * The drive mapping value. A value of 1 indicates that drive mapping is enabled; any other value means drive mapping is disabled. This value only takes effect if the <b>WRdsDisableCdmStatus</b> member is set to enabled.
     */
    WRdsDisableCdmValue : UInt32

    /**
     * The printer mapping state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791784(v=ws.10)">Printer Redirection</a>.
     */
    WRdsDisableCpmStatus : WRDS_SETTING_STATUS

    /**
     * The printer mapping value. A value of 1 indicates that printer mapping is enabled; any other value means printer mapping is disabled. This value only takes effect if the <b>WRdsDisableCpmStatus</b> member is set to enabled.
     */
    WRdsDisableCpmValue : UInt32

    /**
     * The state of the setting that controls Plug and Play (PNP) redirection (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     */
    WRdsDisablePnpStatus : WRDS_SETTING_STATUS

    /**
     * The PNP redirection value. A value of 1 indicates that PNP redirection is enabled; any other value means PNP redirection is disabled. This value only takes effect if the <b>WRdsDisablePnpStatus</b> member is set to enabled.
     */
    WRdsDisablePnpValue : UInt32

    /**
     * The encryption level state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791904(v=ws.10)">Security</a>.
     */
    WRdsEncryptionLevelStatus : WRDS_SETTING_STATUS

    /**
     * The encryption level value. This value only takes effect if the <b>WRdsEncryptionLevelStatus</b> member is set to enabled.
     */
    WRdsEncryptionValue : UInt32

    /**
     * The color depth state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791847(v=ws.10)">Remote Session Environment</a>.
     */
    WRdsColorDepthStatus : WRDS_SETTING_STATUS

    /**
     * The color depth value. For possible values, see the <b>ColorDepth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> structure. This value only takes effect if the <b>WRdsColorDepthStatus</b> member is set to enabled.
     */
    WRdsColorDepthValue : UInt32

    /**
     * The automatic client reconnection state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791922(v=ws.10)">Connections</a>.
     */
    WRdsDisableAutoReconnecetStatus : WRDS_SETTING_STATUS

    /**
     * The automatic client reconnection value. A value of 1 indicates that automatic client reconnection is disabled; any other value means automatic client reconnection is enabled. This value only takes effect if the <b>WRdsDisableAutoReconnecetStatus</b> member is set to enabled.
     */
    WRdsDisableAutoReconnecetValue : UInt32

    /**
     * The state (not applicable, disabled, enabled, or not configured) of the setting that controls whether to disable encryption for communication between the client and the server. For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791904(v=ws.10)">Security</a>.
     */
    WRdsDisableEncryptionStatus : WRDS_SETTING_STATUS

    /**
     * The encryption disabling value. A value of 1 indicates that encryption is disabled; any other value means encryption is required. This value only takes effect if the <b>WRdsDisableEncryptionStatus</b> member is set to enabled.
     */
    WRdsDisableEncryptionValue : UInt32

    /**
     * The state (not applicable, disabled, enabled, or not configured) of the setting that controls how the server reacts when the connection or idle timers expire, or when a connection is lost due to a connection error. For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791741(v=ws.10)">Session Time Limits</a>.
     */
    WRdsResetBrokenStatus : WRDS_SETTING_STATUS

    /**
     * The value of the setting that controls the server reaction.  A value of 1 indicates that the session is terminated whenever the time-out limit is reached; any other value means the session is disconnected but remains on the server. This value only takes effect if the <b>WRdsResetBrokenStatus</b> member is set to enabled.
     */
    WRdsResetBrokenValue : UInt32

    /**
     * The maximum idle time state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791741(v=ws.10)">Session Time Limits</a>.
     */
    WRdsMaxIdleTimeStatus : WRDS_SETTING_STATUS

    /**
     * The maximum amount of time, in minutes, that the Remote Desktop Services session can remain idle. This value only takes effect if the <b>WRdsMaxIdleTimeStatus</b> member is set to enabled.
     */
    WRdsMaxIdleTimeValue : UInt32

    /**
     * The maximum disconnection time state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791741(v=ws.10)">Session Time Limits</a>.
     */
    WRdsMaxDisconnectTimeStatus : WRDS_SETTING_STATUS

    /**
     * The maximum amount of time, in minutes, that a disconnected Remote Desktop Services session remains active on the RD Session Host server.
     * 
     * This value only takes effect if the <b>WRdsMaxDisconnectTimeStatus</b> member is set to enabled.
     */
    WRdsMaxDisconnectTimeValue : UInt32

    /**
     * The maximum connection time state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791741(v=ws.10)">Session Time Limits</a>.
     */
    WRdsMaxConnectTimeStatus : WRDS_SETTING_STATUS

    /**
     * The maximum duration of the Remote Desktop Services session, in minutes. This value only takes effect if the <b>WRdsMaxConnectTimeStatus</b> member is set to enabled.
     */
    WRdsMaxConnectTimeValue : UInt32

    /**
     * The state (not applicable, disabled, enabled, or not configured) of the <i>keep alive</i> setting.  The keep alive setting controls whether to check to keep a Remote Desktop Services session active. For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791922(v=ws.10)">Connections</a>.
     */
    WRdsKeepAliveStatus : WRDS_SETTING_STATUS

    /**
     * Specifies whether or not the keep alive setting is enabled.
     */
    WRdsKeepAliveStartValue : BOOLEAN

    /**
     * The amount of time, in minutes, of idle time before the state of the Remote Desktop Services session is checked. This value only takes effect if the <b>WRdsKeepAliveStatus</b> member is set to enabled.
     */
    WRdsKeepAliveIntervalValue : UInt32

}
