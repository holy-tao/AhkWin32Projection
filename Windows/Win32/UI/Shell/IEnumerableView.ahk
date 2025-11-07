#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumIDList.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate the contents of a view and receive notification from callback upon enumeration completion. This interface enables clients of a view to attempt to share the view's list of folder contents.
 * @remarks
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderview">IFolderView</a> (a folder view) supports presentation of the contents of a folder, and exposes the <b>IEnumerableView</b> through <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">QueryService</a> on service request SID_EnumerableView. <b>IEnumerableView</b> offers enhanced performance compared to obtaining the contents of the folder directly from the folder using <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumidlist">IEnumIDList</a> (call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> to return this interface). Since the view asked for the contents of the folder in order to display those contents, using <b>IEnumerableView</b> enables a client to get a copy of the work already done by <b>IFolderView</b>.
 * 
 * Typicallly, this enumeration service is compatible with most folders, and is only provided if it is safe to enumerate the contents of the view.  For example, using this service with a folder containing search results is not supported.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ienumerableview
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumerableView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumerableView
     * @type {Guid}
     */
    static IID => Guid("{8c8bf236-1aec-495f-9894-91d57c3c686f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEnumReadyCallback", "CreateEnumIDListFromContents"]

    /**
     * 
     * @param {IEnumReadyCallback} percb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ienumerableview-setenumreadycallback
     */
    SetEnumReadyCallback(percb) {
        result := ComCall(3, this, "ptr", percb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @param {Integer} dwEnumFlags 
     * @returns {IEnumIDList} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ienumerableview-createenumidlistfromcontents
     */
    CreateEnumIDListFromContents(pidlFolder, dwEnumFlags) {
        result := ComCall(4, this, "ptr", pidlFolder, "uint", dwEnumFlags, "ptr*", &ppEnumIDList := 0, "HRESULT")
        return IEnumIDList(ppEnumIDList)
    }
}
