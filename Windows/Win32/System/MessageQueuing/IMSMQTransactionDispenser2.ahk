#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQTransactionDispenser2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQTransactionDispenser2
     * @type {Guid}
     */
    static IID => Guid("{eba96b11-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginTransaction", "get_Properties"]

    /**
     * 
     * @param {Pointer<IMSMQTransaction2>} ptransaction 
     * @returns {HRESULT} 
     */
    BeginTransaction(ptransaction) {
        result := ComCall(7, this, "ptr*", ptransaction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(8, this, "ptr*", ppcolProperties, "HRESULT")
        return result
    }
}
