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
     * @returns {Pointer<IDebugServiceManager>} 
     */
    GetServiceManager() {
        result := ComCall(3, this, "ptr*", &ppServiceManager := 0, "HRESULT")
        return ppServiceManager
    }

    /**
     * 
     * @returns {Pointer<ISvcProcess>} 
     */
    GetServiceProcess() {
        result := ComCall(4, this, "ptr*", &ppProcess := 0, "HRESULT")
        return ppProcess
    }

    /**
     * 
     * @returns {Pointer<ISvcThread>} 
     */
    GetServiceThread() {
        result := ComCall(5, this, "ptr*", &ppThread := 0, "HRESULT")
        return ppThread
    }
}
