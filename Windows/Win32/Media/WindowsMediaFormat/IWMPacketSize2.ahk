#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPacketSize.ahk

/**
 * The IWMPacketSize2 interface provides methods to set and retrieve the minimum packet size for a profile.An IWMPacketSize2 interface can be obtained for either a profile object, a reader object, or a synchronous reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmpacketsize2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMPacketSize2 extends IWMPacketSize{
    /**
     * The interface identifier for IWMPacketSize2
     * @type {Guid}
     */
    static IID => Guid("{8bfc2b9e-b646-4233-a877-1c6a079669dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<UInt32>} pdwMinPacketSize 
     * @returns {HRESULT} 
     */
    GetMinPacketSize(pdwMinPacketSize) {
        result := ComCall(5, this, "uint*", pdwMinPacketSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMinPacketSize 
     * @returns {HRESULT} 
     */
    SetMinPacketSize(dwMinPacketSize) {
        result := ComCall(6, this, "uint", dwMinPacketSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
