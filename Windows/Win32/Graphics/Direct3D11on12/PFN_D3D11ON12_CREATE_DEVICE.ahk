#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 * @version v4.0.30319
 */
class PFN_D3D11ON12_CREATE_DEVICE extends IUnknown {

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
     * @param {Pointer<Integer>} param2 
     * @param {Integer} FeatureLevels 
     * @param {Pointer<IUnknown>} param4 
     * @param {Integer} NumQueues 
     * @param {Integer} param6 
     * @param {Pointer<Pointer<ID3D11Device>>} param7 
     * @param {Pointer<Pointer<ID3D11DeviceContext>>} param8 
     * @param {Pointer<Integer>} param9 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, FeatureLevels, param4, NumQueues, param6, param7, param8, param9) {
        param2Marshal := param2 is VarRef ? "int*" : "ptr"
        param9Marshal := param9 is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", param0, "uint", param1, param2Marshal, param2, "uint", FeatureLevels, "ptr*", param4, "uint", NumQueues, "uint", param6, "ptr*", param7, "ptr*", param8, param9Marshal, param9, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
