#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing controller port configuration operations on a LUN.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsluncontrollerports
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunControllerPorts extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} pActiveControllerPortIdArray 
     * @param {Integer} lNumberOfActiveControllerPorts 
     * @param {Pointer<Guid>} pInactiveControllerPortIdArray 
     * @param {Integer} lNumberOfInactiveControllerPorts 
     * @returns {HRESULT} 
     */
    AssociateControllerPorts(pActiveControllerPortIdArray, lNumberOfActiveControllerPorts, pInactiveControllerPortIdArray, lNumberOfInactiveControllerPorts) {
        result := ComCall(3, this, "ptr", pActiveControllerPortIdArray, "int", lNumberOfActiveControllerPorts, "ptr", pInactiveControllerPortIdArray, "int", lNumberOfInactiveControllerPorts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryActiveControllerPorts(ppEnum) {
        result := ComCall(4, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
