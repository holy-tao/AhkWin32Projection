#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPacketSize interface controls the maximum size of packets in an ASF file.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmpacketsize
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMPacketSize extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPacketSize
     * @type {Guid}
     */
    static IID => Guid("{cdfb97ab-188f-40b3-b643-5b7903975c59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxPacketSize", "SetMaxPacketSize"]

    /**
     * 
     * @param {Pointer<Integer>} pdwMaxPacketSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpacketsize-getmaxpacketsize
     */
    GetMaxPacketSize(pdwMaxPacketSize) {
        result := ComCall(3, this, "uint*", pdwMaxPacketSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxPacketSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpacketsize-setmaxpacketsize
     */
    SetMaxPacketSize(dwMaxPacketSize) {
        result := ComCall(4, this, "uint", dwMaxPacketSize, "HRESULT")
        return result
    }
}
