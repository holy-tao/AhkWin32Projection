#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IDropShadow2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropShadow2
     * @type {Guid}
     */
    static IID => Guid("{6c4218bc-15b9-4c2d-8d4a-0767df11977a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourcePolicy", "put_SourcePolicy"]

    /**
     * @type {Integer} 
     */
    SourcePolicy {
        get => this.get_SourcePolicy()
        set => this.put_SourcePolicy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourcePolicy() {
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
    put_SourcePolicy(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
