#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicViewConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCamera6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCamera6
     * @type {Guid}
     */
    static IID => Guid("{0209194f-632d-5154-ab52-0b5d15b12505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ViewConfiguration"]

    /**
     * @type {HolographicViewConfiguration} 
     */
    ViewConfiguration {
        get => this.get_ViewConfiguration()
    }

    /**
     * 
     * @returns {HolographicViewConfiguration} 
     */
    get_ViewConfiguration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicViewConfiguration(value)
    }
}
