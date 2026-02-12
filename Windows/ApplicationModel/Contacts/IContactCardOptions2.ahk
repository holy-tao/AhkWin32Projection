#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactCardOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactCardOptions2
     * @type {Guid}
     */
    static IID => Guid("{8f271ba0-d74b-4cc6-9f53-1b0eb5d1273c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServerSearchContactListIds"]

    /**
     * @type {IVector<HSTRING>} 
     */
    ServerSearchContactListIds {
        get => this.get_ServerSearchContactListIds()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ServerSearchContactListIds() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
