#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXSLTemplate.ahk
#Include .\IXMLDOMNode.ahk
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
     * @type {VARIANT} 
     */
    input {
        get => this.get_input()
        set => this.put_input(value)
    }

    /**
     * @type {IXSLTemplate} 
     */
    ownerTemplate {
        get => this.get_ownerTemplate()
    }

    /**
     * @type {BSTR} 
     */
    startMode {
        get => this.get_startMode()
    }

    /**
     * @type {BSTR} 
     */
    startModeURI {
        get => this.get_startModeURI()
    }

    /**
     * @type {VARIANT} 
     */
    output {
        get => this.get_output()
        set => this.put_output(value)
    }

    /**
     * @type {Integer} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {IXMLDOMNode} 
     */
    stylesheet {
        get => this.get_stylesheet()
    }

    /**
     * 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    put_input(var) {
        result := ComCall(7, this, "ptr", var, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_input() {
        pVar := VARIANT()
        result := ComCall(8, this, "ptr", pVar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVar
    }

    /**
     * 
     * @returns {IXSLTemplate} 
     */
    get_ownerTemplate() {
        result := ComCall(9, this, "ptr*", &ppTemplate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXSLTemplate(ppTemplate)
    }

    /**
     * 
     * @param {BSTR} mode_ 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    setStartMode(mode_, namespaceURI) {
        if(mode_ is String) {
            pin := BSTR.Alloc(mode_)
            mode_ := pin.Value
        }
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(10, this, "ptr", mode_, "ptr", namespaceURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_startMode() {
        mode_ := BSTR()
        result := ComCall(11, this, "ptr", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mode_
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_startModeURI() {
        namespaceURI := BSTR()
        result := ComCall(12, this, "ptr", namespaceURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return namespaceURI
    }

    /**
     * 
     * @param {VARIANT} output 
     * @returns {HRESULT} 
     */
    put_output(output) {
        result := ComCall(13, this, "ptr", output, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_output() {
        pOutput := VARIANT()
        result := ComCall(14, this, "ptr", pOutput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pOutput
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    transform() {
        result := ComCall(15, this, "short*", &pDone := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDone
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(17, this, "int*", &pReadyState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pReadyState
    }

    /**
     * 
     * @param {BSTR} baseName 
     * @param {VARIANT} parameter 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    addParameter(baseName, parameter, namespaceURI) {
        if(baseName is String) {
            pin := BSTR.Alloc(baseName)
            baseName := pin.Value
        }
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(18, this, "ptr", baseName, "ptr", parameter, "ptr", namespaceURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDispatch} obj 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    addObject(obj, namespaceURI) {
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(19, this, "ptr", obj, "ptr", namespaceURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_stylesheet() {
        result := ComCall(20, this, "ptr*", &stylesheet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(stylesheet)
    }
}
