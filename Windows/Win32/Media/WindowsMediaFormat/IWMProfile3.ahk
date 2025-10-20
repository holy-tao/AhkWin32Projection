#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMProfile2.ahk

/**
 * The IWMProfile3 interface provides enhanced features for profiles.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmprofile3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfile3 extends IWMProfile2{
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
     * 
     * @param {Pointer<Int32>} pnStorageFormat 
     * @returns {HRESULT} 
     */
    GetStorageFormat(pnStorageFormat) {
        result := ComCall(22, this, "int*", pnStorageFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nStorageFormat 
     * @returns {HRESULT} 
     */
    SetStorageFormat(nStorageFormat) {
        result := ComCall(23, this, "int", nStorageFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcBS 
     * @returns {HRESULT} 
     */
    GetBandwidthSharingCount(pcBS) {
        result := ComCall(24, this, "uint*", pcBS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBSIndex 
     * @param {Pointer<IWMBandwidthSharing>} ppBS 
     * @returns {HRESULT} 
     */
    GetBandwidthSharing(dwBSIndex, ppBS) {
        result := ComCall(25, this, "uint", dwBSIndex, "ptr", ppBS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMBandwidthSharing>} pBS 
     * @returns {HRESULT} 
     */
    RemoveBandwidthSharing(pBS) {
        result := ComCall(26, this, "ptr", pBS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMBandwidthSharing>} pBS 
     * @returns {HRESULT} 
     */
    AddBandwidthSharing(pBS) {
        result := ComCall(27, this, "ptr", pBS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMBandwidthSharing>} ppBS 
     * @returns {HRESULT} 
     */
    CreateNewBandwidthSharing(ppBS) {
        result := ComCall(28, this, "ptr", ppBS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMStreamPrioritization>} ppSP 
     * @returns {HRESULT} 
     */
    GetStreamPrioritization(ppSP) {
        result := ComCall(29, this, "ptr", ppSP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMStreamPrioritization>} pSP 
     * @returns {HRESULT} 
     */
    SetStreamPrioritization(pSP) {
        result := ComCall(30, this, "ptr", pSP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveStreamPrioritization() {
        result := ComCall(31, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMStreamPrioritization>} ppSP 
     * @returns {HRESULT} 
     */
    CreateNewStreamPrioritization(ppSP) {
        result := ComCall(32, this, "ptr", ppSP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msDuration 
     * @param {Pointer<UInt64>} pcPackets 
     * @returns {HRESULT} 
     */
    GetExpectedPacketCount(msDuration, pcPackets) {
        result := ComCall(33, this, "uint", msDuration, "uint*", pcPackets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
