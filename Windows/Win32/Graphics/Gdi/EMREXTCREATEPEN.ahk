#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\EXTLOGPEN32.ahk" { EXTLOGPEN32 }

/**
 * The EMREXTCREATEPEN structure contains members for the ExtCreatePen enhanced metafile record. If the record contains a BITMAPINFO structure, it is followed by the bitmap bits that form a packed device-independent bitmap (DIB).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrextcreatepen
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMREXTCREATEPEN {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Index to pen in handle table.
     */
    ihPen : UInt32

    /**
     * Offset to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure, if any.
     */
    offBmi : UInt32

    /**
     * Size of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure, if any.
     */
    cbBmi : UInt32

    /**
     * Offset to brush bitmap bits, if any.
     */
    offBits : UInt32

    /**
     * Size of brush bitmap bits, if any.
     */
    cbBits : UInt32

    /**
     * Extended logical pen, including the <b>elpStyleEntry</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-extlogpen">EXTLOGPEN</a> structure.
     */
    elp : EXTLOGPEN32

}
