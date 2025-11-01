#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITaskbarList3.ahk

/**
 * Extends ITaskbarList3 by providing a method that allows the caller to control two property values for the tab thumbnail and peek feature.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist">ITaskbarList</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist2">ITaskbarList2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist3">ITaskbarList3</a> interfaces, from which it inherits.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided in Windows as CLSID_TaskbarList. This interface is not implemented by third parties.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided in Windows as CLSID_TaskbarList. This interface is not implemented by third parties.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Use the methods of this interface for the following:
  *                 
  * 
  * <ul>
  * <li>To use the thumbnail image of the application frame window in place of the tab thumbnail in some circumstances.</li>
  * <li>To use the application frame window in place of the tab as the source of the tab's peek image (a full-screen view of the window in response to a mouse-over event in the thumbnail).</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itaskbarlist4
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITaskbarList4 extends ITaskbarList3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskbarList4
     * @type {Guid}
     */
    static IID => Guid("{c43dc798-95d1-4bea-9030-bb99e2983a1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTabProperties"]

    /**
     * 
     * @param {HWND} hwndTab 
     * @param {Integer} stpFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist4-settabproperties
     */
    SetTabProperties(hwndTab, stpFlags) {
        hwndTab := hwndTab is Win32Handle ? NumGet(hwndTab, "ptr") : hwndTab

        result := ComCall(21, this, "ptr", hwndTab, "int", stpFlags, "HRESULT")
        return result
    }
}
