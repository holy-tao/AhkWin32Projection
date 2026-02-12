#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN extends IUnknown {

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
     * @param {Pointer<Integer>} param4 
     * @param {Integer} FeatureLevels 
     * @param {Integer} param6 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} param7 
     * @param {Pointer<Pointer<IDXGISwapChain>>} param8 
     * @param {Pointer<Pointer<ID3D11Device>>} param9 
     * @param {Pointer<Integer>} param10 
     * @param {Pointer<Pointer<ID3D11DeviceContext>>} param11 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, FeatureLevels, param6, param7, param8, param9, param10, param11) {
        param2 := param2 is Win32Handle ? NumGet(param2, "ptr") : param2

        param4Marshal := param4 is VarRef ? "int*" : "ptr"
        param10Marshal := param10 is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", param0, "int", param1, "ptr", param2, "uint", param3, param4Marshal, param4, "uint", FeatureLevels, "uint", param6, "ptr", param7, "ptr*", param8, "ptr*", param9, param10Marshal, param10, "ptr*", param11, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
