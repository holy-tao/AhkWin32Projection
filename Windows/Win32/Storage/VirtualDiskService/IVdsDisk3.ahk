#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_DISK_PROP2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to retrieve property information for a disk, including the disk's location path.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdisk3
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDisk3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDisk3
     * @type {Guid}
     */
    static IID => Guid("{8f4b2f5d-ec15-4357-992f-473ef10975b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties2", "QueryFreeExtents"]

    /**
     * 
     * @returns {VDS_DISK_PROP2} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk3-getproperties2
     */
    GetProperties2() {
        pDiskProperties := VDS_DISK_PROP2()
        result := ComCall(3, this, "ptr", pDiskProperties, "HRESULT")
        return pDiskProperties
    }

    /**
     * 
     * @param {Integer} ulAlign 
     * @param {Pointer<Pointer<VDS_DISK_FREE_EXTENT>>} ppFreeExtentArray 
     * @param {Pointer<Integer>} plNumberOfFreeExtents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk3-queryfreeextents
     */
    QueryFreeExtents(ulAlign, ppFreeExtentArray, plNumberOfFreeExtents) {
        ppFreeExtentArrayMarshal := ppFreeExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfFreeExtentsMarshal := plNumberOfFreeExtents is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", ulAlign, ppFreeExtentArrayMarshal, ppFreeExtentArray, plNumberOfFreeExtentsMarshal, plNumberOfFreeExtents, "HRESULT")
        return result
    }
}
