#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on an iSCSI LUN.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsluniscsi
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunIscsi extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssociateTargets", "QueryAssociatedTargets"]

    /**
     * 
     * @param {Pointer<Guid>} pTargetIdArray 
     * @param {Integer} lNumberOfTargets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsluniscsi-associatetargets
     */
    AssociateTargets(pTargetIdArray, lNumberOfTargets) {
        result := ComCall(3, this, "ptr", pTargetIdArray, "int", lNumberOfTargets, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsluniscsi-queryassociatedtargets
     */
    QueryAssociatedTargets() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }
}
