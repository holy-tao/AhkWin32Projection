#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to retrieve property information for a disk, including the disk's location path.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdisk3
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDisk3 extends IUnknown{
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
     * 
     * @param {Pointer<VDS_DISK_PROP2>} pDiskProperties 
     * @returns {HRESULT} 
     */
    GetProperties2(pDiskProperties) {
        result := ComCall(3, this, "ptr", pDiskProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAlign 
     * @param {Pointer<VDS_DISK_FREE_EXTENT>} ppFreeExtentArray 
     * @param {Pointer<Int32>} plNumberOfFreeExtents 
     * @returns {HRESULT} 
     */
    QueryFreeExtents(ulAlign, ppFreeExtentArray, plNumberOfFreeExtents) {
        result := ComCall(4, this, "uint", ulAlign, "ptr", ppFreeExtentArray, "int*", plNumberOfFreeExtents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
