#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow control of folder view options specific to the Windows 7 and later views.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided with Windows as part of CLSID_ExplorerBrowser and CLSID_ShellBrowser. Third parties do not implement this interface.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * By default, the Windows 7 item view does not support custom positioning, custom ordering, or hyperlinks, which were supported in the Windows Vista list view. Use this interface when you require those features of the older view. If, at some later time, the item view adds support for those features, these options will automatically use the newer view rather than continuing to revert to the older view as they currently do.
  * 
  * 
  * 
  * Use this interface to turn off animation and scroll tip view options new to Windows 7.
  * 
  * Use this interface to retrieve the current view settings for all of those options.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ifolderviewoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderViewOptions extends IUnknown{
    /**
     * The interface identifier for IFolderViewOptions
     * @type {Guid}
     */
    static IID => Guid("{3cc974d2-b302-4d36-ad3e-06d93f695d3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} fvoMask 
     * @param {Integer} fvoFlags 
     * @returns {HRESULT} 
     */
    SetFolderViewOptions(fvoMask, fvoFlags) {
        result := ComCall(3, this, "int", fvoMask, "int", fvoFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pfvoFlags 
     * @returns {HRESULT} 
     */
    GetFolderViewOptions(pfvoFlags) {
        result := ComCall(4, this, "int*", pfvoFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
