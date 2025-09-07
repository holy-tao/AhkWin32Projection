#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The METAHEADER structure contains information about a Windows-format metafile.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-metaheader
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class METAHEADER extends Win32Struct
{
    static sizeof => 18

    static packingSize => 2

    /**
     * 
     * @type {Integer}
     */
    mtType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The size, in words, of the metafile header.
     * @type {Integer}
     */
    mtHeaderSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The system version number. The version number for metafiles that support device-independent bitmaps (DIBs) is 0x0300. Otherwise, the version number is 0x0100.
     * @type {Integer}
     */
    mtVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The size, in words, of the file.
     * @type {Integer}
     */
    mtSize {
        get => NumGet(this, 6, "uint")
        set => NumPut("uint", value, this, 6)
    }

    /**
     * The maximum number of objects that exist in the metafile at the same time.
     * @type {Integer}
     */
    mtNoObjects {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The size, in words, of the largest record in the metafile.
     * @type {Integer}
     */
    mtMaxRecord {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    mtNoParameters {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
