#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The optional, application-implemented IWMDMProgress allows an application to track the progress of operations, such as formatting media or file transfers.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmprogress
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMProgress extends IUnknown{
    /**
     * The interface identifier for IWMDMProgress
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a0c-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwEstimatedTicks 
     * @returns {HRESULT} 
     */
    Begin(dwEstimatedTicks) {
        result := ComCall(3, this, "uint", dwEstimatedTicks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTranspiredTicks 
     * @returns {HRESULT} 
     */
    Progress(dwTranspiredTicks) {
        result := ComCall(4, this, "uint", dwTranspiredTicks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    End() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
