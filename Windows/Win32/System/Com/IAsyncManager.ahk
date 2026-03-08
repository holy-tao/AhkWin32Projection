#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAsyncManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncManager
     * @type {Guid}
     */
    static IID => Guid("{0000002a-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompleteCall", "GetCallContext", "GetState"]

    /**
     * 
     * @param {HRESULT} Result 
     * @returns {HRESULT} 
     */
    CompleteCall(Result) {
        result := ComCall(3, this, "int", Result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCallContext(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &pInterface := 0, "HRESULT")
        return pInterface
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState() {
        result := ComCall(5, this, "uint*", &pulStateFlags := 0, "HRESULT")
        return pulStateFlags
    }
}
