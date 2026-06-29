#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRelatedItem.ahk" { IRelatedItem }

/**
 * Exposes methods to compare two items to see if they are the same.
 * @remarks
 * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
 * 
 * Shell data sources that present items in virtual locations, such as search results, typically implement this interface as a handler to discover the actual location of an item—to find a folder that contains a file. For example, this interface is used to implement the <b>Open File Location</b> command in Windows Explorer. When the user right-clicks on a file in a set of search results, for example, and then selects <b>Open File Location</b>, the command uses <b>IIdentityName</b> to get the true item and opens a browser on its parent (the file folder) instead of opening the parent of the item (which is where the user already is).
 * 
 * Several controls (the <b>Start</b> button on the taskbar, and the namespace control) use <b>IIdentityName</b> to get the original item and thus avoid duplicate items.
 * 
 * This interface is helpful with aliased ID lists (type <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>), as can be demonstrated using the following two lists.
 *                 
 * 
 * <ol>
 * <li>[computer][c:][users][pat][desktop][myfile.txt]. This is a file in the user's desktop and is handled by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> implementation in Windows Vista that handles file systems.</li>
 * <li>[desktop][myfile.txt]. The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> implementation behind the desktop shows files from the user's desktop, all of the user's desktop, and some special items like the <b>Recycle Bin</b>. When asked to bind through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> using IID IID_IIdentityName, this <b>IShellFolder</b> returns the underlying item, which is the file folder item just above.</li>
 * </ol>
 * <div class="alert"><b>Note</b>  To get an instance of this handler use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> with <c>IID_IIdentityItem</code> or use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler">IShellItem::BindToHandler</a> with <code>BHID_SFObject</c>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iidentityname
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IIdentityName extends IRelatedItem {
    /**
     * The interface identifier for IIdentityName
     * @type {Guid}
     */
    static IID := Guid("{7d903fca-d6f9-4810-8332-946c0177e247}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIdentityName interfaces
    */
    struct Vtbl extends IRelatedItem.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIdentityName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IIdentityName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
