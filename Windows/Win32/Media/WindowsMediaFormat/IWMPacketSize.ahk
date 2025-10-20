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
     * 
     * @param {Pointer<UInt32>} pdwMaxPacketSize 
     * @returns {HRESULT} 
     */
    GetMaxPacketSize(pdwMaxPacketSize) {
        result := ComCall(3, this, "uint*", pdwMaxPacketSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMaxPacketSize 
     * @returns {HRESULT} 
     */
    SetMaxPacketSize(dwMaxPacketSize) {
        result := ComCall(4, this, "uint", dwMaxPacketSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
