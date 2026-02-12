#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\InputScopeName.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IInputScope extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputScope
     * @type {Guid}
     */
    static IID => Guid("{5c0f85f3-f9d8-4220-b666-045d074d9bfa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Names"]

    /**
     * @type {IVector<InputScopeName>} 
     */
    Names {
        get => this.get_Names()
    }

    /**
     * 
     * @returns {IVector<InputScopeName>} 
     */
    get_Names() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(InputScopeName, value)
    }
}
