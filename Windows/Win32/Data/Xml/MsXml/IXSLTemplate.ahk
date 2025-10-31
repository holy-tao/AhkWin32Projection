#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXSLTemplate extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXSLTemplate
     * @type {Guid}
     */
    static IID => Guid("{2933bf93-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_stylesheet", "get_stylesheet", "createProcessor"]

    /**
     * 
     * @param {IXMLDOMNode} stylesheet 
     * @returns {HRESULT} 
     */
    putref_stylesheet(stylesheet) {
        result := ComCall(7, this, "ptr", stylesheet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} stylesheet 
     * @returns {HRESULT} 
     */
    get_stylesheet(stylesheet) {
        result := ComCall(8, this, "ptr*", stylesheet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXSLProcessor>} ppProcessor 
     * @returns {HRESULT} 
     */
    createProcessor(ppProcessor) {
        result := ComCall(9, this, "ptr*", ppProcessor, "HRESULT")
        return result
    }
}
