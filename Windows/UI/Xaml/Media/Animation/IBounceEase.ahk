#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IBounceEase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBounceEase
     * @type {Guid}
     */
    static IID => Guid("{2bf1464e-fc71-47ed-85a1-3ba9577718b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bounces", "put_Bounces", "get_Bounciness", "put_Bounciness"]

    /**
     * @type {Integer} 
     */
    Bounces {
        get => this.get_Bounces()
        set => this.put_Bounces(value)
    }

    /**
     * @type {Float} 
     */
    Bounciness {
        get => this.get_Bounciness()
        set => this.put_Bounciness(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bounces() {
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
    put_Bounces(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Bounciness() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Bounciness(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
