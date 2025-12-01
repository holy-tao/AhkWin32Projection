#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DISPLAYCONFIG_RATIONAL.ahk
#Include .\DISPLAYCONFIG_2DREGION.ahk
#Include .\DISPLAYCONFIG_VIDEO_SIGNAL_INFO.ahk

/**
 * The DISPLAYCONFIG_TARGET_MODE structure describes a display path target mode.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_target_mode
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_TARGET_MODE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_video_signal_info">DISPLAYCONFIG_VIDEO_SIGNAL_INFO</a> structure that contains a detailed description of the current target mode.
     * @type {DISPLAYCONFIG_VIDEO_SIGNAL_INFO}
     */
    targetVideoSignalInfo{
        get {
            if(!this.HasProp("__targetVideoSignalInfo"))
                this.__targetVideoSignalInfo := DISPLAYCONFIG_VIDEO_SIGNAL_INFO(0, this)
            return this.__targetVideoSignalInfo
        }
    }
}
