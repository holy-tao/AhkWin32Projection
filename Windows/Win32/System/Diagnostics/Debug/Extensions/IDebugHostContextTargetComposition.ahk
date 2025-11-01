#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostContextTargetComposition extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostContextTargetComposition
     * @type {Guid}
     */
    static IID => Guid("{3d06878f-97ab-4c5b-955e-fa647d3b137c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetServiceManager", "GetServiceProcess", "GetServiceThread"]

    /**
     * 
     * @param {Pointer<Pointer<IDebugServiceManager>>} ppServiceManager 
     * @returns {HRESULT} 
     */
    GetServiceManager(ppServiceManager) {
        result := ComCall(3, this, "ptr*", ppServiceManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<ISvcProcess>>} ppProcess 
     * @returns {HRESULT} 
     */
    GetServiceProcess(ppProcess) {
        result := ComCall(4, this, "ptr*", ppProcess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<ISvcThread>>} ppThread 
     * @returns {HRESULT} 
     */
    GetServiceThread(ppThread) {
        result := ComCall(5, this, "ptr*", ppThread, "HRESULT")
        return result
    }
}
