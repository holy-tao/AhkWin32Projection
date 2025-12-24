#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransactionResourcePool.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to get the transaction resource pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-itransactionproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITransactionProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionProperty
     * @type {Guid}
     */
    static IID => Guid("{788ea814-87b1-11d1-bba6-00c04fc2fa5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reserved1", "Reserved2", "Reserved3", "Reserved4", "Reserved5", "Reserved6", "Reserved7", "Reserved8", "Reserved9", "GetTransactionResourcePool", "Reserved10", "Reserved11", "Reserved12", "Reserved13", "Reserved14", "Reserved15", "Reserved16", "Reserved17"]

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved1() {
        ComCall(3, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved2() {
        ComCall(4, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved3() {
        ComCall(5, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved4() {
        ComCall(6, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved5() {
        ComCall(7, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved6() {
        ComCall(8, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved7() {
        ComCall(9, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved8() {
        ComCall(10, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved9() {
        ComCall(11, this)
    }

    /**
     * Retrieves the resource pool that is associated with this context's transaction.
     * @returns {ITransactionResourcePool} A reference to the transaction resource pool.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionproperty-gettransactionresourcepool
     */
    GetTransactionResourcePool() {
        result := ComCall(12, this, "ptr*", &ppTxPool := 0, "HRESULT")
        return ITransactionResourcePool(ppTxPool)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved10() {
        ComCall(13, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved11() {
        ComCall(14, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved12() {
        ComCall(15, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved13() {
        ComCall(16, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved14() {
        ComCall(17, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved15() {
        ComCall(18, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved16() {
        ComCall(19, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved17() {
        ComCall(20, this)
    }
}
