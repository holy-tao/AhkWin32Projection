#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The ENHMETAHEADER structure contains enhanced-metafile data such as the dimensions of the picture stored in the enhanced metafile, the count of records in the enhanced metafile, the resolution of the device on which the picture was created, and so on.This structure is always the first record in an enhanced metafile.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enhmetaheader
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ENHMETAHEADER extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The record type. This member must specify the value assigned to the EMR_HEADER constant.
     * @type {Integer}
     */
    iType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The structure size, in bytes.
     * @type {Integer}
     */
    nSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The dimensions, in device units, of the smallest rectangle that can be drawn around the picture stored in the metafile. 
     * 			 This rectangle is supplied by graphics device interface (GDI). Its dimensions include the right and bottom edges.
     * @type {RECTL}
     */
    rclBounds{
        get {
            if(!this.HasProp("__rclBounds"))
                this.__rclBounds := RECTL(this.ptr + 8)
            return this.__rclBounds
        }
    }

    /**
     * The dimensions, in .01 millimeter units, of a rectangle that surrounds the picture stored in the metafile. 
     * 			 This rectangle must be supplied by the application that creates the metafile. Its dimensions include the right and bottom edges.
     * @type {RECTL}
     */
    rclFrame{
        get {
            if(!this.HasProp("__rclFrame"))
                this.__rclFrame := RECTL(this.ptr + 24)
            return this.__rclFrame
        }
    }

    /**
     * A signature. This member must specify the value assigned to the ENHMETA_SIGNATURE constant.
     * @type {Integer}
     */
    dSignature {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The metafile version. The current version value is 0x10000.
     * @type {Integer}
     */
    nVersion {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The size of the enhanced metafile, in bytes.
     * @type {Integer}
     */
    nBytes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of records in the enhanced metafile.
     * @type {Integer}
     */
    nRecords {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The number of handles in the enhanced-metafile handle table. (Index zero in this table is reserved.)
     * @type {Integer}
     */
    nHandles {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    sReserved {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * The number of characters in the array that contains the description of the enhanced metafile's contents. 
     * 			 This member should be set to zero if the enhanced metafile does not contain a description string.
     * @type {Integer}
     */
    nDescription {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The offset from the beginning of the <b>ENHMETAHEADER</b> structure to the array that contains the description of the enhanced metafile's contents. 
     * 			 This member should be set to zero if the enhanced metafile does not contain a description string.
     * @type {Integer}
     */
    offDescription {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of entries in the enhanced metafile's palette.
     * @type {Integer}
     */
    nPalEntries {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The resolution of the reference device, in pixels.
     * @type {SIZE}
     */
    szlDevice{
        get {
            if(!this.HasProp("__szlDevice"))
                this.__szlDevice := SIZE(this.ptr + 72)
            return this.__szlDevice
        }
    }

    /**
     * The resolution of the reference device, in millimeters.
     * @type {SIZE}
     */
    szlMillimeters{
        get {
            if(!this.HasProp("__szlMillimeters"))
                this.__szlMillimeters := SIZE(this.ptr + 80)
            return this.__szlMillimeters
        }
    }

    /**
     * The size of the last recorded pixel format in a metafile. 
     * 	 If a pixel format is set in a reference DC at the start of recording, <i>cbPixelFormat</i> is set to the size of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a>. 
     * 	 When no pixel format is set when a metafile is recorded, this member is set to zero. 
     * 	 If more than a single pixel format is set, the header points to the last pixel format.
     * @type {Integer}
     */
    cbPixelFormat {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The offset of pixel format used when recording a metafile. 
     * 	 If a pixel format is set in a reference DC at the start of recording or during recording, 
     * 	 <i>offPixelFormat</i> is set to the offset of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pixelformatdescriptor">PIXELFORMATDESCRIPTOR</a> in the metafile. 
     * 	 If no pixel format is set when a metafile is recorded, this member is set to zero. 
     * 	 If more than a single pixel format is set, the header points to the last pixel format.
     * @type {Integer}
     */
    offPixelFormat {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Indicates whether any OpenGL records are present in a metafile. 
     * 	 <i>bOpenGL</i> is a simple Boolean flag that you can use to determine whether an enhanced metafile requires OpenGL handling. 
     * 	 When a metafile contains OpenGL records, <i>bOpenGL</i> is <b>TRUE</b>; otherwise it is <b>FALSE</b>.
     * @type {Integer}
     */
    bOpenGL {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The size of the reference device, in micrometers.
     * @type {SIZE}
     */
    szlMicrometers{
        get {
            if(!this.HasProp("__szlMicrometers"))
                this.__szlMicrometers := SIZE(this.ptr + 104)
            return this.__szlMicrometers
        }
    }
}
