#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CompilerStateObject extends IUnknown{
    /**
     * The interface identifier for ID3D12CompilerStateObject
     * @type {Guid}
     */
    static IID => Guid("{5981cca4-e8ae-44ca-9b92-4fa86f5a3a3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppCompiler 
     * @returns {HRESULT} 
     */
    GetCompiler(riid, ppCompiler) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppCompiler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
