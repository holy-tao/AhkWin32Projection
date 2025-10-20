#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFHDCPStatus extends IUnknown{
    /**
     * The interface identifier for IMFHDCPStatus
     * @type {Guid}
     */
    static IID => Guid("{de400f54-5bf1-40cf-8964-0bea136b1e3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @param {Pointer<BOOL>} pfStatus 
     * @returns {HRESULT} 
     */
    Query(pStatus, pfStatus) {
        result := ComCall(3, this, "int*", pStatus, "ptr", pfStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     */
    Set(status) {
        result := ComCall(4, this, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
