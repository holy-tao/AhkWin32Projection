#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_TARGET_MODE.ahk" { DISPLAYCONFIG_TARGET_MODE }
#Import ".\DISPLAYCONFIG_VIDEO_SIGNAL_INFO.ahk" { DISPLAYCONFIG_VIDEO_SIGNAL_INFO }
#Import ".\DISPLAYCONFIG_2DREGION.ahk" { DISPLAYCONFIG_2DREGION }
#Import ".\DISPLAYCONFIG_SCANLINE_ORDERING.ahk" { DISPLAYCONFIG_SCANLINE_ORDERING }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import ".\DISPLAYCONFIG_MODE_INFO_TYPE.ahk" { DISPLAYCONFIG_MODE_INFO_TYPE }
#Import ".\DISPLAYCONFIG_PIXELFORMAT.ahk" { DISPLAYCONFIG_PIXELFORMAT }
#Import ".\DISPLAYCONFIG_DESKTOP_IMAGE_INFO.ahk" { DISPLAYCONFIG_DESKTOP_IMAGE_INFO }
#Import ".\DISPLAYCONFIG_RATIONAL.ahk" { DISPLAYCONFIG_RATIONAL }
#Import ".\DISPLAYCONFIG_SOURCE_MODE.ahk" { DISPLAYCONFIG_SOURCE_MODE }

/**
 * The DISPLAYCONFIG_MODE_INFO structure contains either source mode or target mode information.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_mode_info
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_MODE_INFO {
    #StructPack 8

    /**
     * A value that indicates whether the <b>DISPLAYCONFIG_MODE_INFO</b> structure represents source or target mode information. If <b>infoType</b> is DISPLAYCONFIG_MODE_INFO_TYPE_TARGET, the <i>targetMode</i> parameter value contains a valid DISPLAYCONFIG_TARGET_MODE structure describing the specified target. If <b>infoType</b> is DISPLAYCONFIG_MODE_INFO_TYPE_SOURCE, the <i>sourceMode</i> parameter value contains a valid DISPLAYCONFIG_SOURCE_MODE structure describing the specified source.
     */
    infoType : DISPLAYCONFIG_MODE_INFO_TYPE

    /**
     * The source or target identifier on the specified adapter that this path relates to.
     */
    id : UInt32

    /**
     * The identifier of the adapter that this source or target mode information relates to.
     */
    adapterId : LUID

    targetMode : DISPLAYCONFIG_TARGET_MODE

    static __New() {
        DefineProp(this.Prototype, 'sourceMode', { type: DISPLAYCONFIG_SOURCE_MODE, offset: 16 })
        DefineProp(this.Prototype, 'desktopImageInfo', { type: DISPLAYCONFIG_DESKTOP_IMAGE_INFO, offset: 16 })
        this.DeleteProp("__New")
    }
}
