#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPServiceCallback interface is used to send event notifications to clients of Service objects.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpservicecallback
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPServiceCallback extends IUnknown{
    /**
     * The interface identifier for IUPnPServiceCallback
     * @type {Guid}
     */
    static IID => Guid("{31fadca9-ab73-464b-b67d-5c1d0f83c8b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUPnPService>} pus 
     * @param {PWSTR} pcwszStateVarName 
     * @param {VARIANT} vaValue 
     * @returns {HRESULT} 
     */
    StateVariableChanged(pus, pcwszStateVarName, vaValue) {
        pcwszStateVarName := pcwszStateVarName is String ? StrPtr(pcwszStateVarName) : pcwszStateVarName

        result := ComCall(3, this, "ptr", pus, "ptr", pcwszStateVarName, "ptr", vaValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUPnPService>} pus 
     * @returns {HRESULT} 
     */
    ServiceInstanceDied(pus) {
        result := ComCall(4, this, "ptr", pus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
