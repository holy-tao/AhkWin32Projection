#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FolderItems.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItems2 extends FolderItems{
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
     * 
     * @param {VARIANT} vVerb 
     * @param {VARIANT} vArgs 
     * @returns {HRESULT} 
     */
    InvokeVerbEx(vVerb, vArgs) {
        result := ComCall(12, this, "ptr", vVerb, "ptr", vArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
