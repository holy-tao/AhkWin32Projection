#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsAggregator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsAggregator
     * @type {Guid}
     */
    static IID => Guid("{52db5fb0-941f-11d0-8529-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectAsAggregator", "DisconnectAsAggregator"]

    /**
     * 
     * @param {IUnknown} pAggregatee 
     * @returns {HRESULT} 
     */
    ConnectAsAggregator(pAggregatee) {
        result := ComCall(3, this, "ptr", pAggregatee, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectAsAggregator() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
