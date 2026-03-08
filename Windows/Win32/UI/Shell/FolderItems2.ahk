#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FolderItems.ahk

/**
 * Extends the FolderItems object. It supports one additional method.
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
     * Executes a verb on a collection of FolderItem objects. This method is an extension of the InvokeVerb method, allowing additional control of the operation through a set of flags.
     * @remarks
     * A verb is a string used to specify a particular action associated with an item or collection of items. Typically, calling a verb launches a related application. For example, calling the **open** verb on a .txt file normally opens the file with a text editor, usually Microsoft Notepad. For further discussion of verbs, see [Launching Applications](launch.md).
     * @param {VARIANT} vVerb Type: **Variant**
     * 
     * A **Variant** with the verb string that corresponds to the command to be executed. If no verb is specified, the default verb is executed.
     * @param {VARIANT} vArgs Type: **Variant**
     * 
     * A **Variant** that consists of a string with one or more arguments to the command specified by *vVerb*. The format of this string depends on the particular verb.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitems2-invokeverbex
     */
    InvokeVerbEx(vVerb, vArgs) {
        result := ComCall(12, this, "ptr", vVerb, "ptr", vArgs, "HRESULT")
        return result
    }
}
