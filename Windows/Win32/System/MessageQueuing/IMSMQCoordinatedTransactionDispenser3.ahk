#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQTransaction3.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQCoordinatedTransactionDispenser3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQCoordinatedTransactionDispenser3
     * @type {Guid}
     */
    static IID => Guid("{eba96b14-2168-11d3-898c-00e02c074f6b}")

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
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {IMSMQTransaction3} 
     */
    BeginTransaction() {
        result := ComCall(7, this, "ptr*", &ptransaction := 0, "HRESULT")
        return IMSMQTransaction3(ptransaction)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(8, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }
}
