#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IDtcLuRmEnlistment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtcLuRmEnlistment
     * @type {Guid}
     */
    static IID => Guid("{4131e769-1aea-11d0-944b-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Unplug", "BackedOut", "BackOut", "Committed", "Forget", "RequestCommit"]

    /**
     * 
     * @param {BOOL} fConversationLost 
     * @returns {HRESULT} 
     */
    Unplug(fConversationLost) {
        result := ComCall(3, this, "int", fConversationLost, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BackedOut() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BackOut() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Committed() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Forget() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestCommit() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
