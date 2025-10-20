#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class IGameInputDispatcher extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameInputDispatcher
     * @type {Guid}
     */
    static IID => Guid("{415eed2e-98cb-42c2-8f28-b94601074e31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Dispatch", "OpenWaitHandle"]

    /**
     * 
     * @param {Integer} quotaInMicroseconds 
     * @returns {Boolean} 
     */
    Dispatch(quotaInMicroseconds) {
        result := ComCall(3, this, "uint", quotaInMicroseconds, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} waitHandle 
     * @returns {HRESULT} 
     */
    OpenWaitHandle(waitHandle) {
        result := ComCall(4, this, "ptr", waitHandle, "HRESULT")
        return result
    }
}
