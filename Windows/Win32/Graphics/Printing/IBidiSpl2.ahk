#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IBidiSpl2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBidiSpl2
     * @type {Guid}
     */
    static IID => Guid("{0e8f51b8-8273-4906-8e7b-be453ffd2e2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindDevice", "UnbindDevice", "SendRecvXMLString", "SendRecvXMLStream"]

    /**
     * 
     * @param {PWSTR} pszDeviceName 
     * @param {Integer} dwAccess 
     * @returns {HRESULT} 
     */
    BindDevice(pszDeviceName, dwAccess) {
        pszDeviceName := pszDeviceName is String ? StrPtr(pszDeviceName) : pszDeviceName

        result := ComCall(3, this, "ptr", pszDeviceName, "uint", dwAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnbindDevice() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRequest 
     * @param {Pointer<BSTR>} pbstrResponse 
     * @returns {HRESULT} 
     */
    SendRecvXMLString(bstrRequest, pbstrResponse) {
        bstrRequest := bstrRequest is String ? BSTR.Alloc(bstrRequest).Value : bstrRequest

        result := ComCall(5, this, "ptr", bstrRequest, "ptr", pbstrResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pSRequest 
     * @param {Pointer<IStream>} ppSResponse 
     * @returns {HRESULT} 
     */
    SendRecvXMLStream(pSRequest, ppSResponse) {
        result := ComCall(6, this, "ptr", pSRequest, "ptr*", ppSResponse, "HRESULT")
        return result
    }
}
