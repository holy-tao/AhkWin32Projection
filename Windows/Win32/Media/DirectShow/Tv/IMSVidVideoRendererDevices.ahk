#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IMSVidVideoRenderer.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidVideoRendererDevices interface represents a collection of video renderers. The MSVidVideoRendererDevices object exposes this method. Applications can use this interface to enumerate the collection.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoRendererDevices)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/segment/nn-segment-imsvidvideorendererdevices
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVideoRendererDevices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidVideoRendererDevices
     * @type {Guid}
     */
    static IID => Guid("{c5702cd3-9b79-11d3-b654-00c04f79498e}")

    /**
     * The class identifier for MSVidVideoRendererDevices
     * @type {Guid}
     */
    static CLSID => Guid("{c5702cce-9b79-11d3-b654-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item", "Add", "Remove"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The get_Count method retrieves the number of items in the collection.
     * @returns {Integer} Pointer to a variable that receives the number of items.
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorendererdevices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &lCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lCount
    }

    /**
     * The get__NewEnum method retrieves an enumerator for the collection.
     * @remarks
     * This method is provided so that Automation clients can iterate through the collection using a <c>For...Each</c> loop.
     * 
     * The returned <b>IEnumVARIANT</b> interface is not thread safe, because it is intended primarily for use by Automation clients. Clients should not call methods on the interface from more than one thread. (C++ applications should generally use the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorendererdevices-get_item">IMSVidVideoRendererDevices::get_Item</a> method instead.)
     * 
     * If the method succeeds, the <b>IEnumVARIANT</b> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IEnumVARIANT} Pointer to a variable that receives an <b>IEnumVARIANT</b> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorendererdevices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &pD := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumVARIANT(pD)
    }

    /**
     * The get_Item method retrieves the specified item from the collection.
     * @remarks
     * The <i>v</i> parameter must be a <b>VARIANT</b> that contains an integer type (VT_I4). The valid range is from 0 to <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorendererdevices-get_count">IMSVidVideoRendererDevices::get_Count</a> - 1.
     * @param {VARIANT} v <b>VARIANT</b> that specifies the index of the item to retrieve.
     * @returns {IMSVidVideoRenderer} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidvideorenderer">IMSVidVideoRenderer</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorendererdevices-get_item
     */
    get_Item(v) {
        result := ComCall(9, this, "ptr", v, "ptr*", &pDB := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMSVidVideoRenderer(pDB)
    }

    /**
     * The Add method adds a video renderer to the collection.
     * @param {IMSVidVideoRenderer} pDB Specifies a pointer to the video renderer's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidvideorenderer">IMSVidVideoRenderer</a> interface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is read-only; cannot add any items.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorendererdevices-add
     */
    Add(pDB) {
        result := ComCall(10, this, "ptr", pDB, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Remove method removes an item from the collection.
     * @remarks
     * The <i>v</i> parameter must be a <b>VARIANT</b> that contains an integer type (VT_I4). The valid range is from 0 to <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorendererdevices-get_count">IMSVidVideoRendererDevices::get_Count</a> - 1.
     * @param {VARIANT} v <b>VARIANT</b> that specifies the index of the item to remove.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * <dt><b>DISP_E_BADINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The index is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Wrong <b>VARIANT</b> type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is read-only; cannot remove any items.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorendererdevices-remove
     */
    Remove(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
