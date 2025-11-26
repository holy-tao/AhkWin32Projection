#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Common\D2D_RECT_F.ahk
#Include .\ID2D1Resource.ahk

/**
 * A Direct2D resource that wraps a WMF, EMF, or EMF+ metafile.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1gdimetafile
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GdiMetafile extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GdiMetafile
     * @type {Guid}
     */
    static IID => Guid("{2f543dc3-cfc1-4211-864f-cfd91c6f3395}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Stream", "GetBounds"]

    /**
     * This method streams the contents of the command to the given metafile sink.
     * @param {ID2D1GdiMetafileSink} sink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gdimetafilesink">ID2D1GdiMetafileSink</a></b>
     * 
     * The sink into which Direct2D  will call back.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid value was passed to the method.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1gdimetafile-stream
     */
    Stream(sink) {
        result := ComCall(4, this, "ptr", sink, "HRESULT")
        return result
    }

    /**
     * Gets the bounds of the metafile, in device-independent pixels (DIPs), as reported in the metafile’s header.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The bounds, in DIPs, of the metafile.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1gdimetafile-getbounds
     */
    GetBounds() {
        bounds := D2D_RECT_F()
        result := ComCall(5, this, "ptr", bounds, "HRESULT")
        return bounds
    }
}
