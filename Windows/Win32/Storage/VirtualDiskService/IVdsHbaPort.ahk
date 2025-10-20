#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and interact with HBA ports on the local system.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdshbaport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHbaPort extends IUnknown{
    /**
     * The interface identifier for IVdsHbaPort
     * @type {Guid}
     */
    static IID => Guid("{2abd757f-2851-4997-9a13-47d2a885d6ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VDS_HBAPORT_PROP>} pHbaPortProp 
     * @returns {HRESULT} 
     */
    GetProperties(pHbaPortProp) {
        result := ComCall(3, this, "ptr", pHbaPortProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     */
    SetAllPathStatuses(status) {
        result := ComCall(4, this, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
