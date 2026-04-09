#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CTRL_LEVEL.ahk
#Include .\ATTENDEE_DISCONNECT_REASON.ahk
#Include .\CHANNEL_PRIORITY.ahk
#Include .\CHANNEL_FLAGS.ahk
#Include .\CHANNEL_ACCESS_ENUM.ahk
#Include .\RDPENCOMAPI_ATTENDEE_FLAGS.ahk
#Include .\RDPSRAPI_WND_FLAGS.ahk
#Include .\RDPSRAPI_APP_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.DesktopSharing
 */
class __ReferenceRemainingTypes__ extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {CTRL_LEVEL}
     */
    __ctrlLevel__ {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {ATTENDEE_DISCONNECT_REASON}
     */
    __attendeeDisconnectReason__ {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {CHANNEL_PRIORITY}
     */
    __channelPriority__ {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {CHANNEL_FLAGS}
     */
    __channelFlags__ {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {CHANNEL_ACCESS_ENUM}
     */
    __channelAccessEnum__ {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {RDPENCOMAPI_ATTENDEE_FLAGS}
     */
    __rdpencomapiAttendeeFlags__ {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {RDPSRAPI_WND_FLAGS}
     */
    __rdpsrapiWndFlags__ {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {RDPSRAPI_APP_FLAGS}
     */
    __rdpsrapiAppFlags__ {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
