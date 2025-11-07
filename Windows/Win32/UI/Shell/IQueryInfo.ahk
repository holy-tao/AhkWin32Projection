#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that the Shell uses to retrieve flags and info tip information for an item that resides in an IShellFolder implementation. Info tips are usually displayed inside a tooltip control.
 * @remarks
 * 
 * This interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> and passing IID_IQueryInfo for the interface identifier. The item for which info tip information is being requested is contained in the <i>apidl</i> argument of the <b>IShellFolder::GetUIObjectOf</b> call. If <b>IQueryInfo</b> is not supplied by the folder, the Shell will use the standard display text in the info tip.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IQueryInfo</b> to provide flags and text information that differs from the normal text that is displayed for an item in a folder. For example, if your folder contained file objects, you could use the info tip to provide the entire path and file name for the item rather than just the file name.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * In most cases, you do not use this interface directly. The Shell will use this interface when it requires additional information to display inside of an info tip. However, you can use <b>IQueryInfo</b> directly if you want to obtain info tip information from another object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-iqueryinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IQueryInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryInfo
     * @type {Guid}
     */
    static IID => Guid("{00021500-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfoTip", "GetInfoFlags"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iqueryinfo-getinfotip
     */
    GetInfoTip(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "ptr*", &ppwszTip := 0, "HRESULT")
        return ppwszTip
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iqueryinfo-getinfoflags
     */
    GetInfoFlags() {
        result := ComCall(4, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
