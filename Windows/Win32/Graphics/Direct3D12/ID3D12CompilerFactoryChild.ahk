#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CompilerFactoryChild extends IUnknown{
    /**
     * The interface identifier for ID3D12CompilerFactoryChild
     * @type {Guid}
     */
    static IID => Guid("{e0d06420-9f31-47e8-ae9a-dd2ba25ac0bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppCompilerFactory 
     * @returns {HRESULT} 
     */
    GetFactory(riid, ppCompilerFactory) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppCompilerFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
