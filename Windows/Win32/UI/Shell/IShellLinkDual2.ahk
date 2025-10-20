#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellLinkDual.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellLinkDual2 extends IShellLinkDual{
    /**
     * The interface identifier for IShellLinkDual2
     * @type {Guid}
     */
    static IID => Guid("{317ee249-f12e-11d2-b1e4-00c04f8eeb3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * 
     * @param {Pointer<FolderItem>} ppfi 
     * @returns {HRESULT} 
     */
    get_Target(ppfi) {
        result := ComCall(23, this, "ptr", ppfi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
