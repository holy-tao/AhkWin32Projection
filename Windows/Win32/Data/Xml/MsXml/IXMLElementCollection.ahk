#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Supports collection of XML elements for indexed access.
 * @see https://docs.microsoft.com/windows/win32/api//msxml/nn-msxml-ixmlelementcollection
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLElementCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLElementCollection
     * @type {Guid}
     */
    static IID => Guid("{65725580-9b5d-11d0-9bfe-00c04fc99c8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_length", "get_length", "get__newEnum", "item"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
        set => this.put_length(value)
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_length(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml/nf-msxml-ixmlelementcollection-get_length
     */
    get_length() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(9, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {VARIANT} var1 
     * @param {VARIANT} var2 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml/nf-msxml-ixmlelementcollection-item
     */
    item(var1, var2) {
        result := ComCall(10, this, "ptr", var1, "ptr", var2, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }
}
