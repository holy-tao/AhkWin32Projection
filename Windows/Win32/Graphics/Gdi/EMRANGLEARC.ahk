#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRANGLEARC structure contains members for the AngleArc enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emranglearc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRANGLEARC {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Logical coordinates of a circle's center.
     */
    ptlCenter : POINTL

    /**
     * A circle's radius, in logical units.
     */
    nRadius : UInt32

    /**
     * An arc's start angle, in degrees.
     */
    eStartAngle : Float32

    /**
     * An arc's sweep angle, in degrees.
     */
    eSweepAngle : Float32

}
