#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMTaskInfoEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMTaskInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{0630b0f8-0bbc-4821-be74-c7995166ed2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Next"]

    /**
     * 
     * @param {Pointer<IPMTaskInfo>} ppTaskInfo 
     * @returns {HRESULT} 
     */
    get_Next(ppTaskInfo) {
        result := ComCall(3, this, "ptr*", ppTaskInfo, "HRESULT")
        return result
    }
}
