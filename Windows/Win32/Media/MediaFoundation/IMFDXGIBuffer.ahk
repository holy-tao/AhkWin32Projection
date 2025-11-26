#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a buffer that contains a Microsoft DirectX Graphics Infrastructure (DXGI)surface.
 * @remarks
 * 
 * To create a DXGImedia buffer, first create the DXGIsurface. Then call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgisurfacebuffer">MFCreateDXGISurfaceBuffer</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfdxgibuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDXGIBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDXGIBuffer
     * @type {Guid}
     */
    static IID => Guid("{e7174cfa-1c9e-48b1-8866-626226bfc258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResource", "GetSubresourceIndex", "GetUnknown", "SetUnknown"]

    /**
     * Queries the Microsoft DirectX Graphics Infrastructure (DXGI)surface for an interface.
     * @param {Pointer<Guid>} riid The interface identifer (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgibuffer-getresource
     */
    GetResource(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Gets the index of the subresource that is associated with this media buffer.
     * @returns {Integer} Receives the zero-based index of the subresource.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgibuffer-getsubresourceindex
     */
    GetSubresourceIndex() {
        result := ComCall(4, this, "uint*", &puSubresource := 0, "HRESULT")
        return puSubresource
    }

    /**
     * Gets an IUnknown pointer that was previously stored in the media buffer object.
     * @param {Pointer<Guid>} guid The identifier of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer.
     * @param {Pointer<Guid>} riid The interface identifer (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgibuffer-getunknown
     */
    GetUnknown(guid, riid) {
        result := ComCall(5, this, "ptr", guid, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Stores an arbitrary IUnknown pointer in the media buffer object.
     * @param {Pointer<Guid>} guid The identifier for the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer. This identifier is used as a key to retrieve the value. It can be any <b>GUID</b> value.
     * @param {IUnknown} pUnkData A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. Set this parameter to <b>NULL</b> to clear a pointer that was previously set.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An item already exists with this key.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfdxgibuffer-setunknown
     */
    SetUnknown(guid, pUnkData) {
        result := ComCall(6, this, "ptr", guid, "ptr", pUnkData, "HRESULT")
        return result
    }
}
