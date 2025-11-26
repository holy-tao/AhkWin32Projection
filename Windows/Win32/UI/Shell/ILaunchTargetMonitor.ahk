#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HMONITOR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ilaunchtargetmonitor
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ILaunchTargetMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILaunchTargetMonitor
     * @type {Guid}
     */
    static IID => Guid("{266fbc7e-490d-46ed-a96b-2274db252003}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMonitor"]

    /**
     * Retrieves the target monitor for the application being launched.
     * @returns {HMONITOR} Type: <b>HMONITOR*</b>
     * 
     * Contains the address of a pointer to the target  monitor's handle.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ilaunchtargetmonitor-getmonitor
     */
    GetMonitor() {
        monitor := HMONITOR()
        result := ComCall(3, this, "ptr", monitor, "HRESULT")
        return monitor
    }
}
