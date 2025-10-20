#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLDOMCharacterData.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMText extends IXMLDOMCharacterData{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMText
     * @type {Guid}
     */
    static IID => Guid("{2933bf87-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 51

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["splitText"]

    /**
     * 
     * @param {Integer} offset 
     * @param {Pointer<IXMLDOMText>} rightHandTextNode 
     * @returns {HRESULT} 
     */
    splitText(offset, rightHandTextNode) {
        result := ComCall(51, this, "int", offset, "ptr*", rightHandTextNode, "HRESULT")
        return result
    }
}
