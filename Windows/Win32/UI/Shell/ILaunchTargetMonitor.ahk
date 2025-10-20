#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ilaunchtargetmonitor
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ILaunchTargetMonitor extends IUnknown{
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
     * 
     * @param {Pointer<HMONITOR>} monitor 
     * @returns {HRESULT} 
     */
    GetMonitor(monitor) {
        result := ComCall(3, this, "ptr", monitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
