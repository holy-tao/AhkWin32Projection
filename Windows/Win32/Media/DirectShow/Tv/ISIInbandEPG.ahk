#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISIInbandEPG extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISIInbandEPG
     * @type {Guid}
     */
    static IID => Guid("{f90ad9d0-b854-4b68-9cc1-b2cc96119d85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartSIEPGScan", "StopSIEPGScan", "IsSIEPGScanRunning"]

    /**
     * 
     * @returns {HRESULT} 
     */
    StartSIEPGScan() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopSIEPGScan() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} bRunning 
     * @returns {HRESULT} 
     */
    IsSIEPGScanRunning(bRunning) {
        result := ComCall(5, this, "ptr", bRunning, "HRESULT")
        return result
    }
}
