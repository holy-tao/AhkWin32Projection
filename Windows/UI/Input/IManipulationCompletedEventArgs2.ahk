#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IManipulationCompletedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IManipulationCompletedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{f0c0dce7-30a9-5b96-886f-6560a85e4757}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContactCount", "get_CurrentContactCount"]

    /**
     * @type {Integer} 
     */
    ContactCount {
        get => this.get_ContactCount()
    }

    /**
     * @type {Integer} 
     */
    CurrentContactCount {
        get => this.get_CurrentContactCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentContactCount() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
