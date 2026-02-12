#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreProductOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreProductOptions
     * @type {Guid}
     */
    static IID => Guid("{5b34a0f9-a113-4811-8326-16199c927f31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActionFilters"]

    /**
     * @type {IVector<HSTRING>} 
     */
    ActionFilters {
        get => this.get_ActionFilters()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ActionFilters() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
