#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that obtains an icon index for an IShellFolder object.
 * @remarks
 * Implement <b>IShellIcon</b> when creating an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> implementation to provide a quick way to obtain the icon for an object in the folder.
 *       
 * 
 * If <b>IShellIcon</b> is not implemented by an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> is used to retrieve an icon for all objects.
 *       
 * 
 * Use <b>IShellIcon</b> when retrieving the icon index for an item in a Shell folder.
 *       
 * 
 * <b>IShellIcon</b> allows an application to obtain the icon for any object within a folder by using only one instance of the interface. <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iextracticona">IExtractIcon</a>, on the other hand, requires that a separate instance of the interface be created for each object.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ishellicon
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellIcon extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellIcon
     * @type {Guid}
     */
    static IID => Guid("{000214e5-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIconOf"]

    /**
     * Gets an icon for an object inside a specific folder.
     * @remarks
     * If you are unable to retrieve an icon for this object using <b>GetIconOf</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">GetUIObjectOf</a> method to retrieve an object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-extract">Extract</a> method.
     * 
     * <b>IShellIcon::GetIconOf</b> fails if <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> is not called first.
     * 
     * <h3><a id="Note_to_Calling_Applications"></a><a id="note_to_calling_applications"></a><a id="NOTE_TO_CALLING_APPLICATIONS"></a>Note to Calling Applications</h3>
     * The index returned is from the system image list.
     * 
     * <h3><a id="Note_to_Implementers"></a><a id="note_to_implementers"></a><a id="NOTE_TO_IMPLEMENTERS"></a>Note to Implementers</h3>
     * If the icon index used is not one of the standard images listed, it is the implementer's responsibility to add the image to the system image list and then place the index into the <i>lpIconIndex</i> parameter. To prevent the system image list from growing too large, each image should only be added once.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure that specifies the relative location of the folder.
     * @param {Integer} flags Type: <b>UINT</b>
     * @returns {Integer} Type: <b>LPINT</b>
     * 
     * The address of the index of the icon in the system image list. The following standard image list indexes can be returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellicon-geticonof
     */
    GetIconOf(pidl, flags) {
        result := ComCall(3, this, "ptr", pidl, "uint", flags, "int*", &pIconIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIconIndex
    }
}
