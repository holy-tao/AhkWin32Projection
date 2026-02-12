#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVdsLunNumber interface (vds.h) provides a method to query the LUN number for a LUN.
 * @see https://learn.microsoft.com/windows/win32/api//content/vds/nn-vds-ivdslunnumber
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunNumber extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLunNumber
     * @type {Guid}
     */
    static IID => Guid("{d3f95e46-54b3-41f9-b678-0f1871443a08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLunNumber"]

    /**
     * The IVdsLunNumber::GetLunNumber method (vds.h) retrieves the LUN number for a LUN.
     * @remarks
     * This method returns the LUN number that the VDS hardware provider assigned to the LUN. This number identifies the LUN  within the disk array.  It is not the same as the "Logical Unit Number" in the disk's SCSI address. Each LUN in the disk array is assigned exactly one LUN number.
     * 
     * This method exists because the DiskRAID utility assigns its own index to each LUN when it enumerates the LUNs in a subsystem. But these indexes can change each time DiskRAID is run, if the hardware provider enumerates the LUNs in a different order. This can be confusing to end users. For disk arrays that have their own (provider-assigned) LUN numbers, this method gives the caller the ability to map the LUN numbers to the LUN indexes that are assigned by DiskRAID.
     * 
     * If a subsystem supports LUN numbering, it can indicate this support by setting the <b>VDS_SF_SUPPORTS_LUN_NUMBER</b> flag in the <b>ulFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop2">VDS_SUB_SYSTEM_PROP2</a> structure. For more information about this flag, see the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration.
     * @returns {Integer} The address of a  variable that receives the LUN number. This value is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdslunnumber-getlunnumber
     */
    GetLunNumber() {
        result := ComCall(3, this, "uint*", &pulLunNumber := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulLunNumber
    }
}
