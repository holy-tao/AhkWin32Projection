#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQTransaction2.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQTransaction3 extends IMSMQTransaction2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQTransaction3
     * @type {Guid}
     */
    static IID => Guid("{eba96b13-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ITransaction"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvarITransaction 
     * @returns {HRESULT} 
     */
    get_ITransaction(pvarITransaction) {
        result := ComCall(12, this, "ptr", pvarITransaction, "HRESULT")
        return result
    }
}
