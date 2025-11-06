#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods that detect user activity in a Protected Broadcast Driver Architecture (PBDA) media graph.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_UserActivityService)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_useractivityservice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_UserActivityService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_UserActivityService
     * @type {Guid}
     */
    static IID => Guid("{53b14189-e478-4b7a-a1ff-506db4b99dfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCurrentTunerUseReason", "GetUserActivityInterval", "UserActivityDetected"]

    /**
     * 
     * @param {Integer} dwUseReason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_useractivityservice-setcurrenttunerusereason
     */
    SetCurrentTunerUseReason(dwUseReason) {
        result := ComCall(3, this, "uint", dwUseReason, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_useractivityservice-getuseractivityinterval
     */
    GetUserActivityInterval() {
        result := ComCall(4, this, "uint*", &pdwActivityInterval := 0, "HRESULT")
        return pdwActivityInterval
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_useractivityservice-useractivitydetected
     */
    UserActivityDetected() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
