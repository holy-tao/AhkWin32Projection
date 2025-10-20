#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Populates an ID2D1Mesh object with triangles.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1tessellationsink
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1TessellationSink extends IUnknown{
    /**
     * The interface identifier for ID2D1TessellationSink
     * @type {Guid}
     */
    static IID => Guid("{2cd906c1-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<D2D1_TRIANGLE>} triangles 
     * @param {Integer} trianglesCount 
     * @returns {String} Nothing - always returns an empty string
     */
    AddTriangles(triangles, trianglesCount) {
        ComCall(3, this, "ptr", triangles, "uint", trianglesCount)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
