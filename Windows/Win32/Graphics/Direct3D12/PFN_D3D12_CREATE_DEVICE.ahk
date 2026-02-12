#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class PFN_D3D12_CREATE_DEVICE extends IUnknown {

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
     * @param {IUnknown} param0 
     * @param {Integer} param1 
     * @param {Pointer<Guid>} param2 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        result := ComCall(3, this, "ptr", param0, "int", param1, "ptr", param2, "ptr*", &param3 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return param3
    }
}
