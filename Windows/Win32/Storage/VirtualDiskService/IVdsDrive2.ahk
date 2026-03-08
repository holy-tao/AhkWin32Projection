#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_DRIVE_PROP2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVdsDrive2 (vdshwprv.h) interface provides a method for querying the properties of a drive.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsdrive2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDrive2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDrive2
     * @type {Guid}
     */
    static IID => Guid("{60b5a730-addf-4436-8ca7-5769e2d1ffa4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties2"]

    /**
     * The IVdsDrive2::GetProperties2 (vdshwprv.h) method returns the properties of a drive object.
     * @remarks
     * This method must return zero (S_OK) to indicate success, or an implementation-specific nonzero error code to indicate failure.
     * @returns {VDS_DRIVE_PROP2} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_prop2">VDS_DRIVE_PROP2</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszFriendlyName</b> and <b>pwszIdentification</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsdrive2-getproperties2
     */
    GetProperties2() {
        pDriveProp2 := VDS_DRIVE_PROP2()
        result := ComCall(3, this, "ptr", pDriveProp2, "HRESULT")
        return pDriveProp2
    }
}
