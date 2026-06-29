#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_SCANLINE_ORDERING.ahk" { DISPLAYCONFIG_SCANLINE_ORDERING }
#Import ".\DISPLAYCONFIG_2DREGION.ahk" { DISPLAYCONFIG_2DREGION }
#Import ".\DISPLAYCONFIG_VIDEO_SIGNAL_INFO.ahk" { DISPLAYCONFIG_VIDEO_SIGNAL_INFO }
#Import ".\DISPLAYCONFIG_RATIONAL.ahk" { DISPLAYCONFIG_RATIONAL }

/**
 * The DISPLAYCONFIG_TARGET_MODE structure describes a display path target mode.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_target_mode
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_TARGET_MODE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_video_signal_info">DISPLAYCONFIG_VIDEO_SIGNAL_INFO</a> structure that contains a detailed description of the current target mode.
     */
    targetVideoSignalInfo : DISPLAYCONFIG_VIDEO_SIGNAL_INFO

}
