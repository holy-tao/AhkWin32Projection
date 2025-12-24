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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMinPacketSize", "SetMinPacketSize"]

    /**
     * The GetMinPacketSize method retrieves the minimum packet size for files created with the profile. If you use this method from an interface belonging to a reader or synchronous reader object, the retrieved minimum packet size will always be zero.
     * @returns {Integer} Pointer to a <b>DWORD</b> that will receive the minimum packet size.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpacketsize2-getminpacketsize
     */
    GetMinPacketSize() {
        result := ComCall(5, this, "uint*", &pdwMinPacketSize := 0, "HRESULT")
        return pdwMinPacketSize
    }

    /**
     * The SetMinPacketSize method sets the minimum packet size for files created with the profile. This method cannot be called from an interface belonging to a reader or synchronous reader object.
     * @param {Integer} dwMinPacketSize <b>DWORD</b> specifying the new minimum packet size for files created with the profile.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpacketsize2-setminpacketsize
     */
    SetMinPacketSize(dwMinPacketSize) {
        result := ComCall(6, this, "uint", dwMinPacketSize, "HRESULT")
        return result
    }
}
