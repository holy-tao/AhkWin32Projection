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
     * Maps the provided data into user memory.
     * @param {Integer} bufferSize Type: <b>UINT32</b>
     * 
     * The desired size of the buffer.
     * @returns {Pointer<Integer>} Type: <b>const BYTE**</b>
     * 
     * When this method returns, contains the address of a pointer to the available buffer.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1vertexbuffer-map
     */
    Map(bufferSize) {
        result := ComCall(3, this, "ptr*", &data := 0, "uint", bufferSize, "HRESULT")
        return data
    }

    /**
     * Unmaps the vertex buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>D2DERR_WRONG_STATE</td>
     * <td>The object was not in the correct state to process the method.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1vertexbuffer-unmap
     */
    Unmap() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
