#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used in Windows Explorer by an IShellFolder implementation to give suggestions to the view about what panes are visible.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexplorerpanevisibility
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExplorerPaneVisibility extends IUnknown{
    /**
     * The interface identifier for IExplorerPaneVisibility
     * @type {Guid}
     */
    static IID => Guid("{e07010ec-bc17-44c0-97b0-46c7c95b9edc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} ep 
     * @param {Pointer<UInt32>} peps 
     * @returns {HRESULT} 
     */
    GetPaneState(ep, peps) {
        result := ComCall(3, this, "ptr", ep, "uint*", peps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
