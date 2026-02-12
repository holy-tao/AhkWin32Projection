#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IKeyDerivationParameters2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyDerivationParameters2
     * @type {Guid}
     */
    static IID => Guid("{cd4166d1-417e-4f4c-b666-c0d879f3f8e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Capi1KdfTargetAlgorithm", "put_Capi1KdfTargetAlgorithm"]

    /**
     * @type {Integer} 
     */
    Capi1KdfTargetAlgorithm {
        get => this.get_Capi1KdfTargetAlgorithm()
        set => this.put_Capi1KdfTargetAlgorithm(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capi1KdfTargetAlgorithm() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Capi1KdfTargetAlgorithm(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
