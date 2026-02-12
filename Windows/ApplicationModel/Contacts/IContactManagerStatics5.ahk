#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactManagerStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManagerStatics5
     * @type {Guid}
     */
    static IID => Guid("{f7591a87-acb7-4fad-90f2-a8ab64cdbba4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsShowFullContactCardSupportedAsync", "get_IncludeMiddleNameInSystemDisplayAndSort", "put_IncludeMiddleNameInSystemDisplayAndSort"]

    /**
     * @type {Boolean} 
     */
    IncludeMiddleNameInSystemDisplayAndSort {
        get => this.get_IncludeMiddleNameInSystemDisplayAndSort()
        set => this.put_IncludeMiddleNameInSystemDisplayAndSort(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsShowFullContactCardSupportedAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeMiddleNameInSystemDisplayAndSort() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeMiddleNameInSystemDisplayAndSort(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
