#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_TARGET_MODE.ahk" { DISPLAYCONFIG_TARGET_MODE }
#Import ".\DISPLAYCONFIG_VIDEO_SIGNAL_INFO.ahk" { DISPLAYCONFIG_VIDEO_SIGNAL_INFO }
#Import ".\DISPLAYCONFIG_2DREGION.ahk" { DISPLAYCONFIG_2DREGION }
#Import ".\DISPLAYCONFIG_SCANLINE_ORDERING.ahk" { DISPLAYCONFIG_SCANLINE_ORDERING }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import ".\DISPLAYCONFIG_RATIONAL.ahk" { DISPLAYCONFIG_RATIONAL }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }

/**
 * The DISPLAYCONFIG_TARGET_PREFERRED_MODE structure contains information about the preferred mode of a display.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_target_preferred_mode
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_TARGET_PREFERRED_MODE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information about the request for the target preferred mode. The caller should set the <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_PREFERRED_MODE and the <b>adapterId</b> and <b>id</b> members of DISPLAYCONFIG_DEVICE_INFO_HEADER to the target for which the caller wants the preferred mode. The caller should set the <b>size</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to at least the size of the DISPLAYCONFIG_TARGET_PREFERRED_MODE structure.
     */
    header : DISPLAYCONFIG_DEVICE_INFO_HEADER

    /**
     * The width in pixels of the best mode for the monitor that is connected to the target that the <b>targetMode</b> member specifies.
     */
    width : UInt32

    /**
     * The height in pixels of the best mode for the monitor that is connected to the target that the <b>targetMode</b> member specifies.
     */
    height : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_mode">DISPLAYCONFIG_TARGET_MODE</a> structure that describes the best target mode for the monitor that is connected to the specified target.
     */
    targetMode : DISPLAYCONFIG_TARGET_MODE

}
