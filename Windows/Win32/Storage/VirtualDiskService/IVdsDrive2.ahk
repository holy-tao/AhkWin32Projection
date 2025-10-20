#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method for querying the properties of a drive.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdrive2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDrive2 extends IUnknown{
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
     * 
     * @param {Pointer<VDS_DRIVE_PROP2>} pDriveProp2 
     * @returns {HRESULT} 
     */
    GetProperties2(pDriveProp2) {
        result := ComCall(3, this, "ptr", pDriveProp2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
