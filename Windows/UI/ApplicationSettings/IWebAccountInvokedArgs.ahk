#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class IWebAccountInvokedArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountInvokedArgs
     * @type {Guid}
     */
    static IID => Guid("{e7abcc40-a1d8-4c5d-9a7f-1d34b2f90ad2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Action"]

    /**
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        result := ComCall(6, this, "int*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return action
    }
}
