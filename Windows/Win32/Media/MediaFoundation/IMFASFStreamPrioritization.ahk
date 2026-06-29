#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Not implemented. (IMFASFStreamPrioritization)
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nn-wmcontainer-imfasfstreamprioritization
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFASFStreamPrioritization extends IUnknown {
    /**
     * The interface identifier for IMFASFStreamPrioritization
     * @type {Guid}
     */
    static IID := Guid("{699bdc27-bbaf-49ff-8e38-9c39c9b5e088}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFASFStreamPrioritization interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStreamCount : IntPtr
        GetStream      : IntPtr
        AddStream      : IntPtr
        RemoveStream   : IntPtr
        Clone          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFASFStreamPrioritization.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Retrieves the number of entries in the stream priority list.
     * @returns {Integer} Receives the number of streams in the stream priority list.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Retrieves the stream number of a stream in the stream priority list.
     * @param {Integer} dwStreamIndex Zero-based index of the entry to retrieve from the stream priority list. To get the number of entries in the priority list, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstreamcount">IMFASFStreamPrioritization::GetStreamCount</a>.
     * @param {Pointer<Integer>} pwStreamNumber Receives the stream number of the stream priority entry.
     * @param {Pointer<Integer>} pwStreamFlags Receives a Boolean value. If <b>TRUE</b>, the stream is mandatory.
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
     * <b>NULL</b> pointer argument or the <i>dwStreamIndex</i> parameter is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstream
     */
    GetStream(dwStreamIndex, pwStreamNumber, pwStreamFlags) {
        pwStreamNumberMarshal := pwStreamNumber is VarRef ? "ushort*" : "ptr"
        pwStreamFlagsMarshal := pwStreamFlags is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "uint", dwStreamIndex, pwStreamNumberMarshal, pwStreamNumber, pwStreamFlagsMarshal, pwStreamFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Adds a stream to the stream priority list.
     * @remarks
     * The stream priority list is built by appending entries to the list with each call to <b>AddStream</b>. The list is evaluated in descending order of importance. The most important stream should be added first, and the least important should be added last.
     * @param {Integer} wStreamNumber Stream number of the stream to add.
     * @param {Integer} wStreamFlags If <b>TRUE</b>, the stream is mandatory.
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
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-addstream
     */
    AddStream(wStreamNumber, wStreamFlags) {
        result := ComCall(5, this, "ushort", wStreamNumber, "ushort", wStreamFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Removes a stream from the stream priority list.
     * @remarks
     * When a stream is removed from the stream priority list, the index values of all streams that follow it in the list are decremented.
     * @param {Integer} dwStreamIndex Index of the entry in the stream priority list to remove. Values range from zero, to one less than the stream count retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstreamcount">IMFASFStreamPrioritization::GetStreamCount</a>.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-removestream
     */
    RemoveStream(dwStreamIndex) {
        result := ComCall(6, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Creates a copy of the ASF stream prioritization object.
     * @remarks
     * The new object is completely independent of the original.
     * @returns {IMFASFStreamPrioritization} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamprioritization">IMFASFStreamPrioritization</a> interface of the new object. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-clone
     */
    Clone() {
        result := ComCall(7, this, "ptr*", &ppIStreamPrioritization := 0, "HRESULT")
        return IMFASFStreamPrioritization(ppIStreamPrioritization)
    }

    Query(iid) {
        if (IMFASFStreamPrioritization.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreamCount := CallbackCreate(GetMethod(implObj, "GetStreamCount"), flags, 2)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 4)
        this.vtbl.AddStream := CallbackCreate(GetMethod(implObj, "AddStream"), flags, 3)
        this.vtbl.RemoveStream := CallbackCreate(GetMethod(implObj, "RemoveStream"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreamCount)
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.AddStream)
        CallbackFree(this.vtbl.RemoveStream)
        CallbackFree(this.vtbl.Clone)
    }
}
