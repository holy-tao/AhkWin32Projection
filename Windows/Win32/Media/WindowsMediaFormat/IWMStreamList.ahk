#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMStreamList interface is used by mutual exclusion objects and bandwidth sharing objects to maintain lists of streams.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmstreamlist
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMStreamList extends IUnknown {
    /**
     * The interface identifier for IWMStreamList
     * @type {Guid}
     */
    static IID := Guid("{96406bdd-2b2b-11d3-b36b-00c04f6108ff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMStreamList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStreams   : IntPtr
        AddStream    : IntPtr
        RemoveStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMStreamList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetStreams method retrieves an array of stream numbers that make up the list.
     * @remarks
     * You should make two calls to <b>GetStreams</b>. On the first call, pass <b>NULL</b> as <i>pwStreamNumArray</i>. On return, the value pointed to by <i>pcStreams</i> is set to the number of stream numbers in the stream number array. Then you can allocate the required amount of memory for the array and pass a pointer to it as <i>pwStreamNumArray</i> on the second call.
     * 
     * Stream numbers are in the range of 1 through 63.
     * @param {Pointer<Integer>} pcStreams On input, a pointer to a variable containing the size of the <i>pwStreamNumArray</i> array. On output, if the method succeeds, this variable contains the number of stream numbers entered into <i>pwStreamNumArray</i> by the method.
     * @returns {Integer} Pointer to a <b>WORD</b> array containing the stream numbers. Pass <b>NULL</b> to retrieve the required size of the array.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamlist-getstreams
     */
    GetStreams(pcStreams) {
        pcStreamsMarshal := pcStreams is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ushort*", &pwStreamNumArray := 0, pcStreamsMarshal, pcStreams, "HRESULT")
        return pwStreamNumArray
    }

    /**
     * The AddStream method adds a stream to the list.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
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
     * There is not enough available memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamlist-addstream
     */
    AddStream(wStreamNum) {
        result := ComCall(4, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * The RemoveStream method removes a stream from the list.
     * @remarks
     * The <b>RemoveStream</b> method also removes the stream from any mutual exclusion objects that the stream belongs to.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NOMATCHING_ELEMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>wStreamNum</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamlist-removestream
     */
    RemoveStream(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMStreamList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreams := CallbackCreate(GetMethod(implObj, "GetStreams"), flags, 3)
        this.vtbl.AddStream := CallbackCreate(GetMethod(implObj, "AddStream"), flags, 2)
        this.vtbl.RemoveStream := CallbackCreate(GetMethod(implObj, "RemoveStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreams)
        CallbackFree(this.vtbl.AddStream)
        CallbackFree(this.vtbl.RemoveStream)
    }
}
