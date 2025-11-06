#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that enables an IExplorerCommand-based Shell verb handler to query the UI mode of the host component from which the application was invoked.
 * @remarks
 * 
  * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
  * A software component (either an OS component or an application) taat can launch a dual-mode application such as a browser should implement this interface. The interface should be implemented on an object that can be reached through the site chain provided to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> or the context menu and retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a> method.
  * 
  * <h3><a id="When_to_use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to use</h3>
  * Typically, an application that is capable of launching as both a desktop application and a Windows Store app app will use this interface to query which mode the host is currently in. The application can then launch in the UI mode that is compatible with the host.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexecutecommandhost
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExecuteCommandHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExecuteCommandHost
     * @type {Guid}
     */
    static IID => Guid("{4b6832a2-5f04-4c9d-b89d-727a15d103e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUIMode"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexecutecommandhost-getuimode
     */
    GetUIMode() {
        result := ComCall(3, this, "int*", &pUIMode := 0, "HRESULT")
        return pUIMode
    }
}
