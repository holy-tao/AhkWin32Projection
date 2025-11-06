#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FolderItem.ahk
#Include .\IShellLinkDual.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/ishelllinkdual2-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellLinkDual2 extends IShellLinkDual{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Target"]

    /**
     * 
     * @returns {FolderItem} 
     */
    get_Target() {
        result := ComCall(23, this, "ptr*", &ppfi := 0, "HRESULT")
        return FolderItem(ppfi)
    }
}
