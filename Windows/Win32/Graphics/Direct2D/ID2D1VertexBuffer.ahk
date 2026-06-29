#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a mappable single-dimensional vertex buffer.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1vertexbuffer
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1VertexBuffer extends IUnknown {
    /**
     * The interface identifier for ID2D1VertexBuffer
     * @type {Guid}
     */
    static IID := Guid("{9b8b1336-00a5-4668-92b7-ced5d8bf9b7b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1VertexBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Map   : IntPtr
        Unmap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1VertexBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Maps the provided data into user memory.
     * @remarks
     * If <i>data</i> is larger than <i>bufferSize</i>, this method fails.
     * @param {Integer} bufferSize Type: <b>UINT32</b>
     * 
     * The desired size of the buffer.
     * @returns {Pointer<Integer>} Type: <b>const BYTE**</b>
     * 
     * When this method returns, contains the address of a pointer to the available buffer.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1vertexbuffer-map
     */
    Map(bufferSize) {
        result := ComCall(3, this, "ptr*", &data := 0, "uint", bufferSize, "HRESULT")
        return data
    }

    /**
     * Unmaps the vertex buffer.
     * @remarks
     * After this method returns, the mapped memory from the vertex buffer is no longer accessible by the effect.
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1vertexbuffer-unmap
     */
    Unmap() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1VertexBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Map := CallbackCreate(GetMethod(implObj, "Map"), flags, 3)
        this.vtbl.Unmap := CallbackCreate(GetMethod(implObj, "Unmap"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Map)
        CallbackFree(this.vtbl.Unmap)
    }
}
