#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamList.ahk

/**
 * The IWMBandwidthSharing interface contains methods to manage the properties of combined streams.The list of streams that share bandwidth is stored in the bandwidth sharing object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmbandwidthsharing
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMBandwidthSharing extends IWMStreamList{
    /**
     * The interface identifier for IWMBandwidthSharing
     * @type {Guid}
     */
    static IID => Guid("{ad694af1-f8d9-42f8-bc47-70311b0c4f9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<Guid>} pguidType 
     * @returns {HRESULT} 
     */
    GetType(pguidType) {
        result := ComCall(6, this, "ptr", pguidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @returns {HRESULT} 
     */
    SetType(guidType) {
        result := ComCall(7, this, "ptr", guidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBitrate 
     * @param {Pointer<UInt32>} pmsBufferWindow 
     * @returns {HRESULT} 
     */
    GetBandwidth(pdwBitrate, pmsBufferWindow) {
        result := ComCall(8, this, "uint*", pdwBitrate, "uint*", pmsBufferWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBitrate 
     * @param {Integer} msBufferWindow 
     * @returns {HRESULT} 
     */
    SetBandwidth(dwBitrate, msBufferWindow) {
        result := ComCall(9, this, "uint", dwBitrate, "uint", msBufferWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
