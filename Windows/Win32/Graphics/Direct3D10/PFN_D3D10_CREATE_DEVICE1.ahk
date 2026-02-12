#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Device1.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class PFN_D3D10_CREATE_DEVICE1 extends IUnknown {

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
     * @param {IDXGIAdapter} param0 
     * @param {Integer} param1 
     * @param {HMODULE} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Integer} param5 
     * @returns {ID3D10Device1} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5) {
        param2 := param2 is Win32Handle ? NumGet(param2, "ptr") : param2

        result := ComCall(3, this, "ptr", param0, "int", param1, "ptr", param2, "uint", param3, "int", param4, "uint", param5, "ptr*", &param6 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID3D10Device1(param6)
    }
}
