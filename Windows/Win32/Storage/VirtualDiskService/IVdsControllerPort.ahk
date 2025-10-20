#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a controller port.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdscontrollerport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsControllerPort extends IUnknown{
    /**
     * The interface identifier for IVdsControllerPort
     * @type {Guid}
     */
    static IID => Guid("{18691d0d-4e7f-43e8-92e4-cf44beeed11c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VDS_PORT_PROP>} pPortProp 
     * @returns {HRESULT} 
     */
    GetProperties(pPortProp) {
        result := ComCall(3, this, "ptr", pPortProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsController>} ppController 
     * @returns {HRESULT} 
     */
    GetController(ppController) {
        result := ComCall(4, this, "ptr", ppController, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryAssociatedLuns(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     */
    SetStatus(status) {
        result := ComCall(7, this, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
