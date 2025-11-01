#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing maintenance operations on a subsystem, controller, LUN, or drive.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsmaintenance
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsMaintenance extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsMaintenance
     * @type {Guid}
     */
    static IID => Guid("{daebeef3-8523-47ed-a2b9-05cecce2a1ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartMaintenance", "StopMaintenance", "PulseMaintenance"]

    /**
     * 
     * @param {Integer} operation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsmaintenance-startmaintenance
     */
    StartMaintenance(operation) {
        result := ComCall(3, this, "int", operation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} operation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsmaintenance-stopmaintenance
     */
    StopMaintenance(operation) {
        result := ComCall(4, this, "int", operation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} operation 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsmaintenance-pulsemaintenance
     */
    PulseMaintenance(operation, ulCount) {
        result := ComCall(5, this, "int", operation, "uint", ulCount, "HRESULT")
        return result
    }
}
