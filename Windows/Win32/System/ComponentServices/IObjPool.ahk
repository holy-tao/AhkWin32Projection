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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reserved1", "Reserved2", "Reserved3", "Reserved4", "PutEndTx", "Reserved5", "Reserved6"]

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
     * Destroys the pooled object when the transaction ends.
     * @param {IUnknown} pObj A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the pooled object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjpool-putendtx
     */
    PutEndTx(pObj) {
        ComCall(7, this, "ptr", pObj)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved5() {
        ComCall(8, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved6() {
        ComCall(9, this)
    }
}
