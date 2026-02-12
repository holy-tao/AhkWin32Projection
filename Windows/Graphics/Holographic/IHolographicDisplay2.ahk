#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicDisplay2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicDisplay2
     * @type {Guid}
     */
    static IID => Guid("{75ac3f82-e755-436c-8d96-4d32d131473e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RefreshRate"]

    /**
     * @type {Float} 
     */
    RefreshRate {
        get => this.get_RefreshRate()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RefreshRate() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
