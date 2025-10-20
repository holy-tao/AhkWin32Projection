#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetWatchAll extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetWatchAll
     * @type {Guid}
     */
    static IID => Guid("{0c733a73-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Acknowledge", "Start", "StopWatching"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Acknowledge() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopWatching() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
