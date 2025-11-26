#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaOption.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaOptionCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaOptionCollection
     * @type {Guid}
     */
    static IID => Guid("{baecb0bd-a946-4771-bc30-e8b24f8d45c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "GetAt", "get__NewEnum"]

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
        result := ComCall(7, this, "uint*", &pulCount := 0, "HRESULT")
        return pulCount
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @returns {IPrintSchemaOption} 
     */
    GetAt(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "ptr*", &ppOption := 0, "HRESULT")
        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
