#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Tracks a transform-created resource texture.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1resourcetexture
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ResourceTexture extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ResourceTexture
     * @type {Guid}
     */
    static IID => Guid("{688d15c3-02b0-438d-b13a-d1b44c32c39a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Update"]

    /**
     * Updates the specific resource texture inside the specific range or box using the supplied data.
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1resourcetexture-update
     */
    Update(minimumExtents, maximimumExtents, strides, dimensions, data, dataCount) {
        minimumExtentsMarshal := minimumExtents is VarRef ? "uint*" : "ptr"
        maximimumExtentsMarshal := maximimumExtents is VarRef ? "uint*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, minimumExtentsMarshal, minimumExtents, maximimumExtentsMarshal, maximimumExtents, stridesMarshal, strides, "uint", dimensions, dataMarshal, data, "uint", dataCount, "HRESULT")
        return result
    }
}
