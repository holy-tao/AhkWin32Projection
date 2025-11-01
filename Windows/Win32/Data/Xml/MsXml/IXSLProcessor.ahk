#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXSLProcessor extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXSLProcessor
     * @type {Guid}
     */
    static IID => Guid("{2933bf92-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_input", "get_input", "get_ownerTemplate", "setStartMode", "get_startMode", "get_startModeURI", "put_output", "get_output", "transform", "reset", "get_readyState", "addParameter", "addObject", "get_stylesheet"]

    /**
     * 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    put_input(var) {
        result := ComCall(7, this, "ptr", var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    get_input(pVar) {
        result := ComCall(8, this, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXSLTemplate>} ppTemplate 
     * @returns {HRESULT} 
     */
    get_ownerTemplate(ppTemplate) {
        result := ComCall(9, this, "ptr*", ppTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mode 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    setStartMode(mode, namespaceURI) {
        mode := mode is String ? BSTR.Alloc(mode).Value : mode
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(10, this, "ptr", mode, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mode 
     * @returns {HRESULT} 
     */
    get_startMode(mode) {
        result := ComCall(11, this, "ptr", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} namespaceURI 
     * @returns {HRESULT} 
     */
    get_startModeURI(namespaceURI) {
        result := ComCall(12, this, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} output 
     * @returns {HRESULT} 
     */
    put_output(output) {
        result := ComCall(13, this, "ptr", output, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pOutput 
     * @returns {HRESULT} 
     */
    get_output(pOutput) {
        result := ComCall(14, this, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pDone 
     * @returns {HRESULT} 
     */
    transform(pDone) {
        result := ComCall(15, this, "ptr", pDone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pReadyState 
     * @returns {HRESULT} 
     */
    get_readyState(pReadyState) {
        pReadyStateMarshal := pReadyState is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pReadyStateMarshal, pReadyState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} baseName 
     * @param {VARIANT} parameter 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    addParameter(baseName, parameter, namespaceURI) {
        baseName := baseName is String ? BSTR.Alloc(baseName).Value : baseName
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(18, this, "ptr", baseName, "ptr", parameter, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} obj 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    addObject(obj, namespaceURI) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(19, this, "ptr", obj, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} stylesheet 
     * @returns {HRESULT} 
     */
    get_stylesheet(stylesheet) {
        result := ComCall(20, this, "ptr*", stylesheet, "HRESULT")
        return result
    }
}
