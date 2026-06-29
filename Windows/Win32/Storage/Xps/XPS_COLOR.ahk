#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XPS_COLOR_TYPE.ahk" { XPS_COLOR_TYPE }

/**
 * The contents of the XPS_COLOR structure when the colorType is XPS_COLOR_TYPE_CONTEXT.
 * @remarks
 * For information about how to interpret or apply the values in this structure's members, see the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_color
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_COLOR {
    #StructPack 4


    struct XPS_COLOR_VALUE {

        struct _sRGB {
            alpha : Int8

            red : Int8

            green : Int8

            blue : Int8

        }

        struct _scRGB {
            alpha : Float32

            red : Float32

            green : Float32

            blue : Float32

        }

        struct _context {
            channelCount : Int8

            channels : Float32[9]

        }

        sRGB : XPS_COLOR.XPS_COLOR_VALUE._sRGB

        static __New() {
            DefineProp(this.Prototype, 'scRGB', { type: XPS_COLOR.XPS_COLOR_VALUE._scRGB, offset: 0 })
            DefineProp(this.Prototype, 'context', { type: XPS_COLOR.XPS_COLOR_VALUE._context, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    colorType : XPS_COLOR_TYPE

    value : XPS_COLOR.XPS_COLOR_VALUE

}
