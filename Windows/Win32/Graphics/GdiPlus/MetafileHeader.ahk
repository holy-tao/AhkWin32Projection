#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Gdi\METAHEADER.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\ENHMETAHEADER3.ahk

/**
 * A MetafileHeader object stores properties of an associated metafile.
 * @remarks
 * 
  * Metafiles provide a device-independent and application-independent way to share pictures. They contain records that describe a sequence of graphics APIs to invoke in a particular order with their associated graphics data. Metafiles can be recorded by an application and later played back by that application or by another one to reproduce a particular picture. They can also be used to send content to a print spooler. Enhanced metafiles support the ability to provide both Windows GDI+ and Windows Graphics Device Interface (GDI) descriptions of the same picture so that both GDI+ and down-level GDI applications can render it.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusmetaheader/nl-gdiplusmetaheader-metafileheader
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class MetafileHeader extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    EmfPlusFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Float}
     */
    DpiX {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    DpiY {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    X {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {METAHEADER}
     */
    WmfHeader{
        get {
            if(!this.HasProp("__WmfHeader"))
                this.__WmfHeader := METAHEADER(40, this)
            return this.__WmfHeader
        }
    }

    /**
     * @type {ENHMETAHEADER3}
     */
    EmfHeader{
        get {
            if(!this.HasProp("__EmfHeader"))
                this.__EmfHeader := ENHMETAHEADER3(40, this)
            return this.__EmfHeader
        }
    }

    /**
     * @type {Integer}
     */
    EmfPlusHeaderSize {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    LogicalDpiX {
        get => NumGet(this, 132, "int")
        set => NumPut("int", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    LogicalDpiY {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }
}
