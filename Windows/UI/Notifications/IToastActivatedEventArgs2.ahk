#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastActivatedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastActivatedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{ab7da512-cc61-568e-81be-304ac31038fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserInput"]

    /**
     * @type {ValueSet} 
     */
    UserInput {
        get => this.get_UserInput()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_UserInput() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }
}
