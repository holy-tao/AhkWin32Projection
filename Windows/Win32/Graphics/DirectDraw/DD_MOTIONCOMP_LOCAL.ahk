#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DD_MOTIONCOMP_LOCAL structure contains local data for each individual Microsoft DirectDraw motion compensation object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_motioncomp_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_MOTIONCOMP_LOCAL {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Specifies a GUID that describes the motion compensation process being used.
     */
    guid : Guid

    /**
     * Indicates the width in pixels of the uncompressed output frame.
     */
    dwUncompWidth : UInt32

    /**
     * Indicates the height in pixels of the uncompressed output frame.
     */
    dwUncompHeight : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the pixel format of the uncompressed output frame.
     */
    ddUncompPixelFormat : DDPIXELFORMAT

    dwDriverReserved1 : UInt32

    dwDriverReserved2 : UInt32

    /**
     * Are reserved for use by the display driver.
     */
    dwDriverReserved3 : UInt32

    lpDriverReserved1 : IntPtr

    lpDriverReserved2 : IntPtr

    /**
     * Are reserved for use by the display driver.
     */
    lpDriverReserved3 : IntPtr

}
