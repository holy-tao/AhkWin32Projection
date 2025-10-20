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
     * 
     * @param {Integer} dwUseReason 
     * @returns {HRESULT} 
     */
    SetCurrentTunerUseReason(dwUseReason) {
        result := ComCall(3, this, "uint", dwUseReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwActivityInterval 
     * @returns {HRESULT} 
     */
    GetUserActivityInterval(pdwActivityInterval) {
        result := ComCall(4, this, "uint*", pdwActivityInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UserActivityDetected() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
