#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteRenderingParams1.ahk

/**
 * Represents text rendering settings for glyph rasterization and filtering.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwriterenderingparams2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteRenderingParams2 extends IDWriteRenderingParams1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteRenderingParams2
     * @type {Guid}
     */
    static IID => Guid("{f9d711c3-9777-40ae-87e8-3e5af9bf0948}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGridFitMode"]

    /**
     * Gets the grid fitting mode.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a></b>
     * 
     * Returns a <a href="/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>-typed value for the grid fitting mode.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwriterenderingparams2-getgridfitmode
     */
    GetGridFitMode() {
        result := ComCall(9, this, "int")
        return result
    }
}
