#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ILanguage2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguage2
     * @type {Guid}
     */
    static IID => Guid("{6a47e5b5-d94d-4886-a404-a5a5b9d5b494}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LayoutDirection"]

    /**
     * @type {Integer} 
     */
    LayoutDirection {
        get => this.get_LayoutDirection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LayoutDirection() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
