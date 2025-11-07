#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRelatedItem.ahk

/**
 * Exposes methods to compare two items to see if they are the same.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iidentityname
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IIdentityName extends IRelatedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIdentityName
     * @type {Guid}
     */
    static IID => Guid("{7d903fca-d6f9-4810-8332-946c0177e247}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
