#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISAXXMLReader.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXXMLFilter extends ISAXXMLReader{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getParent", "putParent"]

    /**
     * 
     * @returns {ISAXXMLReader} 
     */
    getParent() {
        result := ComCall(21, this, "ptr*", &ppReader := 0, "HRESULT")
        return ISAXXMLReader(ppReader)
    }

    /**
     * 
     * @param {ISAXXMLReader} pReader 
     * @returns {HRESULT} 
     */
    putParent(pReader) {
        result := ComCall(22, this, "ptr", pReader, "HRESULT")
        return result
    }
}
