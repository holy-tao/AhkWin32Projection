#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents the key to each object in the transaction resource pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjpool
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjPool extends IUnknown{
    /**
     * The interface identifier for IObjPool
     * @type {Guid}
     */
    static IID => Guid("{7d8805a0-2ea7-11d1-b1cc-00aa00ba3258}")

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
     * @param {Pointer<IUnknown>} pObj 
     * @returns {String} Nothing - always returns an empty string
     */
    PutEndTx(pObj) {
        ComCall(7, this, "ptr", pObj)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved5() {
        ComCall(8, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved6() {
        ComCall(9, this)
        return result
    }
}
