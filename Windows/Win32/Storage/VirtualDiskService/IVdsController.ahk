#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a controller.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdscontroller
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsController extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsController
     * @type {Guid}
     */
    static IID => Guid("{cb53d96e-dffb-474a-a078-790d1e2bc082}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetSubSystem", "GetPortProperties", "FlushCache", "InvalidateCache", "Reset", "QueryAssociatedLuns", "SetStatus"]

    /**
     * 
     * @param {Pointer<VDS_CONTROLLER_PROP>} pControllerProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontroller-getproperties
     */
    GetProperties(pControllerProp) {
        result := ComCall(3, this, "ptr", pControllerProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsSubSystem>} ppSubSystem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontroller-getsubsystem
     */
    GetSubSystem(ppSubSystem) {
        result := ComCall(4, this, "ptr*", ppSubSystem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sPortNumber 
     * @param {Pointer<VDS_PORT_PROP>} pPortProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontroller-getportproperties
     */
    GetPortProperties(sPortNumber, pPortProp) {
        result := ComCall(5, this, "short", sPortNumber, "ptr", pPortProp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontroller-flushcache
     */
    FlushCache() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontroller-invalidatecache
     */
    InvalidateCache() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontroller-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontroller-queryassociatedluns
     */
    QueryAssociatedLuns(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontroller-setstatus
     */
    SetStatus(status) {
        result := ComCall(10, this, "int", status, "HRESULT")
        return result
    }
}
