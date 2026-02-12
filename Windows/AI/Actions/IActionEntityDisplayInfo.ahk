#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionEntityDisplayInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEntityDisplayInfo
     * @type {Guid}
     */
    static IID => Guid("{057a9ede-03e1-55c6-acba-c7056216735a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title"]

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
