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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryEnvironmentForTarget"]

    /**
     * Determines whether the specified environment is ready to host the target that was returned by load balancing.
     * @param {ITsSbClientConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbclientconnection">ITsSbClientConnection</a> client connection object.
     * @param {ITsSbPlacementNotifySink} pPlacementSink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbplacementnotifysink">ITsSbPlacementNotifySink</a> placement sink object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbplacement-queryenvironmentfortarget
     */
    QueryEnvironmentForTarget(pConnection, pPlacementSink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pPlacementSink, "HRESULT")
        return result
    }
}
