#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfClientId interface is implemented by the TSF manager. This interface is used to obtain a client identifier for TSF objects. An instance of this interface is obtained by querying the thread manager with IID_ITfClientId.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfclientid
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfClientId extends IUnknown{
    /**
     * The interface identifier for ITfClientId
     * @type {Guid}
     */
    static IID => Guid("{d60a7b49-1b9f-4be2-b702-47e9dc05dec3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<UInt32>} ptid 
     * @returns {HRESULT} 
     */
    GetClientId(rclsid, ptid) {
        result := ComCall(3, this, "ptr", rclsid, "uint*", ptid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
