#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsDebug
     * @type {Guid}
     */
    static IID => Guid("{be0e89da-2ac5-4c04-ac5e-59956aae3613}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenVirtualProcess"]

    /**
     * 
     * @param {Integer} processId 
     * @param {Integer} runtimeJsBaseAddress 
     * @param {IJsDebugDataTarget} pDataTarget 
     * @param {Pointer<IJsDebugProcess>} ppProcess 
     * @returns {HRESULT} 
     */
    OpenVirtualProcess(processId, runtimeJsBaseAddress, pDataTarget, ppProcess) {
        result := ComCall(3, this, "uint", processId, "uint", runtimeJsBaseAddress, "ptr", pDataTarget, "ptr*", ppProcess, "HRESULT")
        return result
    }
}
