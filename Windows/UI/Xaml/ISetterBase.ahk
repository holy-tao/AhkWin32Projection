#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ISetterBase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISetterBase
     * @type {Guid}
     */
    static IID => Guid("{418be27c-2ac4-4f22-8097-dea3aeeb2fb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSealed"]

    /**
     * @type {Boolean} 
     */
    IsSealed {
        get => this.get_IsSealed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSealed() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
