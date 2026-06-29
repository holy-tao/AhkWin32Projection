#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The ENHMETAHEADER structure contains enhanced-metafile data such as the dimensions of the picture stored in the enhanced metafile, the count of records in the enhanced metafile, the resolution of the device on which the picture was created, and so on.This structure is always the first record in an enhanced metafile.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enhmetaheader
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ENHMETAHEADER {
    #StructPack 4

    /**
     * The record type. This member must specify the value assigned to the EMR_HEADER constant.
     */
    iType : UInt32

    /**
     * The structure size, in bytes.
     */
    nSize : UInt32

    /**
     * The dimensions, in device units, of the smallest rectangle that can be drawn around the picture stored in the metafile. 
     * 			 This rectangle is supplied by graphics device interface (GDI). Its dimensions include the right and bottom edges.
     */
    rclBounds : RECTL

    /**
     * The dimensions, in .01 millimeter units, of a rectangle that surrounds the picture stored in the metafile. 
     * 			 This rectangle must be supplied by the application that creates the metafile. Its dimensions include the right and bottom edges.
     */
    rclFrame : RECTL

    /**
     * A signature. This member must specify the value assigned to the ENHMETA_SIGNATURE constant.
     */
    dSignature : UInt32

    /**
     * The metafile version. The current version value is 0x10000.
     */
    nVersion : UInt32

    /**
     * The size of the enhanced metafile, in bytes.
     */
    nBytes : UInt32

    /**
     * The number of records in the enhanced metafile.
     */
    nRecords : UInt32

    /**
     * The number of handles in the enhanced-metafile handle table. (Index zero in this table is reserved.)
     */
    nHandles : UInt16

    /**
     * Reserved; must be zero.
     */
    sReserved : UInt16

    /**
     * The number of characters in the array that contains the description of the enhanced metafile's contents. 
     * 			 This member should be set to zero if the enhanced metafile does not contain a description string.
     */
    nDescription : UInt32

    /**
     * The offset from the beginning of the <b>ENHMETAHEADER</b> structure to the array that contains the description of the enhanced metafile's contents. 
     * 			 This member should be set to zero if the enhanced metafile does not contain a description string.
     */
    offDescription : UInt32

    /**
     * The number of entries in the enhanced metafile's palette.
     */
    nPalEntries : UInt32

    /**
     * The resolution of the reference device, in pixels.
     */
    szlDevice : SIZE

    /**
     * The resolution of the reference device, in millimeters.
     */
    szlMillimeters : SIZE

    /**
     * The size of the last recorded pixel format in a metafile. 
     * 	 If a pixel format is set in a reference DC at the start of recording, <i>cbPixelFormat</i> is set to the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a>. 
     * 	 When no pixel format is set when a metafile is recorded, this member is set to zero. 
     * 	 If more than a single pixel format is set, the header points to the last pixel format.
     */
    cbPixelFormat : UInt32

    /**
     * The offset of pixel format used when recording a metafile. 
     * 	 If a pixel format is set in a reference DC at the start of recording or during recording, 
     * 	 <i>offPixelFormat</i> is set to the offset of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> in the metafile. 
     * 	 If no pixel format is set when a metafile is recorded, this member is set to zero. 
     * 	 If more than a single pixel format is set, the header points to the last pixel format.
     */
    offPixelFormat : UInt32

    /**
     * Indicates whether any OpenGL records are present in a metafile. 
     * 	 <i>bOpenGL</i> is a simple Boolean flag that you can use to determine whether an enhanced metafile requires OpenGL handling. 
     * 	 When a metafile contains OpenGL records, <i>bOpenGL</i> is <b>TRUE</b>; otherwise it is <b>FALSE</b>.
     */
    bOpenGL : UInt32

    /**
     * The size of the reference device, in micrometers.
     */
    szlMicrometers : SIZE

}
