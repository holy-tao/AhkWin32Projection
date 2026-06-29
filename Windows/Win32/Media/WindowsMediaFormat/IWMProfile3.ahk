#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WMT_STORAGE_FORMAT.ahk" { WMT_STORAGE_FORMAT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMProfile2.ahk" { IWMProfile2 }
#Import ".\IWMStreamPrioritization.ahk" { IWMStreamPrioritization }
#Import ".\IWMBandwidthSharing.ahk" { IWMBandwidthSharing }

/**
 * The IWMProfile3 interface provides enhanced features for profiles.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmprofile3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMProfile3 extends IWMProfile2 {
    /**
     * The interface identifier for IWMProfile3
     * @type {Guid}
     */
    static IID := Guid("{00ef96cc-a461-4546-8bcd-c9a28f0e06f5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMProfile3 interfaces
    */
    struct Vtbl extends IWMProfile2.Vtbl {
        GetStorageFormat              : IntPtr
        SetStorageFormat              : IntPtr
        GetBandwidthSharingCount      : IntPtr
        GetBandwidthSharing           : IntPtr
        RemoveBandwidthSharing        : IntPtr
        AddBandwidthSharing           : IntPtr
        CreateNewBandwidthSharing     : IntPtr
        GetStreamPrioritization       : IntPtr
        SetStreamPrioritization       : IntPtr
        RemoveStreamPrioritization    : IntPtr
        CreateNewStreamPrioritization : IntPtr
        GetExpectedPacketCount        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMProfile3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetStorageFormat method is not implemented.
     * @remarks
     * To retrieve the storage format, use the <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-containerformat">WM/ContainerFormat</a> attribute.
     * @returns {WMT_STORAGE_FORMAT} Storage format.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getstorageformat
     */
    GetStorageFormat() {
        result := ComCall(22, this, "int*", &pnStorageFormat := 0, "HRESULT")
        return pnStorageFormat
    }

    /**
     * The SetStorageFormat method is not implemented.
     * @remarks
     * To retrieve the storage format, use the <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-containerformat">WM/ContainerFormat</a> attribute.
     * @param {WMT_STORAGE_FORMAT} nStorageFormat Storage format.
     * @returns {HRESULT} The method returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-setstorageformat
     */
    SetStorageFormat(nStorageFormat) {
        result := ComCall(23, this, WMT_STORAGE_FORMAT, nStorageFormat, "HRESULT")
        return result
    }

    /**
     * The GetBandwidthSharingCount method retrieves the total number of bandwidth sharing objects that have been added to the profile.
     * @returns {Integer} Pointer to receive the total number of bandwidth sharing objects.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getbandwidthsharingcount
     */
    GetBandwidthSharingCount() {
        result := ComCall(24, this, "uint*", &pcBS := 0, "HRESULT")
        return pcBS
    }

    /**
     * The GetBandwidthSharing method retrieves a bandwidth sharing object from a profile.
     * @remarks
     * Bandwidth sharing objects in a profile are assigned sequential index numbers in the order in which they were added to the profile. When you create multiple bandwidth sharing objects for a profile, you should keep track of the contents of each one. Otherwise you will have to examine each one to ascertain its settings.
     * @param {Integer} dwBSIndex <b>DWORD</b> containing the index number of the bandwidth sharing object you want to retrieve.
     * @returns {IWMBandwidthSharing} Pointer to receive the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbandwidthsharing">IWMBandwidthSharing</a> interface of the object requested.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getbandwidthsharing
     */
    GetBandwidthSharing(dwBSIndex) {
        result := ComCall(25, this, "uint", dwBSIndex, "ptr*", &ppBS := 0, "HRESULT")
        return IWMBandwidthSharing(ppBS)
    }

    /**
     * The RemoveBandwidthSharing method removes a bandwidth sharing object from the profile.
     * @remarks
     * This method does not release the bandwidth sharing object from memory. You must make a call to the <b>Release</b> method.
     * @param {IWMBandwidthSharing} pBS Pointer to a bandwidth sharing object.
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
     * <i>pBS</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * The bandwidth sharing object pointed to by <i>pBS</i> is not part of the profile.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-removebandwidthsharing
     */
    RemoveBandwidthSharing(pBS) {
        result := ComCall(26, this, "ptr", pBS, "HRESULT")
        return result
    }

    /**
     * The AddBandwidthSharing method adds an existing bandwidth sharing object to the profile. Bandwidth sharing objects are created with a call to CreateNewBandwidthSharing. You must configure the bandwidth sharing object before adding it to the profile.
     * @remarks
     * Making a call to <b>AddBandwidthSharing</b> without first using the methods of <b>IWMBandwidthSharing</b> to configure the bandwidth sharing object will result in an error.
     * @param {IWMBandwidthSharing} pBS Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbandwidthsharing">IWMBandwidthSharing</a> interface of a bandwidth sharing object.
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
     * <i>pBS</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * The bandwidth sharing object has a bandwidth sharing type value that is not valid.
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
     * An unknown error occurred while adding the bandwidth sharing object to the internal collection in the profile.
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
     * The method was unable to allocate memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NO_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bandwidth sharing object contains no streams.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-addbandwidthsharing
     */
    AddBandwidthSharing(pBS) {
        result := ComCall(27, this, "ptr", pBS, "HRESULT")
        return result
    }

    /**
     * The CreateNewBandwidthSharing method creates a new bandwidth sharing object.
     * @remarks
     * To make use of the bandwidth sharing object, you must add it to the profile with a call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-addbandwidthsharing">AddBandwidthSharing</a>. A bandwidth sharing object cannot exist on its own. If you release the profile object without adding the bandwidth sharing object to the profile, you will lose the bandwidth sharing object.
     * 
     * You must configure the bandwidth sharing object before you use <b>AddBandwidthSharing</b> to include the bandwidth sharing object in the profile. For more information about configuring bandwidth sharing objects, see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbandwidthsharing">IWMBandwidthSharing Interface</a>.
     * @returns {IWMBandwidthSharing} Pointer to a variable that receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbandwidthsharing">IWMBandwidthSharing</a> interface of the new object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-createnewbandwidthsharing
     */
    CreateNewBandwidthSharing() {
        result := ComCall(28, this, "ptr*", &ppBS := 0, "HRESULT")
        return IWMBandwidthSharing(ppBS)
    }

    /**
     * The GetStreamPrioritization method retrieves the stream prioritization that exists in the profile.
     * @remarks
     * Many profiles do not have a stream prioritization assigned to them. If you call <b>GetStreamPrioritization</b> on such a profile, no error is returned, but the retrieved address is <b>NULL</b>.
     * @returns {IWMStreamPrioritization} Pointer to receive the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamprioritization">IWMStreamPrioritization</a> interface of the stream prioritization object in the profile.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getstreamprioritization
     */
    GetStreamPrioritization() {
        result := ComCall(29, this, "ptr*", &ppSP := 0, "HRESULT")
        return IWMStreamPrioritization(ppSP)
    }

    /**
     * The SetStreamPrioritization method assigns a stream prioritization object to the profile. A profile can contain only one stream prioritization object at a time.
     * @remarks
     * If there is already a stream prioritization object in the profile, it will be lost.
     * @param {IWMStreamPrioritization} pSP Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamprioritization">IWMStreamPrioritization</a> interface of the stream prioritization object you want to assign to the profile.
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
     * <dt><b>E_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pSP</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * The method was unable to validate the stream prioritization object.
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
     * The method was unable to allocate memory in the profile for the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-setstreamprioritization
     */
    SetStreamPrioritization(pSP) {
        result := ComCall(30, this, "ptr", pSP, "HRESULT")
        return result
    }

    /**
     * The RemoveStreamPrioritization method removes the stream prioritization object from the profile.
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
     * <dt><b>ASF_E_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No stream prioritization object exists in the profile.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-removestreamprioritization
     */
    RemoveStreamPrioritization() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * The CreateNewStreamPrioritization method creates a new stream prioritization object.
     * @remarks
     * A profile can only contain one stream prioritization. When you assign a new stream prioritization to a profile, the previous one will be lost.
     * @returns {IWMStreamPrioritization} Pointer to receive the address of the <b>IWMStreamPrioritization</b> interface of the new object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-createnewstreamprioritization
     */
    CreateNewStreamPrioritization() {
        result := ComCall(32, this, "ptr*", &ppSP := 0, "HRESULT")
        return IWMStreamPrioritization(ppSP)
    }

    /**
     * The GetExpectedPacketCount method calculates the expected packet count for the specified duration. The packet count returned is only an estimate, and it is based upon the settings of the profile at the time this call is made.
     * @remarks
     * Problems will arise if the value passed in <i>msDuration</i> is not a positive number of milliseconds. The method will return S_OK as normal, but the packet count returned will not be correct.
     * 
     * It is impossible for this method to give exact counts, because there is no way to account for interleaved data in an encoded file. The packet count returned is most accurate for files with one audio stream. The more complicated the profile, the less accurate the packet count will be.
     * @param {Integer} msDuration Specifies the duration in milliseconds.
     * @returns {Integer} Pointer to receive the count of packets expected for <i>msDuration</i> milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getexpectedpacketcount
     */
    GetExpectedPacketCount(msDuration) {
        result := ComCall(33, this, "uint", msDuration, "uint*", &pcPackets := 0, "HRESULT")
        return pcPackets
    }

    Query(iid) {
        if (IWMProfile3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStorageFormat := CallbackCreate(GetMethod(implObj, "GetStorageFormat"), flags, 2)
        this.vtbl.SetStorageFormat := CallbackCreate(GetMethod(implObj, "SetStorageFormat"), flags, 2)
        this.vtbl.GetBandwidthSharingCount := CallbackCreate(GetMethod(implObj, "GetBandwidthSharingCount"), flags, 2)
        this.vtbl.GetBandwidthSharing := CallbackCreate(GetMethod(implObj, "GetBandwidthSharing"), flags, 3)
        this.vtbl.RemoveBandwidthSharing := CallbackCreate(GetMethod(implObj, "RemoveBandwidthSharing"), flags, 2)
        this.vtbl.AddBandwidthSharing := CallbackCreate(GetMethod(implObj, "AddBandwidthSharing"), flags, 2)
        this.vtbl.CreateNewBandwidthSharing := CallbackCreate(GetMethod(implObj, "CreateNewBandwidthSharing"), flags, 2)
        this.vtbl.GetStreamPrioritization := CallbackCreate(GetMethod(implObj, "GetStreamPrioritization"), flags, 2)
        this.vtbl.SetStreamPrioritization := CallbackCreate(GetMethod(implObj, "SetStreamPrioritization"), flags, 2)
        this.vtbl.RemoveStreamPrioritization := CallbackCreate(GetMethod(implObj, "RemoveStreamPrioritization"), flags, 1)
        this.vtbl.CreateNewStreamPrioritization := CallbackCreate(GetMethod(implObj, "CreateNewStreamPrioritization"), flags, 2)
        this.vtbl.GetExpectedPacketCount := CallbackCreate(GetMethod(implObj, "GetExpectedPacketCount"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStorageFormat)
        CallbackFree(this.vtbl.SetStorageFormat)
        CallbackFree(this.vtbl.GetBandwidthSharingCount)
        CallbackFree(this.vtbl.GetBandwidthSharing)
        CallbackFree(this.vtbl.RemoveBandwidthSharing)
        CallbackFree(this.vtbl.AddBandwidthSharing)
        CallbackFree(this.vtbl.CreateNewBandwidthSharing)
        CallbackFree(this.vtbl.GetStreamPrioritization)
        CallbackFree(this.vtbl.SetStreamPrioritization)
        CallbackFree(this.vtbl.RemoveStreamPrioritization)
        CallbackFree(this.vtbl.CreateNewStreamPrioritization)
        CallbackFree(this.vtbl.GetExpectedPacketCount)
    }
}
