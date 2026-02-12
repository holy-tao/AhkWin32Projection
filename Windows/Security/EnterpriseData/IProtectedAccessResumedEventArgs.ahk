#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IProtectedAccessResumedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectedAccessResumedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ac4dca59-5d80-4e95-8c5f-8539450eebe0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Identities"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Identities {
        get => this.get_Identities()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Identities() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
