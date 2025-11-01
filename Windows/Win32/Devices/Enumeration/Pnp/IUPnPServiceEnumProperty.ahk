#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to delay Service Control Protocol Description (SCPD) download and event subscription on the IUPnPService objects enumerated from the IUPnPServices object.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpserviceenumproperty
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPServiceEnumProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPServiceEnumProperty
     * @type {Guid}
     */
    static IID => Guid("{38873b37-91bb-49f4-b249-2e8efbb8a816}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetServiceEnumProperty"]

    /**
     * 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceenumproperty-setserviceenumproperty
     */
    SetServiceEnumProperty(dwMask) {
        result := ComCall(3, this, "uint", dwMask, "HRESULT")
        return result
    }
}
