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

    class PAINT_UNION extends Win32Struct {
        static sizeof => 240
        static packingSize => 8

        class PAINT_LAYERS extends Win32Struct {
            static sizeof => 232
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            childCount {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class PAINT_SOLID_GLYPH extends Win32Struct {
            static sizeof => 232
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            glyphIndex {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {DWRITE_PAINT_COLOR}
             */
            color{
                get {
                    if(!this.HasProp("__color"))
                        this.__color := DWRITE_PAINT_COLOR(8, this)
                    return this.__color
                }
            }
        
        }
    
        class PAINT_LINEAR_GRADIENT extends Win32Struct {
            static sizeof => 232
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            extendMode {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            gradientStopCount {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Float}
             */
            x0 {
                get => NumGet(this, 8, "float")
                set => NumPut("float", value, this, 8)
            }
        
            /**
             * @type {Float}
             */
            y0 {
                get => NumGet(this, 12, "float")
                set => NumPut("float", value, this, 12)
            }
        
            /**
             * @type {Float}
             */
            x1 {
                get => NumGet(this, 16, "float")
                set => NumPut("float", value, this, 16)
            }
        
            /**
             * @type {Float}
             */
            y1 {
                get => NumGet(this, 20, "float")
                set => NumPut("float", value, this, 20)
            }
        
            /**
             * @type {Float}
             */
            x2 {
                get => NumGet(this, 24, "float")
                set => NumPut("float", value, this, 24)
            }
        
            /**
             * @type {Float}
             */
            y2 {
                get => NumGet(this, 28, "float")
                set => NumPut("float", value, this, 28)
            }
        
        }
    
        class PAINT_RADIAL_GRADIENT extends Win32Struct {
            static sizeof => 232
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            extendMode {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            gradientStopCount {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Float}
             */
            x0 {
                get => NumGet(this, 8, "float")
                set => NumPut("float", value, this, 8)
            }
        
            /**
             * @type {Float}
             */
            y0 {
                get => NumGet(this, 12, "float")
                set => NumPut("float", value, this, 12)
            }
        
            /**
             * @type {Float}
             */
            radius0 {
                get => NumGet(this, 16, "float")
                set => NumPut("float", value, this, 16)
            }
        
            /**
             * @type {Float}
             */
            x1 {
                get => NumGet(this, 20, "float")
                set => NumPut("float", value, this, 20)
            }
        
            /**
             * @type {Float}
             */
            y1 {
                get => NumGet(this, 24, "float")
                set => NumPut("float", value, this, 24)
            }
        
            /**
             * @type {Float}
             */
            radius1 {
                get => NumGet(this, 28, "float")
                set => NumPut("float", value, this, 28)
            }
        
        }
    
        class PAINT_SWEEP_GRADIENT extends Win32Struct {
            static sizeof => 232
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            extendMode {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            gradientStopCount {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Float}
             */
            centerX {
                get => NumGet(this, 8, "float")
                set => NumPut("float", value, this, 8)
            }
        
            /**
             * @type {Float}
             */
            centerY {
                get => NumGet(this, 12, "float")
                set => NumPut("float", value, this, 12)
            }
        
            /**
             * @type {Float}
             */
            startAngle {
                get => NumGet(this, 16, "float")
                set => NumPut("float", value, this, 16)
            }
        
            /**
             * @type {Float}
             */
            endAngle {
                get => NumGet(this, 20, "float")
                set => NumPut("float", value, this, 20)
            }
        
        }
    
        class PAINT_GLYPH extends Win32Struct {
            static sizeof => 232
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            glyphIndex {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class PAINT_COLOR_GLYPH extends Win32Struct {
            static sizeof => 232
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            glyphIndex {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {D2D_RECT_F}
             */
            clipBox{
                get {
                    if(!this.HasProp("__clipBox"))
                        this.__clipBox := D2D_RECT_F(8, this)
                    return this.__clipBox
                }
            }
        
        }
    
        class PAINT_COMPOSITE extends Win32Struct {
            static sizeof => 232
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            mode {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }
        
        }
    
        /**
         * @type {PAINT_LAYERS}
         */
        layers{
            get {
                if(!this.HasProp("__layers"))
                    this.__layers := %this.__Class%.PAINT_LAYERS(0, this)
                return this.__layers
            }
        }
    
        /**
         * @type {PAINT_SOLID_GLYPH}
         */
        solidGlyph{
            get {
                if(!this.HasProp("__solidGlyph"))
                    this.__solidGlyph := %this.__Class%.PAINT_SOLID_GLYPH(0, this)
                return this.__solidGlyph
            }
        }
    
        /**
         * @type {DWRITE_PAINT_COLOR}
         */
        solid{
            get {
                if(!this.HasProp("__solid"))
                    this.__solid := DWRITE_PAINT_COLOR(0, this)
                return this.__solid
            }
        }
    
        /**
         * @type {PAINT_LINEAR_GRADIENT}
         */
        linearGradient{
            get {
                if(!this.HasProp("__linearGradient"))
                    this.__linearGradient := %this.__Class%.PAINT_LINEAR_GRADIENT(0, this)
                return this.__linearGradient
            }
        }
    
        /**
         * @type {PAINT_RADIAL_GRADIENT}
         */
        radialGradient{
            get {
                if(!this.HasProp("__radialGradient"))
                    this.__radialGradient := %this.__Class%.PAINT_RADIAL_GRADIENT(0, this)
                return this.__radialGradient
            }
        }
    
        /**
         * @type {PAINT_SWEEP_GRADIENT}
         */
        sweepGradient{
            get {
                if(!this.HasProp("__sweepGradient"))
                    this.__sweepGradient := %this.__Class%.PAINT_SWEEP_GRADIENT(0, this)
                return this.__sweepGradient
            }
        }
    
        /**
         * @type {PAINT_GLYPH}
         */
        glyph{
            get {
                if(!this.HasProp("__glyph"))
                    this.__glyph := %this.__Class%.PAINT_GLYPH(0, this)
                return this.__glyph
            }
        }
    
        /**
         * @type {PAINT_COLOR_GLYPH}
         */
        colorGlyph{
            get {
                if(!this.HasProp("__colorGlyph"))
                    this.__colorGlyph := %this.__Class%.PAINT_COLOR_GLYPH(0, this)
                return this.__colorGlyph
            }
        }
    
        /**
         * @type {DWRITE_MATRIX}
         */
        transform{
            get {
                if(!this.HasProp("__transform"))
                    this.__transform := DWRITE_MATRIX(0, this)
                return this.__transform
            }
        }
    
        /**
         * @type {PAINT_COMPOSITE}
         */
        composite{
            get {
                if(!this.HasProp("__composite"))
                    this.__composite := %this.__Class%.PAINT_COMPOSITE(0, this)
                return this.__composite
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    paintType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PAINT_UNION}
     */
    paint{
        get {
            if(!this.HasProp("__paint"))
                this.__paint := %this.__Class%.PAINT_UNION(8, this)
            return this.__paint
        }
    }
}
