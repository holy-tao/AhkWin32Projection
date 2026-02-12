#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DrvQueryGlyphAttrs function returns information about a font's glyphs.
 * @remarks
 * The <b>DrvQueryGlyphAttrs</b> function should be supplied by font drivers. Currently, the only attribute flag defined is FO_ATTR_MODE_ROTATE, meaning the function should indicate which glyphs of a vertical font must be rotated. (For vertical fonts, DBCS glyphs must be rotated.) This information is useful to printer drivers that support printers having built-in font rasterizers.
 * 
 * The function should return rotation information in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_glyphattr">FD_GLYPHATTR</a> structure that is used as the function's return value.
 * 
 * GDI calls the appropriate font driver's <b>DrvQueryGlyphAttrs</b> function when a printer driver calls GDI's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-fontobj_pqueryglyphattrs">FONTOBJ_pQueryGlyphAttrs</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winddi/nc-winddi-pfn_drvqueryglyphattrs
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PFN_DrvQueryGlyphAttrs extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<FONTOBJ>} param0 
     * @param {Integer} param1 
     * @returns {Pointer<FD_GLYPHATTR>} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1) {
        result := ComCall(3, this, "ptr", param0, "uint", param1, "ptr")
        return result
    }
}
