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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetController", "QueryAssociatedLuns", "Reset", "SetStatus"]

    /**
     * 
     * @param {Pointer<VDS_PORT_PROP>} pPortProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-getproperties
     */
    GetProperties(pPortProp) {
        result := ComCall(3, this, "ptr", pPortProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsController>} ppController 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-getcontroller
     */
    GetController(ppController) {
        result := ComCall(4, this, "ptr*", ppController, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-queryassociatedluns
     */
    QueryAssociatedLuns(ppEnum) {
        result := ComCall(5, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-reset
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-setstatus
     */
    SetStatus(status) {
        result := ComCall(7, this, "int", status, "HRESULT")
        return result
    }
}
