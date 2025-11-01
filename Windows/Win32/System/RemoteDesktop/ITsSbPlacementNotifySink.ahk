#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbBaseNotifySink.ahk

/**
 * Exposes methods that return information about environments to Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbplacementnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbPlacementNotifySink extends ITsSbBaseNotifySink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbPlacementNotifySink
     * @type {Guid}
     */
    static IID => Guid("{68a0c487-2b4f-46c2-94a1-6ce685183634}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnQueryEnvironmentCompleted"]

    /**
     * 
     * @param {ITsSbEnvironment} pEnvironment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbplacementnotifysink-onqueryenvironmentcompleted
     */
    OnQueryEnvironmentCompleted(pEnvironment) {
        result := ComCall(5, this, "ptr", pEnvironment, "HRESULT")
        return result
    }
}
