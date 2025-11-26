#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCWatcher.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCWatcherEvent extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Watcher"]

    /**
     * @type {IRTCWatcher} 
     */
    Watcher {
        get => this.get_Watcher()
    }

    /**
     * 
     * @returns {IRTCWatcher} 
     */
    get_Watcher() {
        result := ComCall(7, this, "ptr*", &ppWatcher := 0, "HRESULT")
        return IRTCWatcher(ppWatcher)
    }
}
