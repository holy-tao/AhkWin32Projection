#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceControlHttpHeaders extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceControlHttpHeaders
     * @type {Guid}
     */
    static IID => Guid("{204810bb-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdditionalResponseHeaders"]

    /**
     * 
     * @param {Pointer<BSTR>} bstrHttpResponseHeaders 
     * @returns {HRESULT} 
     */
    GetAdditionalResponseHeaders(bstrHttpResponseHeaders) {
        result := ComCall(3, this, "ptr", bstrHttpResponseHeaders, "HRESULT")
        return result
    }
}
