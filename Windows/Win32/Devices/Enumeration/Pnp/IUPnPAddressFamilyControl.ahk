#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPAddressFamilyControl interface accesses the address family flag of the Device Finder object.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpaddressfamilycontrol
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPAddressFamilyControl extends IUnknown{
    /**
     * The interface identifier for IUPnPAddressFamilyControl
     * @type {Guid}
     */
    static IID => Guid("{e3bf6178-694e-459f-a5a6-191ea0ffa1c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetAddressFamily(dwFlags) {
        result := ComCall(3, this, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetAddressFamily(pdwFlags) {
        result := ComCall(4, this, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
