#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FD_GLYPHATTR.ahk" { FD_GLYPHATTR }
#Import ".\FONTOBJ.ahk" { FONTOBJ }

/**
 * The DrvQueryGlyphAttrs function returns information about a font's glyphs.
 * @remarks
 * The <b>DrvQueryGlyphAttrs</b> function should be supplied by font drivers. Currently, the only attribute flag defined is FO_ATTR_MODE_ROTATE, meaning the function should indicate which glyphs of a vertical font must be rotated. (For vertical fonts, DBCS glyphs must be rotated.) This information is useful to printer drivers that support printers having built-in font rasterizers.
 * 
 * The function should return rotation information in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_glyphattr">FD_GLYPHATTR</a> structure that is used as the function's return value.
 * 
 * GDI calls the appropriate font driver's <b>DrvQueryGlyphAttrs</b> function when a printer driver calls GDI's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-fontobj_pqueryglyphattrs">FONTOBJ_pQueryGlyphAttrs</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nc-winddi-pfn_drvqueryglyphattrs
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryGlyphAttrs {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryGlyphAttrs) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FONTOBJ>} param0 
     * @param {Integer} param1 
     * @returns {Pointer<FD_GLYPHATTR>} <b>DrvQueryGlyphAttrs</b> should return a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_glyphattr">FD_GLYPHATTR</a> structure. If an error is encountered, such as an invalid input argument, or if the font described by the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure is not a vertical font, the function should return <b>NULL</b>.
     */
    Call(param0, param1) {
        result := DllCall(this.value, FONTOBJ.Ptr, param0, UInt32, param1, FD_GLYPHATTR.Ptr)
        return result
    }

    /**
     * A PFN_DrvQueryGlyphAttrs that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryGlyphAttrs {
        /**
         * Creates a PFN_DrvQueryGlyphAttrs pointer that invokes the given AHK function when called.
         * @param {Func(FONTOBJ, UInt32) => FD_GLYPHATTR.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FONTOBJ.Ptr, UInt32, FD_GLYPHATTR.Ptr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
