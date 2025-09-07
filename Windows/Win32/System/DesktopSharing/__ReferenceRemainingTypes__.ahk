#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class __ReferenceRemainingTypes__ extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    __ctrlLevel__ {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    __attendeeDisconnectReason__ {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    __channelPriority__ {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    __channelFlags__ {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    __channelAccessEnum__ {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    __rdpencomapiAttendeeFlags__ {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    __rdpsrapiWndFlags__ {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    __rdpsrapiAppFlags__ {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
