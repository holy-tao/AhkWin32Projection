#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IConsolePowerSink interface monitors and responds to power management messages.
 * @remarks
 * 
  * To receive power management notifications, your snap-in must use the <a href="https://docs.microsoft.com/previous-versions/26k10xyy(v=vs.140)">AtlAdvise</a> function to associate an instance of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsolepower">IConsolePower</a> interface with your implementation of the 
  * <b>IConsolePowerSink</b> interface. The following code example shows how to use the <a href="https://docs.microsoft.com/previous-versions/26k10xyy(v=vs.140)">AtlAdvise</a> function.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsolepowersink
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsolePowerSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsolePowerSink
     * @type {Guid}
     */
    static IID => Guid("{3333759f-fe4f-4975-b143-fec0a5dd6d65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPowerBroadcast"]

    /**
     * 
     * @param {Integer} nEvent 
     * @param {LPARAM} lParam 
     * @param {Pointer<LRESULT>} plReturn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolepowersink-onpowerbroadcast
     */
    OnPowerBroadcast(nEvent, lParam, plReturn) {
        result := ComCall(3, this, "uint", nEvent, "ptr", lParam, "ptr", plReturn, "HRESULT")
        return result
    }
}
