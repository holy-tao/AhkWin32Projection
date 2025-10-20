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
     * 
     * @param {Pointer<ID2D1RenderInfo>} renderInfo 
     * @returns {HRESULT} 
     */
    SetRenderInfo(renderInfo) {
        result := ComCall(7, this, "ptr", renderInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Bitmap1>} target 
     * @param {Pointer<RECT>} drawRect 
     * @param {D2D_POINT_2U} targetOrigin 
     * @returns {HRESULT} 
     */
    Draw(target, drawRect, targetOrigin) {
        result := ComCall(8, this, "ptr", target, "ptr", drawRect, "ptr", targetOrigin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
