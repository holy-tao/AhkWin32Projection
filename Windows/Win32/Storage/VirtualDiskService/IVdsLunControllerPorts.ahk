#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing controller port configuration operations on a LUN.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsluncontrollerports
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunControllerPorts extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLunControllerPorts
     * @type {Guid}
     */
    static IID => Guid("{451fe266-da6d-406a-bb60-82e534f85aeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssociateControllerPorts", "QueryActiveControllerPorts"]

    /**
     * 
     * @param {Pointer<Guid>} pActiveControllerPortIdArray 
     * @param {Integer} lNumberOfActiveControllerPorts 
     * @param {Pointer<Guid>} pInactiveControllerPortIdArray 
     * @param {Integer} lNumberOfInactiveControllerPorts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsluncontrollerports-associatecontrollerports
     */
    AssociateControllerPorts(pActiveControllerPortIdArray, lNumberOfActiveControllerPorts, pInactiveControllerPortIdArray, lNumberOfInactiveControllerPorts) {
        result := ComCall(3, this, "ptr", pActiveControllerPortIdArray, "int", lNumberOfActiveControllerPorts, "ptr", pInactiveControllerPortIdArray, "int", lNumberOfInactiveControllerPorts, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsluncontrollerports-queryactivecontrollerports
     */
    QueryActiveControllerPorts() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }
}
