#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLDOMDocument2.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMDocument3 extends IXMLDOMDocument2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMDocument3
     * @type {Guid}
     */
    static IID => Guid("{2933bf96-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 82

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["validateNode", "importNode"]

    /**
     * 
     * @param {IXMLDOMNode} node 
     * @param {Pointer<IXMLDOMParseError>} errorObj 
     * @returns {HRESULT} 
     */
    validateNode(node, errorObj) {
        result := ComCall(82, this, "ptr", node, "ptr*", errorObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} node 
     * @param {VARIANT_BOOL} deep 
     * @param {Pointer<IXMLDOMNode>} clone 
     * @returns {HRESULT} 
     */
    importNode(node, deep, clone) {
        result := ComCall(83, this, "ptr", node, "short", deep, "ptr*", clone, "HRESULT")
        return result
    }
}
