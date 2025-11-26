#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides functionality to determine whether the display is showing Windows Store apps.
 * @remarks
 * 
 * Use the <b>IAppVisibility</b> interface to determine when a display is showing Windows Store apps. This is useful for accessibility tools and other applications.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iappvisibility-islaunchervisible">IsLauncherVisible</a>  method to determine when  the Start screen is visible.
 * 
 * Don't implement the <b>IAppVisibility</b> interface. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function with <b>CLSID_AppVisibility</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iappvisibility
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAppVisibility extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppVisibility
     * @type {Guid}
     */
    static IID => Guid("{2246ea2d-caea-4444-a3c4-6de827e44313}")

    /**
     * The class identifier for AppVisibility
     * @type {Guid}
     */
    static CLSID => Guid("{7e5fe3d9-985f-4908-91f9-ee19f9fd1514}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppVisibilityOnMonitor", "IsLauncherVisible", "Advise", "Unadvise"]

    /**
     * Queries the current mode of the specified monitor.
     * @param {HMONITOR} hMonitor The monitor to query.
     * @returns {Integer} The current mode of <i>hMonitor</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iappvisibility-getappvisibilityonmonitor
     */
    GetAppVisibilityOnMonitor(hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(3, this, "ptr", hMonitor, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * Gets a value that indicates whether the Start screen is displayed.
     * @returns {BOOL} <b>TRUE</b> if the Start screen is displayed; otherwise, <b>FALSE.</b>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iappvisibility-islaunchervisible
     */
    IsLauncherVisible() {
        result := ComCall(4, this, "int*", &pfVisible := 0, "HRESULT")
        return pfVisible
    }

    /**
     * Registers an advise sink object to receive notification of changes to the display.
     * @param {IAppVisibilityEvents} pCallback The client's advise sink that receives outgoing calls from the connection point.
     * @returns {Integer} A token that uniquely identifies this connection. Use this token to delete the connection by passing it to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iappvisibility-unadvise">Unadvise</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iappvisibility-advise
     */
    Advise(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Cancels a connection that was previously established by using Advise.
     * @param {Integer} dwCookie A token that uniquely identifies the connection to cancel, which is provided by a previous call to to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iappvisibility-advise">Advise</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iappvisibility-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
