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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPaneState"]

    /**
     * Gets the visibility state of the given Windows Explorer pane.
     * @param {Pointer<Guid>} ep Type: <b>REFEXPLORERPANE</b>
     * 
     * A reference to a GUID that uniquely identifies a Windows Explorer pane. One of the following constants as defined in Shlguid.h.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_explorerpanestate">EXPLORERPANESTATE</a>*</b>
     * 
     * When this method returns, contains the visibility state of the given Windows Explorer pane as one of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_explorerpanestate">EXPLORERPANESTATE</a> constants.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorerpanevisibility-getpanestate
     */
    GetPaneState(ep) {
        result := ComCall(3, this, "ptr", ep, "uint*", &peps := 0, "HRESULT")
        return peps
    }
}
