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
     * 
     * @param {Integer} lNewNumberOfEntries 
     * @returns {HRESULT} 
     */
    NewNumberOfEntries(lNewNumberOfEntries) {
        result := ComCall(3, this, "int", lNewNumberOfEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
