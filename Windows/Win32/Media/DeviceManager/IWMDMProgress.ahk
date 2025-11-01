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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin", "Progress", "End"]

    /**
     * 
     * @param {Integer} dwEstimatedTicks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress-begin
     */
    Begin(dwEstimatedTicks) {
        result := ComCall(3, this, "uint", dwEstimatedTicks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTranspiredTicks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress-progress
     */
    Progress(dwTranspiredTicks) {
        result := ComCall(4, this, "uint", dwTranspiredTicks, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress-end
     */
    End() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
