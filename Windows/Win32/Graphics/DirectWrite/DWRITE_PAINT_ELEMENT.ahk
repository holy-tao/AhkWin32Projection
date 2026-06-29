#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_MATRIX.ahk" { DWRITE_MATRIX }
#Import ".\DWRITE_COLOR_COMPOSITE_MODE.ahk" { DWRITE_COLOR_COMPOSITE_MODE }
#Import ".\DWRITE_COLOR_F.ahk" { DWRITE_COLOR_F }
#Import ".\DWRITE_PAINT_COLOR.ahk" { DWRITE_PAINT_COLOR }
#Import "..\Direct2D\Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import ".\DWRITE_PAINT_TYPE.ahk" { DWRITE_PAINT_TYPE }
#Import ".\DWRITE_PAINT_ATTRIBUTES.ahk" { DWRITE_PAINT_ATTRIBUTES }

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PAINT_ELEMENT {
    #StructPack 4


    struct PAINT_UNION {

        struct PAINT_LAYERS {
            childCount : UInt32

        }

        struct PAINT_SOLID_GLYPH {
            glyphIndex : UInt32

            color : DWRITE_PAINT_COLOR

        }

        struct PAINT_LINEAR_GRADIENT {
            extendMode : UInt32

            gradientStopCount : UInt32

            x0 : Float32

            y0 : Float32

            x1 : Float32

            y1 : Float32

            x2 : Float32

            y2 : Float32

        }

        struct PAINT_RADIAL_GRADIENT {
            extendMode : UInt32

            gradientStopCount : UInt32

            x0 : Float32

            y0 : Float32

            radius0 : Float32

            x1 : Float32

            y1 : Float32

            radius1 : Float32

        }

        struct PAINT_SWEEP_GRADIENT {
            extendMode : UInt32

            gradientStopCount : UInt32

            centerX : Float32

            centerY : Float32

            startAngle : Float32

            endAngle : Float32

        }

        struct PAINT_GLYPH {
            glyphIndex : UInt32

        }

        struct PAINT_COLOR_GLYPH {
            glyphIndex : UInt32

            clipBox : D2D_RECT_F

        }

        struct PAINT_COMPOSITE {
            mode : DWRITE_COLOR_COMPOSITE_MODE

        }

        layers : DWRITE_PAINT_ELEMENT.PAINT_UNION.PAINT_LAYERS

        static __New() {
            DefineProp(this.Prototype, 'solidGlyph', { type: DWRITE_PAINT_ELEMENT.PAINT_UNION.PAINT_SOLID_GLYPH, offset: 0 })
            DefineProp(this.Prototype, 'solid', { type: DWRITE_PAINT_COLOR, offset: 0 })
            DefineProp(this.Prototype, 'linearGradient', { type: DWRITE_PAINT_ELEMENT.PAINT_UNION.PAINT_LINEAR_GRADIENT, offset: 0 })
            DefineProp(this.Prototype, 'radialGradient', { type: DWRITE_PAINT_ELEMENT.PAINT_UNION.PAINT_RADIAL_GRADIENT, offset: 0 })
            DefineProp(this.Prototype, 'sweepGradient', { type: DWRITE_PAINT_ELEMENT.PAINT_UNION.PAINT_SWEEP_GRADIENT, offset: 0 })
            DefineProp(this.Prototype, 'glyph', { type: DWRITE_PAINT_ELEMENT.PAINT_UNION.PAINT_GLYPH, offset: 0 })
            DefineProp(this.Prototype, 'colorGlyph', { type: DWRITE_PAINT_ELEMENT.PAINT_UNION.PAINT_COLOR_GLYPH, offset: 0 })
            DefineProp(this.Prototype, 'transform', { type: DWRITE_MATRIX, offset: 0 })
            DefineProp(this.Prototype, 'composite', { type: DWRITE_PAINT_ELEMENT.PAINT_UNION.PAINT_COMPOSITE, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    paintType : DWRITE_PAINT_TYPE

    paint : DWRITE_PAINT_ELEMENT.PAINT_UNION

}
