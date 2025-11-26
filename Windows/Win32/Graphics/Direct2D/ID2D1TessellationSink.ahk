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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTriangles", "Close"]

    /**
     * Copies the specified triangles to the sink.
     * @param {Pointer<D2D1_TRIANGLE>} triangles Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_triangle">D2D1_TRIANGLE</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_triangle">D2D1_TRIANGLE</a> structures that describe the triangles to add to the sink.
     * @param {Integer} trianglesCount Type: <b>UINT</b>
     * 
     * The number of triangles to copy from the <i>triangles</i> array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1tessellationsink-addtriangles
     */
    AddTriangles(triangles, trianglesCount) {
        ComCall(3, this, "ptr", triangles, "uint", trianglesCount)
    }

    /**
     * Closes the sink and returns its error status.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1tessellationsink-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
