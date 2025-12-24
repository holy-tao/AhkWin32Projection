#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPublishedApp.ahk

/**
 * Extends the IPublishedApp interface by providing an additional installation method.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ipublishedapp">IPublishedApp</a> interface, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nn-shappmgr-ipublishedapp2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPublishedApp2 extends IPublishedApp{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPublishedApp2
     * @type {Guid}
     */
    static IID => Guid("{12b81347-1b3a-4a04-aa61-3f768b67fd7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Install2"]

    /**
     * Installs an application published by an application publisher, while preventing multiple windows from being active on the same thread.
     * @param {Pointer<SYSTEMTIME>} pstInstall Type: <b>LPSYSTEMTIME</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * A handle to the parent window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ipublishedapp2-install2
     */
    Install2(pstInstall, hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(11, this, "ptr", pstInstall, "ptr", hwndParent, "HRESULT")
        return result
    }
}
