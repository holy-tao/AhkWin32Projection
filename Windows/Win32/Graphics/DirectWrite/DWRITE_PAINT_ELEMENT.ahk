#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DWRITE_COLOR_F.ahk
#Include .\DWRITE_PAINT_COLOR.ahk
#Include ..\Direct2D\Common\D2D_RECT_F.ahk
#Include .\DWRITE_MATRIX.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PAINT_ELEMENT extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * @type {Integer}
     */
    paintType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    layers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    glyphIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DWRITE_PAINT_COLOR}
     */
    color{
        get {
            if(!this.HasProp("__color"))
                this.__color := DWRITE_PAINT_COLOR(this.ptr + 16)
            return this.__color
        }
    }

    /**
     * @type {DWRITE_PAINT_COLOR}
     */
    solid{
        get {
            if(!this.HasProp("__solid"))
                this.__solid := DWRITE_PAINT_COLOR(this.ptr + 8)
            return this.__solid
        }
    }

    /**
     * @type {Integer}
     */
    extendMode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    gradientStopCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Float}
     */
    x0 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    y0 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    x1 {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Float}
     */
    y1 {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * @type {Float}
     */
    x2 {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {Float}
     */
    y2 {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Float}
     */
    radius0 {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Float}
     */
    x11 {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * @type {Float}
     */
    y11 {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {Float}
     */
    radius1 {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Float}
     */
    centerX {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    centerY {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    startAngle {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Float}
     */
    endAngle {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    glyph {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D2D_RECT_F}
     */
    clipBox{
        get {
            if(!this.HasProp("__clipBox"))
                this.__clipBox := D2D_RECT_F(this.ptr + 16)
            return this.__clipBox
        }
    }

    /**
     * @type {DWRITE_MATRIX}
     */
    transform{
        get {
            if(!this.HasProp("__transform"))
                this.__transform := DWRITE_MATRIX(this.ptr + 8)
            return this.__transform
        }
    }

    /**
     * @type {Integer}
     */
    mode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
