#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteRenderingParams2.ahk

/**
 * Represents text rendering settings for glyph rasterization and filtering.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwriterenderingparams3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteRenderingParams3 extends IDWriteRenderingParams2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteRenderingParams3
     * @type {Guid}
     */
    static IID => Guid("{b7924baa-391b-412a-8c5c-e44cc2d867dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRenderingMode1"]

    /**
     * Gets the rendering mode.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a></b>
     * 
     * Returns a <a href="/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a>-typed value for the rendering mode.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriterenderingparams3-getrenderingmode1
     */
    GetRenderingMode1() {
        result := ComCall(10, this, "int")
        return result
    }
}
