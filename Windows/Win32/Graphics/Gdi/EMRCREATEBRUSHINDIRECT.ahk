#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\BRUSH_STYLE.ahk" { BRUSH_STYLE }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\LOGBRUSH32.ahk" { LOGBRUSH32 }

/**
 * The EMRCREATEBRUSHINDIRECT structure contains members for the CreateBrushIndirect enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatebrushindirect
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRCREATEBRUSHINDIRECT {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Index of brush in handle table.
     */
    ihBrush : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush32">LOGBRUSH32</a> structure containing information about the brush. The <b>lbStyle</b> member must be either the BS_SOLID, BS_HOLLOW, BS_NULL, or BS_HATCHED value.
     * 
     * Note, that if your code is used on both 32-bit and 64-bit platforms, you must use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush32">LOGBRUSH32</a> structure. This maintains compatibility between the platforms when you record the metafile on one platform and use it on the other platform. If your code remains on one platform, it is sufficient to use <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush">LOGBRUSH</a>.
     */
    lb : LOGBRUSH32

}
