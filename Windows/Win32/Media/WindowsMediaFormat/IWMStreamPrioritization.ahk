#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WM_STREAM_PRIORITY_RECORD.ahk" { WM_STREAM_PRIORITY_RECORD }

/**
 * The IWMStreamPrioritization interface provides methods to set and read priority records for a file.Stream prioritization allows content creators to specify the priority of the streams in an ASF file.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmstreamprioritization
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMStreamPrioritization extends IUnknown {
    /**
     * The interface identifier for IWMStreamPrioritization
     * @type {Guid}
     */
    static IID := Guid("{8c1c6090-f9a8-4748-8ec3-dd1108ba1e77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMStreamPrioritization interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPriorityRecords : IntPtr
        SetPriorityRecords : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMStreamPrioritization.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPriorityRecords method retrieves the list of streams and their priorities from the profile.
     * @remarks
     * You should make two calls to <b>GetPriorityRecords</b>. On the first call, pass <b>NULL</b> as <i>pRecordArray</i>. On return, the value of <i>pcRecords</i> is set to the number of prioritization records in the stream priority object. Then you can allocate the required amount of memory for the array and pass a pointer to it as <i>pRecordArray</i> in the second call.
     * 
     * If you pass an array as <i>pRecordArray</i> that does not have enough elements allocated to contain the data, an error code of ASF_E_BUFFERTOOSMALL is returned. When returning this error code, the method still sets the value of <i>pcRecords</i>.
     * 
     * Records in a stream prioritization object are given in order of decreasing priority
     * @param {Pointer<Integer>} pcRecords Pointer to a <b>WORD</b> that receives the count of records.
     * @returns {WM_STREAM_PRIORITY_RECORD} Pointer to an array of <b>WM_STREAM_PRIORITY_RECORD</b> structures. This array will receive the current stream priority data.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamprioritization-getpriorityrecords
     */
    GetPriorityRecords(pcRecords) {
        pcRecordsMarshal := pcRecords is VarRef ? "ushort*" : "ptr"

        pRecordArray := WM_STREAM_PRIORITY_RECORD()
        result := ComCall(3, this, WM_STREAM_PRIORITY_RECORD.Ptr, pRecordArray, pcRecordsMarshal, pcRecords, "HRESULT")
        return pRecordArray
    }

    /**
     * The SetPriorityRecords method assigns the members of an array as the stream priority list in the stream prioritization object.
     * @remarks
     * Valid arrays contain no duplicate stream numbers. Streams are listed in the array in descending priority order. Any stream that is designated as mandatory must occur in the array before any entries that are optional. If any of these rules are broken, <b>SetPriorityRecords</b> will return E_INVALIDARG.
     * 
     * <b>SetPriorityRecords</b> overwrites an existing stream priority array if there is one. You can clear the array by passing zero for <i>cRecords</i>.
     * 
     * This method does not verify that the streams specified are valid for the profile.
     * @param {Pointer<WM_STREAM_PRIORITY_RECORD>} pRecordArray Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_stream_priority_record">WM_STREAM_PRIORITY_RECORD</a> structures.
     * @param {Integer} cRecords Count of records.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>cRecords</i> specifies a record count greater than zero, but <i>pRecordArray</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * One of the array rules has been broken (see the Remarks section).
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
     * The method is unable to allocate the memory required to store the array in the stream prioritization object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamprioritization-setpriorityrecords
     */
    SetPriorityRecords(pRecordArray, cRecords) {
        result := ComCall(4, this, WM_STREAM_PRIORITY_RECORD.Ptr, pRecordArray, "ushort", cRecords, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMStreamPrioritization.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPriorityRecords := CallbackCreate(GetMethod(implObj, "GetPriorityRecords"), flags, 3)
        this.vtbl.SetPriorityRecords := CallbackCreate(GetMethod(implObj, "SetPriorityRecords"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPriorityRecords)
        CallbackFree(this.vtbl.SetPriorityRecords)
    }
}
