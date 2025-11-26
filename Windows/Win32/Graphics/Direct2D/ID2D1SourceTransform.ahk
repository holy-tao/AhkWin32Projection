#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Transform.ahk

/**
 * Represents a CPU-based rasterization stage in the transform pipeline graph.
 * @remarks
 * 
 * <b>ID2D1SourceTransform</b> specializes an implementation of the Shantzis calculations to a transform implemented as the source of an effect graph with the data being provided from sytem memory.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1sourcetransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SourceTransform extends ID2D1Transform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1SourceTransform
     * @type {Guid}
     */
    static IID => Guid("{db1800dd-0c34-4cf9-be90-31cc0a5653e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRenderInfo", "Draw"]

    /**
     * Sets the render information for the transform.
     * @param {ID2D1RenderInfo} renderInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1renderinfo">ID2D1RenderInfo</a>*</b>
     * 
     * The interface supplied to the transform to allow specifying the CPU based transform pass.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1sourcetransform-setrenderinfo
     */
    SetRenderInfo(renderInfo) {
        result := ComCall(7, this, "ptr", renderInfo, "HRESULT")
        return result
    }

    /**
     * Draws the transform to the graphics processing unit (GPU)–based Direct2D pipeline.
     * @param {ID2D1Bitmap1} target Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1bitmap1">ID2D1Bitmap1</a>*</b>
     * 
     * The target to which the transform should be written.
     * @param {Pointer<RECT>} drawRect Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The area within the source from which the image should be drawn.
     * @param {D2D_POINT_2U} targetOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2u">D2D1_POINT_2U</a></b>
     * 
     * The origin within the target bitmap to which the source data should be drawn.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1sourcetransform-draw
     */
    Draw(target, drawRect, targetOrigin) {
        result := ComCall(8, this, "ptr", target, "ptr", drawRect, "ptr", targetOrigin, "HRESULT")
        return result
    }
}
