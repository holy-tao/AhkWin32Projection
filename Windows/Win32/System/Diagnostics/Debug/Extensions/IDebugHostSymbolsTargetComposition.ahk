#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbolsTargetComposition extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostSymbolsTargetComposition
     * @type {Guid}
     */
    static IID => Guid("{3c4b6add-80e1-4c2b-afe1-9a1132586dd0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeForServiceType"]

    /**
     * 
     * @param {Pointer<IDebugServiceManager>} pServiceManager 
     * @param {Pointer<ISvcModule>} pModule 
     * @param {Pointer<ISvcSymbolType>} pType 
     * @param {Pointer<IDebugHostType>} ppHostType 
     * @returns {HRESULT} 
     */
    GetTypeForServiceType(pServiceManager, pModule, pType, ppHostType) {
        result := ComCall(3, this, "ptr", pServiceManager, "ptr", pModule, "ptr", pType, "ptr*", ppHostType, "HRESULT")
        return result
    }
}
