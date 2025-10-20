#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbPlugin.ahk

/**
 * Exposes methods that prepare the environment (the computer that hosts the virtual machine).
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbplacement
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbPlacement extends ITsSbPlugin{
    /**
     * The interface identifier for ITsSbPlacement
     * @type {Guid}
     */
    static IID => Guid("{daadee5f-6d32-480e-9e36-ddab2329f06d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<ITsSbClientConnection>} pConnection 
     * @param {Pointer<ITsSbPlacementNotifySink>} pPlacementSink 
     * @returns {HRESULT} 
     */
    QueryEnvironmentForTarget(pConnection, pPlacementSink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pPlacementSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
