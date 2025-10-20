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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "SetType", "GetBandwidth", "SetBandwidth"]

    /**
     * 
     * @param {Pointer<Guid>} pguidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbandwidthsharing-gettype
     */
    GetType(pguidType) {
        result := ComCall(6, this, "ptr", pguidType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbandwidthsharing-settype
     */
    SetType(guidType) {
        result := ComCall(7, this, "ptr", guidType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBitrate 
     * @param {Pointer<Integer>} pmsBufferWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbandwidthsharing-getbandwidth
     */
    GetBandwidth(pdwBitrate, pmsBufferWindow) {
        result := ComCall(8, this, "uint*", pdwBitrate, "uint*", pmsBufferWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBitrate 
     * @param {Integer} msBufferWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbandwidthsharing-setbandwidth
     */
    SetBandwidth(dwBitrate, msBufferWindow) {
        result := ComCall(9, this, "uint", dwBitrate, "uint", msBufferWindow, "HRESULT")
        return result
    }
}
