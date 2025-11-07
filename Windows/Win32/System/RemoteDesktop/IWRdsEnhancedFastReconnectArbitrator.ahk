#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes a method called by the Remote Desktop Services service to obtain the session ID that is to be reconnected to in the enhanced fast reconnect sequence.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsenhancedfastreconnectarbitrator
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsEnhancedFastReconnectArbitrator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsEnhancedFastReconnectArbitrator
     * @type {Guid}
     */
    static IID => Guid("{5718ae9b-47f2-499f-b634-d8175bd51131}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSessionForEnhancedFastReconnect"]

    /**
     * 
     * @param {Pointer<Integer>} pSessionIdArray 
     * @param {Integer} dwSessionCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsenhancedfastreconnectarbitrator-getsessionforenhancedfastreconnect
     */
    GetSessionForEnhancedFastReconnect(pSessionIdArray, dwSessionCount) {
        pSessionIdArrayMarshal := pSessionIdArray is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pSessionIdArrayMarshal, pSessionIdArray, "uint", dwSessionCount, "int*", &pResultSessionId := 0, "HRESULT")
        return pResultSessionId
    }
}
