#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FolderItems.ahk" { FolderItems }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Extends the FolderItems object. It supports one additional method.
 * @see https://learn.microsoft.com/windows/win32/shell/folderitems2-object
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FolderItems2 extends FolderItems {
    /**
     * The interface identifier for FolderItems2
     * @type {Guid}
     */
    static IID := Guid("{c94f0ad0-f363-11d2-a327-00c04f8eec7f}")

    /**
     * The class identifier for FolderItems2
     * @type {Guid}
     */
    static CLSID := Guid("{c94f0ad0-f363-11d2-a327-00c04f8eec7f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for FolderItems2 interfaces
    */
    struct Vtbl extends FolderItems.Vtbl {
        InvokeVerbEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := FolderItems2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(12, this, VARIANT, vVerb, VARIANT, vArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (FolderItems2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InvokeVerbEx := CallbackCreate(GetMethod(implObj, "InvokeVerbEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InvokeVerbEx)
    }
}
