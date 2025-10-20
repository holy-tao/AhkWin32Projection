#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISAXXMLReader.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXXMLFilter extends ISAXXMLReader{
    /**
     * The interface identifier for ISAXXMLFilter
     * @type {Guid}
     */
    static IID => Guid("{70409222-ca09-4475-acb8-40312fe8d145}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * 
     * @param {Pointer<ISAXXMLReader>} ppReader 
     * @returns {HRESULT} 
     */
    getParent(ppReader) {
        result := ComCall(21, this, "ptr", ppReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXXMLReader>} pReader 
     * @returns {HRESULT} 
     */
    putParent(pReader) {
        result := ComCall(22, this, "ptr", pReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
