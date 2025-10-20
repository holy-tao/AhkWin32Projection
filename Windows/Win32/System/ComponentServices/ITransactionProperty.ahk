#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to get the transaction resource pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-itransactionproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITransactionProperty extends IUnknown{
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
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved1() {
        ComCall(3, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved2() {
        ComCall(4, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved3() {
        ComCall(5, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved4() {
        ComCall(6, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved5() {
        ComCall(7, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved6() {
        ComCall(8, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved7() {
        ComCall(9, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved8() {
        ComCall(10, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved9() {
        ComCall(11, this)
        return result
    }

    /**
     * 
     * @param {Pointer<ITransactionResourcePool>} ppTxPool 
     * @returns {HRESULT} 
     */
    GetTransactionResourcePool(ppTxPool) {
        result := ComCall(12, this, "ptr", ppTxPool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved10() {
        ComCall(13, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved11() {
        ComCall(14, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved12() {
        ComCall(15, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved13() {
        ComCall(16, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved14() {
        ComCall(17, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved15() {
        ComCall(18, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved16() {
        ComCall(19, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved17() {
        ComCall(20, this)
        return result
    }
}
