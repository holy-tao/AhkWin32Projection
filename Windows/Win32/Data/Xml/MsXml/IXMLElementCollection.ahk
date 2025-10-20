#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Supports collection of XML elements for indexed access.
 * @see https://docs.microsoft.com/windows/win32/api//msxml/nn-msxml-ixmlelementcollection
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLElementCollection extends IDispatch{
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
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_length(v) {
        result := ComCall(7, this, "int", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppUnk) {
        result := ComCall(9, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} var1 
     * @param {VARIANT} var2 
     * @param {Pointer<IDispatch>} ppDisp 
     * @returns {HRESULT} 
     */
    item(var1, var2, ppDisp) {
        result := ComCall(10, this, "ptr", var1, "ptr", var2, "ptr", ppDisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
