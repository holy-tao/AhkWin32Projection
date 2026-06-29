#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AM_COLCON.ahk" { AM_COLCON }

/**
 * Describes the currently selected button from the DVD highlight information.
 * @remarks
 * The <b>AM_PROPERTY_DVDSUBPIC_HLI</b> property uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_property_sphli
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_PROPERTY_SPHLI {
    #StructPack 4

    /**
     * Highlight status of current selection.
     */
    HLISS : UInt16

    /**
     * Reserved for internal use. Do not use or set.
     */
    Reserved : UInt16

    /**
     * Start presentation time divided by 90,000.
     */
    StartPTM : UInt32

    /**
     * End presentation time divided by 90,000.
     */
    EndPTM : UInt32

    /**
     * Start x-coordinate pixel of the current highlight button.
     */
    StartX : UInt16

    /**
     * Start y-coordinate pixel of the current highlight button.
     */
    StartY : UInt16

    /**
     * Ending x-coordinate pixel of the current highlight button.
     */
    StopX : UInt16

    /**
     * Ending y-coordinate pixel of the current highlight button.
     */
    StopY : UInt16

    /**
     * Color contrast description of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_colcon">AM_COLCON</a>.
     */
    ColCon : AM_COLCON

}
