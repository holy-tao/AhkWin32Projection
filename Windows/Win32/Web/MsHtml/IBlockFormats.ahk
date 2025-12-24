#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IBlockFormats extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBlockFormats
     * @type {Guid}
     */
    static IID => Guid("{3050f830-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for BlockFormats
     * @type {Guid}
     */
    static CLSID => Guid("{3050f831-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Count", "Item"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @returns {BSTR} 
     */
    Item(pvarIndex) {
        pbstrBlockFormat := BSTR()
        result := ComCall(9, this, "ptr", pvarIndex, "ptr", pbstrBlockFormat, "HRESULT")
        return pbstrBlockFormat
    }
}
