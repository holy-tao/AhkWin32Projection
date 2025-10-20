#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISIInbandEPG extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    StartSIEPGScan() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopSIEPGScan() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} bRunning 
     * @returns {HRESULT} 
     */
    IsSIEPGScanRunning(bRunning) {
        result := ComCall(5, this, "ptr", bRunning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
