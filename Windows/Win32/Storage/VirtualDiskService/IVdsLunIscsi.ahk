#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on an iSCSI LUN.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsluniscsi
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunIscsi extends IUnknown{
    /**
     * The interface identifier for IVdsLunIscsi
     * @type {Guid}
     */
    static IID => Guid("{0d7c1e64-b59b-45ae-b86a-2c2cc6a42067}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pTargetIdArray 
     * @param {Integer} lNumberOfTargets 
     * @returns {HRESULT} 
     */
    AssociateTargets(pTargetIdArray, lNumberOfTargets) {
        result := ComCall(3, this, "ptr", pTargetIdArray, "int", lNumberOfTargets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryAssociatedTargets(ppEnum) {
        result := ComCall(4, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
