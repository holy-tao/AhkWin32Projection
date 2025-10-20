#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCWatcherEvent extends IDispatch{
    /**
     * The interface identifier for IRTCWatcherEvent
     * @type {Guid}
     */
    static IID => Guid("{f30d7261-587a-424f-822c-312788f43548}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IRTCWatcher>} ppWatcher 
     * @returns {HRESULT} 
     */
    get_Watcher(ppWatcher) {
        result := ComCall(7, this, "ptr", ppWatcher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
