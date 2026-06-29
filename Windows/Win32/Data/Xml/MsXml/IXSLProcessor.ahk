#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IXSLTemplate.ahk" { IXSLTemplate }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXSLProcessor extends IDispatch {
    /**
     * The interface identifier for IXSLProcessor
     * @type {Guid}
     */
    static IID := Guid("{2933bf92-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXSLProcessor interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_input         : IntPtr
        get_input         : IntPtr
        get_ownerTemplate : IntPtr
        setStartMode      : IntPtr
        get_startMode     : IntPtr
        get_startModeURI  : IntPtr
        put_output        : IntPtr
        get_output        : IntPtr
        transform         : IntPtr
        reset             : IntPtr
        get_readyState    : IntPtr
        addParameter      : IntPtr
        addObject         : IntPtr
        get_stylesheet    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXSLProcessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(7, this, VARIANT, var, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_input() {
        pVar := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, pVar, "HRESULT")
        return pVar
    }

    /**
     * 
     * @returns {IXSLTemplate} 
     */
    get_ownerTemplate() {
        result := ComCall(9, this, "ptr*", &ppTemplate := 0, "HRESULT")
        return IXSLTemplate(ppTemplate)
    }

    /**
     * 
     * @param {BSTR} _mode 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    setStartMode(_mode, namespaceURI) {
        _mode := _mode is String ? BSTR.Alloc(_mode).Value : _mode
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(10, this, BSTR, _mode, BSTR, namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_startMode() {
        _mode := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, _mode, "HRESULT")
        return _mode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_startModeURI() {
        namespaceURI := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, namespaceURI, "HRESULT")
        return namespaceURI
    }

    /**
     * 
     * @param {VARIANT} output 
     * @returns {HRESULT} 
     */
    put_output(output) {
        result := ComCall(13, this, VARIANT, output, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_output() {
        pOutput := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, pOutput, "HRESULT")
        return pOutput
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    transform() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &pDone := 0, "HRESULT")
        return pDone
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
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(17, this, "int*", &pReadyState := 0, "HRESULT")
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
        baseName := baseName is String ? BSTR.Alloc(baseName).Value : baseName
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(18, this, BSTR, baseName, VARIANT, parameter, BSTR, namespaceURI, "HRESULT")
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

        result := ComCall(19, this, "ptr", obj, BSTR, namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_stylesheet() {
        result := ComCall(20, this, "ptr*", &stylesheet := 0, "HRESULT")
        return IXMLDOMNode(stylesheet)
    }

    Query(iid) {
        if (IXSLProcessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_input := CallbackCreate(GetMethod(implObj, "put_input"), flags, 2)
        this.vtbl.get_input := CallbackCreate(GetMethod(implObj, "get_input"), flags, 2)
        this.vtbl.get_ownerTemplate := CallbackCreate(GetMethod(implObj, "get_ownerTemplate"), flags, 2)
        this.vtbl.setStartMode := CallbackCreate(GetMethod(implObj, "setStartMode"), flags, 3)
        this.vtbl.get_startMode := CallbackCreate(GetMethod(implObj, "get_startMode"), flags, 2)
        this.vtbl.get_startModeURI := CallbackCreate(GetMethod(implObj, "get_startModeURI"), flags, 2)
        this.vtbl.put_output := CallbackCreate(GetMethod(implObj, "put_output"), flags, 2)
        this.vtbl.get_output := CallbackCreate(GetMethod(implObj, "get_output"), flags, 2)
        this.vtbl.transform := CallbackCreate(GetMethod(implObj, "transform"), flags, 2)
        this.vtbl.reset := CallbackCreate(GetMethod(implObj, "reset"), flags, 1)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.addParameter := CallbackCreate(GetMethod(implObj, "addParameter"), flags, 4)
        this.vtbl.addObject := CallbackCreate(GetMethod(implObj, "addObject"), flags, 3)
        this.vtbl.get_stylesheet := CallbackCreate(GetMethod(implObj, "get_stylesheet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_input)
        CallbackFree(this.vtbl.get_input)
        CallbackFree(this.vtbl.get_ownerTemplate)
        CallbackFree(this.vtbl.setStartMode)
        CallbackFree(this.vtbl.get_startMode)
        CallbackFree(this.vtbl.get_startModeURI)
        CallbackFree(this.vtbl.put_output)
        CallbackFree(this.vtbl.get_output)
        CallbackFree(this.vtbl.transform)
        CallbackFree(this.vtbl.reset)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.addParameter)
        CallbackFree(this.vtbl.addObject)
        CallbackFree(this.vtbl.get_stylesheet)
    }
}
