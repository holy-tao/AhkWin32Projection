#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Tracks a transform-created resource texture.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1resourcetexture
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ResourceTexture extends IUnknown {
    /**
     * The interface identifier for ID2D1ResourceTexture
     * @type {Guid}
     */
    static IID := Guid("{688d15c3-02b0-438d-b13a-d1b44c32c39a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ResourceTexture interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Update : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ResourceTexture.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Updates the specific resource texture inside the specific range or box using the supplied data.
     * @remarks
     * The number of dimensions in the update must match those of the created texture.
     * @param {Pointer<Integer>} minimumExtents Type: <b>const UINT32*</b>
     * 
     * The "left" extent of the updates if specified; if <b>NULL</b>, the entire texture is updated.
     * @param {Pointer<Integer>} maximimumExtents Type: <b>const UINT32*</b>
     * 
     * The "right" extent of the updates if specified; if <b>NULL</b>, the entire texture is updated.
     * @param {Pointer<Integer>} strides Type: <b>const UINT32*</b>
     * 
     * The stride to advance through the input data, according to dimension.
     * @param {Integer} dimensions Type: <b>UINT32</b>
     * 
     * The number of dimensions in the resource texture. This must match the number used to load the texture.
     * @param {Pointer<Integer>} data Type: <b>const BYTE*</b>
     * 
     * The data to be placed into the resource texture.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * The size of the data buffer to be used to update the resource texture.
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
     * <td> E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1resourcetexture-update
     */
    Update(minimumExtents, maximimumExtents, strides, dimensions, data, dataCount) {
        minimumExtentsMarshal := minimumExtents is VarRef ? "uint*" : "ptr"
        maximimumExtentsMarshal := maximimumExtents is VarRef ? "uint*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, minimumExtentsMarshal, minimumExtents, maximimumExtentsMarshal, maximimumExtents, stridesMarshal, strides, "uint", dimensions, dataMarshal, data, "uint", dataCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1ResourceTexture.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Update)
    }
}
