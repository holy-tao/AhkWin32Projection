#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IPaneThemeTransition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaneThemeTransition
     * @type {Guid}
     */
    static IID => Guid("{4708eb8e-4bfc-ee46-d4f9-708def3fbb2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Edge", "put_Edge"]

    /**
     * @type {Integer} 
     */
    Edge {
        get => this.get_Edge()
        set => this.put_Edge(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Edge() {
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
    put_Edge(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
