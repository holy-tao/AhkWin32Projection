#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRTAUDIO_BUFFER_PROPERTY_WITH_NOTIFICATION {
    #StructPack 8

    Property : KSIDENTIFIER

    BaseAddress : IntPtr

    RequestedBufferSize : UInt32

    NotificationCount : UInt32

}
