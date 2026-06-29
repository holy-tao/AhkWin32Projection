#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RDPSRAPI_APP_FLAGS.ahk" { RDPSRAPI_APP_FLAGS }
#Import ".\RDPENCOMAPI_ATTENDEE_FLAGS.ahk" { RDPENCOMAPI_ATTENDEE_FLAGS }
#Import ".\CTRL_LEVEL.ahk" { CTRL_LEVEL }
#Import ".\RDPSRAPI_WND_FLAGS.ahk" { RDPSRAPI_WND_FLAGS }
#Import ".\ATTENDEE_DISCONNECT_REASON.ahk" { ATTENDEE_DISCONNECT_REASON }
#Import ".\CHANNEL_FLAGS.ahk" { CHANNEL_FLAGS }
#Import ".\CHANNEL_PRIORITY.ahk" { CHANNEL_PRIORITY }
#Import ".\CHANNEL_ACCESS_ENUM.ahk" { CHANNEL_ACCESS_ENUM }

/**
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct __ReferenceRemainingTypes__ {
    #StructPack 4

    __ctrlLevel__ : CTRL_LEVEL

    __attendeeDisconnectReason__ : ATTENDEE_DISCONNECT_REASON

    __channelPriority__ : CHANNEL_PRIORITY

    __channelFlags__ : CHANNEL_FLAGS

    __channelAccessEnum__ : CHANNEL_ACCESS_ENUM

    __rdpencomapiAttendeeFlags__ : RDPENCOMAPI_ATTENDEE_FLAGS

    __rdpsrapiWndFlags__ : RDPSRAPI_WND_FLAGS

    __rdpsrapiAppFlags__ : RDPSRAPI_APP_FLAGS

}
