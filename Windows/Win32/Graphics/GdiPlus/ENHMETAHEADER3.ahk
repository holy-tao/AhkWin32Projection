#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The ENHMETAHEADER3 structure contains enhanced-metafile data including the dimensions of the metafile image, the number of records in the metafile, and the resolution of the device on which the metafile was created.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusmetaheader/ns-gdiplusmetaheader-enhmetaheader3
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ENHMETAHEADER3 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Record type. Value is always EMR_HEADER.
     * @type {Integer}
     */
    iType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Structure size, in bytes. This may be greater than the value returned by <b>sizeof</b>(<b>ENHMETAHEADER3</b>).
     * @type {Integer}
     */
    nSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>RECTL</b>
     * 
     * Bounding rectangle, in device units, for the image stored in the metafile.
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
     * Type: <b>RECTL</b>
     * 
     * Rectangle, in 0.01 millimeter units, that surrounds the image stored in the metafile.
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
     * Type: <b>DWORD</b>
     * 
     * Must be ENHMETA_SIGNATURE.
     * @type {Integer}
     */
    dSignature {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Version number of the metafile format. The current version is 0x10000.
     * @type {Integer}
     */
    nVersion {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Size, in bytes, of the metafile.
     * @type {Integer}
     */
    nBytes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Number of records in the metafile.
     * @type {Integer}
     */
    nRecords {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Number of handles in the metafile handle table. Handle index zero is reserved.
     * @type {Integer}
     */
    nHandles {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Reserved. Must be zero.
     * @type {Integer}
     */
    sReserved {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Number of characters in the string that contains the description of the metafile's contents. This member is 0 if the metafile does not have a description string.
     * @type {Integer}
     */
    nDescription {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Offset from the beginning of the <b>ENHMETAHEADER3</b> structure to the string that contains the description of the metafile's contents. This member is 0 if the metafile does not have a description string.
     * @type {Integer}
     */
    offDescription {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Number of entries in the metafile palette.
     * @type {Integer}
     */
    nPalEntries {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>SIZEL</b>
     * 
     * Resolution, in pixels, of the reference device.
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
     * Type: <b>SIZEL</b>
     * 
     * Resolution, in millimeters, of the reference device.
     * @type {SIZE}
     */
    szlMillimeters{
        get {
            if(!this.HasProp("__szlMillimeters"))
                this.__szlMillimeters := SIZE(this.ptr + 80)
            return this.__szlMillimeters
        }
    }
}
