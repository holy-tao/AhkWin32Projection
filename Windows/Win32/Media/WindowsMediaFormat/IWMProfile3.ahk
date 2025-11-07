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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getstorageformat
     */
    GetStorageFormat() {
        result := ComCall(22, this, "int*", &pnStorageFormat := 0, "HRESULT")
        return pnStorageFormat
    }

    /**
     * 
     * @param {Integer} nStorageFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-setstorageformat
     */
    SetStorageFormat(nStorageFormat) {
        result := ComCall(23, this, "int", nStorageFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getbandwidthsharingcount
     */
    GetBandwidthSharingCount() {
        result := ComCall(24, this, "uint*", &pcBS := 0, "HRESULT")
        return pcBS
    }

    /**
     * 
     * @param {Integer} dwBSIndex 
     * @returns {IWMBandwidthSharing} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getbandwidthsharing
     */
    GetBandwidthSharing(dwBSIndex) {
        result := ComCall(25, this, "uint", dwBSIndex, "ptr*", &ppBS := 0, "HRESULT")
        return IWMBandwidthSharing(ppBS)
    }

    /**
     * 
     * @param {IWMBandwidthSharing} pBS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-removebandwidthsharing
     */
    RemoveBandwidthSharing(pBS) {
        result := ComCall(26, this, "ptr", pBS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMBandwidthSharing} pBS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-addbandwidthsharing
     */
    AddBandwidthSharing(pBS) {
        result := ComCall(27, this, "ptr", pBS, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWMBandwidthSharing} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-createnewbandwidthsharing
     */
    CreateNewBandwidthSharing() {
        result := ComCall(28, this, "ptr*", &ppBS := 0, "HRESULT")
        return IWMBandwidthSharing(ppBS)
    }

    /**
     * 
     * @returns {IWMStreamPrioritization} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getstreamprioritization
     */
    GetStreamPrioritization() {
        result := ComCall(29, this, "ptr*", &ppSP := 0, "HRESULT")
        return IWMStreamPrioritization(ppSP)
    }

    /**
     * 
     * @param {IWMStreamPrioritization} pSP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-setstreamprioritization
     */
    SetStreamPrioritization(pSP) {
        result := ComCall(30, this, "ptr", pSP, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-removestreamprioritization
     */
    RemoveStreamPrioritization() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWMStreamPrioritization} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-createnewstreamprioritization
     */
    CreateNewStreamPrioritization() {
        result := ComCall(32, this, "ptr*", &ppSP := 0, "HRESULT")
        return IWMStreamPrioritization(ppSP)
    }

    /**
     * 
     * @param {Integer} msDuration 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile3-getexpectedpacketcount
     */
    GetExpectedPacketCount(msDuration) {
        result := ComCall(33, this, "uint", msDuration, "uint*", &pcPackets := 0, "HRESULT")
        return pcPackets
    }
}
