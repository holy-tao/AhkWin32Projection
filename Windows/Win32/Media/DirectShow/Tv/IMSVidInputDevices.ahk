#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IMSVidInputDevice.ahk" { IMSVidInputDevice }
#Import "..\..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IMSVidInputDevices interface represents a collection of input devices. The MSVidInputDevices object exposes this object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidInputDevices)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidinputdevices
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidInputDevices extends IDispatch {
    /**
     * The interface identifier for IMSVidInputDevices
     * @type {Guid}
     */
    static IID := Guid("{c5702cd1-9b79-11d3-b654-00c04f79498e}")

    /**
     * The class identifier for MSVidInputDevices
     * @type {Guid}
     */
    static CLSID := Guid("{c5702ccc-9b79-11d3-b654-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidInputDevices interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidInputDevices.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &lCount := 0, "HRESULT")
        return lCount
    }

    /**
     * The get__NewEnum method retrieves an enumerator for the collection.
     * @remarks
     * This method is provided so that Automation clients can iterate through the collection using a <c>For...Each</c> loop.
     * 
     * The returned <b>IEnumVARIANT</b> interface is not thread safe, because it is intended primarily for use by Automation clients. Clients should not call methods on the interface from more than one thread. (C++ applications should generally use the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidinputdevices-get_item">IMSVidInputDevices::get_Item</a> method instead.)
     * 
     * If the method succeeds, the <b>IEnumVARIANT</b> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IEnumVARIANT} Pointer to a variable that receives an <b>IEnumVARIANT</b> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &pD := 0, "HRESULT")
        return IEnumVARIANT(pD)
    }

    /**
     * The get_Item method retrieves the specified item from the collection.
     * @remarks
     * The <i>v</i> parameter must be a <b>VARIANT</b> that contains an integer type (VT_I4). The valid range is from 0 to <c>IMSVidInputDevices::get_Count() - 1</c>.
     * 
     * If the method succeeds, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevice">IMSVidInputDevice</a> interface has an outstanding reference count. The caller must release the interface.
     * @param {VARIANT} v <b>VARIANT</b> that specifies the index of the item to retrieve.
     * @returns {IMSVidInputDevice} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevice">IMSVidInputDevice</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-get_item
     */
    get_Item(v) {
        result := ComCall(9, this, VARIANT, v, "ptr*", &pDB := 0, "HRESULT")
        return IMSVidInputDevice(pDB)
    }

    /**
     * The Add method adds an input device to the collection.
     * @param {IMSVidInputDevice} pDB Pointer to the device's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevice">IMSVidInputDevice</a> interface.
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
     * This collection is read-only; cannot add any items.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-add
     */
    Add(pDB) {
        result := ComCall(10, this, "ptr", pDB, "HRESULT")
        return result
    }

    /**
     * The Remove method removes an item from the collection.
     * @remarks
     * The <i>v</i> parameter must be a <b>VARIANT</b> that contains an integer type (VT_I4). The valid range is from 0 to <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidinputdevices-get_count">IMSVidInputDevices::get_Count</a> - 1.
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
     * Index out of range.
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
     * This collection is read-only; no items can be removed from it
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-remove
     */
    Remove(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidInputDevices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
    }
}
