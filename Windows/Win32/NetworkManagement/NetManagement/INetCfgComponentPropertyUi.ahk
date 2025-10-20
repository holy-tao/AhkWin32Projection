#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentPropertyUi extends IUnknown{
    /**
     * The interface identifier for INetCfgComponentPropertyUi
     * @type {Guid}
     */
    static IID => Guid("{932238e0-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkReserved 
     * @returns {HRESULT} 
     */
    QueryPropertyUi(pUnkReserved) {
        result := ComCall(3, this, "ptr", pUnkReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkReserved 
     * @returns {HRESULT} 
     */
    SetContext(pUnkReserved) {
        result := ComCall(4, this, "ptr", pUnkReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwDefPages 
     * @param {Pointer<Byte>} pahpspPrivate 
     * @param {Pointer<UInt32>} pcPages 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} pszStartPage 
     * @returns {HRESULT} 
     */
    MergePropPages(pdwDefPages, pahpspPrivate, pcPages, hwndParent, pszStartPage) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "uint*", pdwDefPages, "char*", pahpspPrivate, "uint*", pcPages, "ptr", hwndParent, "ptr", pszStartPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndSheet 
     * @returns {HRESULT} 
     */
    ValidateProperties(hwndSheet) {
        hwndSheet := hwndSheet is Win32Handle ? NumGet(hwndSheet, "ptr") : hwndSheet

        result := ComCall(6, this, "ptr", hwndSheet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ApplyProperties() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelProperties() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
