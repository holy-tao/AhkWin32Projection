#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a mappable single-dimensional vertex buffer.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1vertexbuffer
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1VertexBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1VertexBuffer
     * @type {Guid}
     */
    static IID => Guid("{9b8b1336-00a5-4668-92b7-ced5d8bf9b7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Map", "Unmap"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} data 
     * @param {Integer} bufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1vertexbuffer-map
     */
    Map(data, bufferSize) {
        result := ComCall(3, this, "ptr*", data, "uint", bufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1vertexbuffer-unmap
     */
    Unmap() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
