#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains policy-related settings for a remote session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_settings_1
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_SETTINGS_1 extends Win32Struct
{
    static sizeof => 124

    static packingSize => 4

    /**
     * The clipboard redirection state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     * @type {Integer}
     */
    WRdsDisableClipStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The clipboard redirection value. A value of 1 indicates that clipboard functionality is disabled (clipboard redirection is enabled); any other value means clipboard functionality is enabled. This value only takes effect if the <b>WRdsDisableClipStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsDisableClipValue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The LPT printer redirection state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     * @type {Integer}
     */
    WRdsDisableLPTStatus {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The LPT printer redirection value. A value of 1 indicates that LPT printer redirection is enabled; any other value means LPT printer redirection is disabled. This value only takes effect if the <b>WRdsDisableLPTStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsDisableLPTValue {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The COM port mapping state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     * @type {Integer}
     */
    WRdsDisableCcmStatus {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The COM port mapping value. A value of 1 indicates that COM port mapping is enabled; any other value means COM port mapping is disabled. This value only takes effect if the <b>WRdsDisableCcmStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsDisableCcmValue {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The drive mapping state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     * @type {Integer}
     */
    WRdsDisableCdmStatus {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The drive mapping value. A value of 1 indicates that drive mapping is enabled; any other value means drive mapping is disabled. This value only takes effect if the <b>WRdsDisableCdmStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsDisableCdmValue {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The printer mapping state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791784(v=ws.10)">Printer Redirection</a>.
     * @type {Integer}
     */
    WRdsDisableCpmStatus {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The printer mapping value. A value of 1 indicates that printer mapping is enabled; any other value means printer mapping is disabled. This value only takes effect if the <b>WRdsDisableCpmStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsDisableCpmValue {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The state of the setting that controls Plug and Play (PNP) redirection (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791794(v=ws.10)">Device and Resource Redirection</a>.
     * @type {Integer}
     */
    WRdsDisablePnpStatus {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The PNP redirection value. A value of 1 indicates that PNP redirection is enabled; any other value means PNP redirection is disabled. This value only takes effect if the <b>WRdsDisablePnpStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsDisablePnpValue {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The encryption level state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791904(v=ws.10)">Security</a>.
     * @type {Integer}
     */
    WRdsEncryptionLevelStatus {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * The encryption level value. This value only takes effect if the <b>WRdsEncryptionLevelStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsEncryptionValue {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The color depth state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791847(v=ws.10)">Remote Session Environment</a>.
     * @type {Integer}
     */
    WRdsColorDepthStatus {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * The color depth value. For possible values, see the <b>ColorDepth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> structure. This value only takes effect if the <b>WRdsColorDepthStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsColorDepthValue {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The automatic client reconnection state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791922(v=ws.10)">Connections</a>.
     * @type {Integer}
     */
    WRdsDisableAutoReconnecetStatus {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * The automatic client reconnection value. A value of 1 indicates that automatic client reconnection is disabled; any other value means automatic client reconnection is enabled. This value only takes effect if the <b>WRdsDisableAutoReconnecetStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsDisableAutoReconnecetValue {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The state (not applicable, disabled, enabled, or not configured) of the setting that controls whether to disable encryption for communication between the client and the server. For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791904(v=ws.10)">Security</a>.
     * @type {Integer}
     */
    WRdsDisableEncryptionStatus {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * The encryption disabling value. A value of 1 indicates that encryption is disabled; any other value means encryption is required. This value only takes effect if the <b>WRdsDisableEncryptionStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsDisableEncryptionValue {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The state (not applicable, disabled, enabled, or not configured) of the setting that controls how the server reacts when the connection or idle timers expire, or when a connection is lost due to a connection error. For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791741(v=ws.10)">Session Time Limits</a>.
     * @type {Integer}
     */
    WRdsResetBrokenStatus {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * The value of the setting that controls the server reaction.  A value of 1 indicates that the session is terminated whenever the time-out limit is reached; any other value means the session is disconnected but remains on the server. This value only takes effect if the <b>WRdsResetBrokenStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsResetBrokenValue {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * The maximum idle time state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791741(v=ws.10)">Session Time Limits</a>.
     * @type {Integer}
     */
    WRdsMaxIdleTimeStatus {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * The maximum amount of time, in minutes, that the Remote Desktop Services session can remain idle. This value only takes effect if the <b>WRdsMaxIdleTimeStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsMaxIdleTimeValue {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * The maximum disconnection time state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791741(v=ws.10)">Session Time Limits</a>.
     * @type {Integer}
     */
    WRdsMaxDisconnectTimeStatus {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * The maximum amount of time, in minutes, that a disconnected Remote Desktop Services session remains active on the RD Session Host server.
     * 
     * This value only takes effect if the <b>WRdsMaxDisconnectTimeStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsMaxDisconnectTimeValue {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * The maximum connection time state (not applicable, disabled, enabled, or not configured). For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791741(v=ws.10)">Session Time Limits</a>.
     * @type {Integer}
     */
    WRdsMaxConnectTimeStatus {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * The maximum duration of the Remote Desktop Services session, in minutes. This value only takes effect if the <b>WRdsMaxConnectTimeStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsMaxConnectTimeValue {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * The state (not applicable, disabled, enabled, or not configured) of the <i>keep alive</i> setting.  The keep alive setting controls whether to check to keep a Remote Desktop Services session active. For more information, see the group policy node topic for <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee791922(v=ws.10)">Connections</a>.
     * @type {Integer}
     */
    WRdsKeepAliveStatus {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Specifies whether or not the keep alive setting is enabled.
     * @type {Integer}
     */
    WRdsKeepAliveStartValue {
        get => NumGet(this, 116, "char")
        set => NumPut("char", value, this, 116)
    }

    /**
     * The amount of time, in minutes, of idle time before the state of the Remote Desktop Services session is checked. This value only takes effect if the <b>WRdsKeepAliveStatus</b> member is set to enabled.
     * @type {Integer}
     */
    WRdsKeepAliveIntervalValue {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }
}
