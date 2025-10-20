#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FolderItems.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/folderitems2-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItems2 extends FolderItems{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for FolderItems2
     * @type {Guid}
     */
    static IID => Guid("{c94f0ad0-f363-11d2-a327-00c04f8eec7f}")

    /**
     * The class identifier for FolderItems2
     * @type {Guid}
     */
    static CLSID => Guid("{c94f0ad0-f363-11d2-a327-00c04f8eec7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvokeVerbEx"]

    /**
     * 
     * @param {VARIANT} vVerb 
     * @param {VARIANT} vArgs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitems2-invokeverbex
     */
    InvokeVerbEx(vVerb, vArgs) {
        result := ComCall(12, this, "ptr", vVerb, "ptr", vArgs, "HRESULT")
        return result
    }
}
