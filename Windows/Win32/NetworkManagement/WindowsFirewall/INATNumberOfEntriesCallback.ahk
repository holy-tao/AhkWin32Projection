#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INATNumberOfEntriesCallback interface provides a method that the system calls if the number of port mappings changes.
 * @see https://docs.microsoft.com/windows/win32/api//natupnp/nn-natupnp-inatnumberofentriescallback
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INATNumberOfEntriesCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INATNumberOfEntriesCallback
     * @type {Guid}
     */
    static IID => Guid("{c83a0a74-91ee-41b6-b67a-67e0f00bbd78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NewNumberOfEntries"]

    /**
     * 
     * @param {Integer} lNewNumberOfEntries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-inatnumberofentriescallback-newnumberofentries
     */
    NewNumberOfEntries(lNewNumberOfEntries) {
        result := ComCall(3, this, "int", lNewNumberOfEntries, "HRESULT")
        return result
    }
}
