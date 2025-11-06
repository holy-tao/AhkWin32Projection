#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WM_CLIENT_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMClientConnections interface manages the collecting of information about clients connected to a writer network sink object.The writer network sink object exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmclientconnections
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMClientConnections extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMClientConnections
     * @type {Guid}
     */
    static IID => Guid("{73c66010-a299-41df-b1f0-ccf03b09c1c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClientCount", "GetClientProperties"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmclientconnections-getclientcount
     */
    GetClientCount() {
        result := ComCall(3, this, "uint*", &pcClients := 0, "HRESULT")
        return pcClients
    }

    /**
     * 
     * @param {Integer} dwClientNum 
     * @returns {WM_CLIENT_PROPERTIES} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmclientconnections-getclientproperties
     */
    GetClientProperties(dwClientNum) {
        pClientProperties := WM_CLIENT_PROPERTIES()
        result := ComCall(4, this, "uint", dwClientNum, "ptr", pClientProperties, "HRESULT")
        return pClientProperties
    }
}
