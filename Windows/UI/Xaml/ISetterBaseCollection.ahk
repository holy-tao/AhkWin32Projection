#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ISetterBaseCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISetterBaseCollection
     * @type {Guid}
     */
    static IID => Guid("{03c40ca8-909e-4117-811c-a4529496bdf1}")

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
