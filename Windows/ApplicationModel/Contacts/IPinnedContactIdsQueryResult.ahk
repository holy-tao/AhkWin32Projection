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
class IPinnedContactIdsQueryResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPinnedContactIdsQueryResult
     * @type {Guid}
     */
    static IID => Guid("{7d9b2552-1579-4ddc-871f-a30a3aea9ba1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContactIds"]

    /**
     * @type {IVector<HSTRING>} 
     */
    ContactIds {
        get => this.get_ContactIds()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ContactIds() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
