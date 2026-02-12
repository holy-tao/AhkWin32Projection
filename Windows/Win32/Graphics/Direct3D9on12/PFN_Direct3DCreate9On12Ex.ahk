#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Direct3D9\IDirect3D9Ex.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 * @version v4.0.30319
 */
class PFN_Direct3DCreate9On12Ex extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} SDKVersion 
     * @param {Pointer<D3D9ON12_ARGS>} pOverrideList 
     * @param {Integer} NumOverrideEntries 
     * @returns {IDirect3D9Ex} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(SDKVersion, pOverrideList, NumOverrideEntries) {
        result := ComCall(3, this, "uint", SDKVersion, "ptr", pOverrideList, "uint", NumOverrideEntries, "ptr*", &ppOutputInterface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3D9Ex(ppOutputInterface)
    }
}
