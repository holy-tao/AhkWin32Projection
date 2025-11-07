#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include .\IMSMQTransaction.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQTransaction2 extends IMSMQTransaction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQTransaction2
     * @type {Guid}
     */
    static IID => Guid("{2ce0c5b0-6e67-11d2-b0e6-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitNew", "get_Properties"]

    /**
     * 
     * @param {VARIANT} varTransaction 
     * @returns {HRESULT} 
     */
    InitNew(varTransaction) {
        result := ComCall(10, this, "ptr", varTransaction, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(11, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }
}
