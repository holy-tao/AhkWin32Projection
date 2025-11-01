#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDTransportAddress.ahk

/**
 * Provides access to the individual components of an HTTP address.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdhttpaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDHttpAddress extends IWSDTransportAddress{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDHttpAddress
     * @type {Guid}
     */
    static IID => Guid("{d09ac7bd-2a3e-4b85-8605-2737ff3e4ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecure", "SetSecure", "GetPath", "SetPath"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpaddress-getsecure
     */
    GetSecure() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fSecure 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpaddress-setsecure
     */
    SetSecure(fSecure) {
        result := ComCall(11, this, "int", fSecure, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(ppszPath) {
        result := ComCall(12, this, "ptr", ppszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpaddress-setpath
     */
    SetPath(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(13, this, "ptr", pszPath, "HRESULT")
        return result
    }
}
