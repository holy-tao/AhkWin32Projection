#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMBackgroundServiceAgentInfoEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMBackgroundServiceAgentInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{18eb2072-ab56-43b3-872c-beafb7a6b391}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Next"]

    /**
     * 
     * @param {Pointer<IPMBackgroundServiceAgentInfo>} ppBSAInfo 
     * @returns {HRESULT} 
     */
    get_Next(ppBSAInfo) {
        result := ComCall(3, this, "ptr*", ppBSAInfo, "HRESULT")
        return result
    }
}
