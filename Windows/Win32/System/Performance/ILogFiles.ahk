#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\DILogFileItem.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ILogFiles extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILogFiles
     * @type {Guid}
     */
    static IID => Guid("{6a2a97e6-6851-41ea-87ad-2a8225335865}")

    /**
     * The class identifier for LogFiles
     * @type {Guid}
     */
    static CLSID => Guid("{2735d9fd-f6b9-4f19-a5d9-e2d068584bc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item", "Add", "Remove"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pLong := 0, "HRESULT")
        return pLong
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppIunk := 0, "HRESULT")
        return IUnknown(ppIunk)
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {DILogFileItem} 
     */
    get_Item(index) {
        result := ComCall(9, this, "ptr", index, "ptr*", &ppI := 0, "HRESULT")
        return DILogFileItem(ppI)
    }

    /**
     * 
     * @param {BSTR} pathname 
     * @returns {DILogFileItem} 
     */
    Add(pathname) {
        pathname := pathname is String ? BSTR.Alloc(pathname).Value : pathname

        result := ComCall(10, this, "ptr", pathname, "ptr*", &ppI := 0, "HRESULT")
        return DILogFileItem(ppI)
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {HRESULT} 
     */
    Remove(index) {
        result := ComCall(11, this, "ptr", index, "HRESULT")
        return result
    }
}
