#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetCfgClassSetup.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgClassSetup2 extends INetCfgClassSetup{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgClassSetup2
     * @type {Guid}
     */
    static IID => Guid("{c0e8aea0-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateNonEnumeratedComponent"]

    /**
     * 
     * @param {INetCfgComponent} pIComp 
     * @returns {HRESULT} 
     */
    UpdateNonEnumeratedComponent(pIComp) {
        static dwSetupFlags := 0, dwUpgradeFromBuildNo := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "ptr", pIComp, "uint", dwSetupFlags, "uint", dwUpgradeFromBuildNo, "HRESULT")
        return result
    }
}
