#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1CommandSink1.ahk

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink1 interface. It also enables access to ink rendering and gradient mesh rendering.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1commandsink2
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1CommandSink2 extends ID2D1CommandSink1{
    /**
     * The interface identifier for ID2D1CommandSink2
     * @type {Guid}
     */
    static IID => Guid("{3bab440e-417e-47df-a2e2-bc0be6a00916}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * 
     * @param {Pointer<ID2D1Ink>} ink 
     * @param {Pointer<ID2D1Brush>} brush 
     * @param {Pointer<ID2D1InkStyle>} inkStyle 
     * @returns {HRESULT} 
     */
    DrawInk(ink, brush, inkStyle) {
        result := ComCall(29, this, "ptr", ink, "ptr", brush, "ptr", inkStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1GradientMesh>} gradientMesh 
     * @returns {HRESULT} 
     */
    DrawGradientMesh(gradientMesh) {
        result := ComCall(30, this, "ptr", gradientMesh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1GdiMetafile>} gdiMetafile 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {HRESULT} 
     */
    DrawGdiMetafile(gdiMetafile, destinationRectangle, sourceRectangle) {
        result := ComCall(31, this, "ptr", gdiMetafile, "ptr", destinationRectangle, "ptr", sourceRectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
