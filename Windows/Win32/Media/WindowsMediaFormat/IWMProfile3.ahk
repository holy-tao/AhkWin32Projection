#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMBandwidthSharing.ahk
#Include .\IWMStreamPrioritization.ahk
#Include .\IWMProfile2.ahk

/**
 * The IWMProfile3 interface provides enhanced features for profiles.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmprofile3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfile3 extends IWMProfile2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMProfile3
     * @type {Guid}
     */
    static IID => Guid("{00ef96cc-a461-4546-8bcd-c9a28f0e06f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStorageFormat", "SetStorageFormat", "GetBandwidthSharingCount", "GetBandwidthSharing", "RemoveBandwidthSharing", "AddBandwidthSharing", "CreateNewBandwidthSharing", "GetStreamPrioritization", "SetStreamPrioritization", "RemoveStreamPrioritization", "CreateNewStreamPrioritization", "GetExpectedPacketCount"]

    /**
     * The GetStorageFormat method is not implemented.
     * @returns {Integer} Storage format.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-getstorageformat
     */
    GetStorageFormat() {
        result := ComCall(22, this, "int*", &pnStorageFormat := 0, "HRESULT")
        return pnStorageFormat
    }

    /**
     * The SetStorageFormat method is not implemented.
     * @param {Integer} nStorageFormat Storage format.
     * @returns {HRESULT} The method returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-setstorageformat
     */
    SetStorageFormat(nStorageFormat) {
        result := ComCall(23, this, "int", nStorageFormat, "HRESULT")
        return result
    }

    /**
     * The GetBandwidthSharingCount method retrieves the total number of bandwidth sharing objects that have been added to the profile.
     * @returns {Integer} Pointer to receive the total number of bandwidth sharing objects.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-getbandwidthsharingcount
     */
    GetBandwidthSharingCount() {
        result := ComCall(24, this, "uint*", &pcBS := 0, "HRESULT")
        return pcBS
    }

    /**
     * The GetBandwidthSharing method retrieves a bandwidth sharing object from a profile.
     * @param {Integer} dwBSIndex <b>DWORD</b> containing the index number of the bandwidth sharing object you want to retrieve.
     * @returns {IWMBandwidthSharing} Pointer to receive the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbandwidthsharing">IWMBandwidthSharing</a> interface of the object requested.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-getbandwidthsharing
     */
    GetBandwidthSharing(dwBSIndex) {
        result := ComCall(25, this, "uint", dwBSIndex, "ptr*", &ppBS := 0, "HRESULT")
        return IWMBandwidthSharing(ppBS)
    }

    /**
     * The RemoveBandwidthSharing method removes a bandwidth sharing object from the profile.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-removebandwidthsharing
     */
    RemoveBandwidthSharing(pBS) {
        result := ComCall(26, this, "ptr", pBS, "HRESULT")
        return result
    }

    /**
     * The AddBandwidthSharing method adds an existing bandwidth sharing object to the profile. Bandwidth sharing objects are created with a call to CreateNewBandwidthSharing. You must configure the bandwidth sharing object before adding it to the profile.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-addbandwidthsharing
     */
    AddBandwidthSharing(pBS) {
        result := ComCall(27, this, "ptr", pBS, "HRESULT")
        return result
    }

    /**
     * The CreateNewBandwidthSharing method creates a new bandwidth sharing object.
     * @returns {IWMBandwidthSharing} Pointer to a variable that receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbandwidthsharing">IWMBandwidthSharing</a> interface of the new object.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-createnewbandwidthsharing
     */
    CreateNewBandwidthSharing() {
        result := ComCall(28, this, "ptr*", &ppBS := 0, "HRESULT")
        return IWMBandwidthSharing(ppBS)
    }

    /**
     * The GetStreamPrioritization method retrieves the stream prioritization that exists in the profile.
     * @returns {IWMStreamPrioritization} Pointer to receive the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamprioritization">IWMStreamPrioritization</a> interface of the stream prioritization object in the profile.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-getstreamprioritization
     */
    GetStreamPrioritization() {
        result := ComCall(29, this, "ptr*", &ppSP := 0, "HRESULT")
        return IWMStreamPrioritization(ppSP)
    }

    /**
     * The SetStreamPrioritization method assigns a stream prioritization object to the profile. A profile can contain only one stream prioritization object at a time.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-setstreamprioritization
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-removestreamprioritization
     */
    RemoveStreamPrioritization() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * The CreateNewStreamPrioritization method creates a new stream prioritization object.
     * @returns {IWMStreamPrioritization} Pointer to receive the address of the <b>IWMStreamPrioritization</b> interface of the new object.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-createnewstreamprioritization
     */
    CreateNewStreamPrioritization() {
        result := ComCall(32, this, "ptr*", &ppSP := 0, "HRESULT")
        return IWMStreamPrioritization(ppSP)
    }

    /**
     * The GetExpectedPacketCount method calculates the expected packet count for the specified duration. The packet count returned is only an estimate, and it is based upon the settings of the profile at the time this call is made.
     * @param {Integer} msDuration Specifies the duration in milliseconds.
     * @returns {Integer} Pointer to receive the count of packets expected for <i>msDuration</i> milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofile3-getexpectedpacketcount
     */
    GetExpectedPacketCount(msDuration) {
        result := ComCall(33, this, "uint", msDuration, "uint*", &pcPackets := 0, "HRESULT")
        return pcPackets
    }
}
