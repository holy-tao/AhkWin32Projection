#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IXMLDOMProcessingInstruction.ahk" { IXMLDOMProcessingInstruction }
#Import ".\IXMLDOMImplementation.ahk" { IXMLDOMImplementation }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMDocumentType.ahk" { IXMLDOMDocumentType }
#Import ".\IXMLDOMElement.ahk" { IXMLDOMElement }
#Import ".\IXMLDOMNodeList.ahk" { IXMLDOMNodeList }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IXMLDOMDocumentFragment.ahk" { IXMLDOMDocumentFragment }
#Import ".\IXMLDOMText.ahk" { IXMLDOMText }
#Import ".\IXMLDOMParseError.ahk" { IXMLDOMParseError }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IXMLDOMEntityReference.ahk" { IXMLDOMEntityReference }
#Import ".\IXMLDOMCDATASection.ahk" { IXMLDOMCDATASection }
#Import ".\IXMLDOMComment.ahk" { IXMLDOMComment }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import ".\IXMLDOMAttribute.ahk" { IXMLDOMAttribute }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMDocument extends IXMLDOMNode {
    /**
     * The interface identifier for IXMLDOMDocument
     * @type {Guid}
     */
    static IID := Guid("{2933bf81-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMDocument interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
        get_doctype                 : IntPtr
        get_implementation          : IntPtr
        get_documentElement         : IntPtr
        putref_documentElement      : IntPtr
        createElement               : IntPtr
        createDocumentFragment      : IntPtr
        createTextNode              : IntPtr
        createComment               : IntPtr
        createCDATASection          : IntPtr
        createProcessingInstruction : IntPtr
        createAttribute             : IntPtr
        createEntityReference       : IntPtr
        getElementsByTagName        : IntPtr
        createNode                  : IntPtr
        nodeFromID                  : IntPtr
        load                        : IntPtr
        get_readyState              : IntPtr
        get_parseError              : IntPtr
        get_url                     : IntPtr
        get_async                   : IntPtr
        put_async                   : IntPtr
        abort                       : IntPtr
        loadXML                     : IntPtr
        save                        : IntPtr
        get_validateOnParse         : IntPtr
        put_validateOnParse         : IntPtr
        get_resolveExternals        : IntPtr
        put_resolveExternals        : IntPtr
        get_preserveWhiteSpace      : IntPtr
        put_preserveWhiteSpace      : IntPtr
        put_onreadystatechange      : IntPtr
        put_ondataavailable         : IntPtr
        put_ontransformnode         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMDocument.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IXMLDOMDocumentType} 
     */
    doctype {
        get => this.get_doctype()
    }

    /**
     * @type {IXMLDOMImplementation} 
     */
    implementation {
        get => this.get_implementation()
    }

    /**
     * @type {IXMLDOMElement} 
     */
    documentElement {
        get => this.get_documentElement()
    }

    /**
     * @type {Integer} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {IXMLDOMParseError} 
     */
    parseError {
        get => this.get_parseError()
    }

    /**
     * @type {BSTR} 
     */
    url {
        get => this.get_url()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    async {
        get => this.get_async()
        set => this.put_async(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    validateOnParse {
        get => this.get_validateOnParse()
        set => this.put_validateOnParse(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    resolveExternals {
        get => this.get_resolveExternals()
        set => this.put_resolveExternals(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    preserveWhiteSpace {
        get => this.get_preserveWhiteSpace()
        set => this.put_preserveWhiteSpace(value)
    }

    /**
     * @type {VARIANT} 
     */
    onreadystatechange {
        set => this.put_onreadystatechange(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondataavailable {
        set => this.put_ondataavailable(value)
    }

    /**
     * @type {VARIANT} 
     */
    ontransformnode {
        set => this.put_ontransformnode(value)
    }

    /**
     * 
     * @returns {IXMLDOMDocumentType} 
     */
    get_doctype() {
        result := ComCall(43, this, "ptr*", &documentType := 0, "HRESULT")
        return IXMLDOMDocumentType(documentType)
    }

    /**
     * 
     * @returns {IXMLDOMImplementation} 
     */
    get_implementation() {
        result := ComCall(44, this, "ptr*", &impl := 0, "HRESULT")
        return IXMLDOMImplementation(impl)
    }

    /**
     * 
     * @returns {IXMLDOMElement} 
     */
    get_documentElement() {
        result := ComCall(45, this, "ptr*", &DOMElement := 0, "HRESULT")
        return IXMLDOMElement(DOMElement)
    }

    /**
     * 
     * @param {IXMLDOMElement} DOMElement 
     * @returns {HRESULT} 
     */
    putref_documentElement(DOMElement) {
        result := ComCall(46, this, "ptr", DOMElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @returns {IXMLDOMElement} 
     */
    createElement(tagName) {
        tagName := tagName is String ? BSTR.Alloc(tagName).Value : tagName

        result := ComCall(47, this, BSTR, tagName, "ptr*", &element := 0, "HRESULT")
        return IXMLDOMElement(element)
    }

    /**
     * 
     * @returns {IXMLDOMDocumentFragment} 
     */
    createDocumentFragment() {
        result := ComCall(48, this, "ptr*", &docFrag := 0, "HRESULT")
        return IXMLDOMDocumentFragment(docFrag)
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {IXMLDOMText} 
     */
    createTextNode(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(49, this, BSTR, data, "ptr*", &text := 0, "HRESULT")
        return IXMLDOMText(text)
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {IXMLDOMComment} 
     */
    createComment(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(50, this, BSTR, data, "ptr*", &comment := 0, "HRESULT")
        return IXMLDOMComment(comment)
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {IXMLDOMCDATASection} 
     */
    createCDATASection(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(51, this, BSTR, data, "ptr*", &cdata := 0, "HRESULT")
        return IXMLDOMCDATASection(cdata)
    }

    /**
     * 
     * @param {BSTR} target 
     * @param {BSTR} data 
     * @returns {IXMLDOMProcessingInstruction} 
     */
    createProcessingInstruction(target, data) {
        target := target is String ? BSTR.Alloc(target).Value : target
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(52, this, BSTR, target, BSTR, data, "ptr*", &pi := 0, "HRESULT")
        return IXMLDOMProcessingInstruction(pi)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IXMLDOMAttribute} 
     */
    createAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(53, this, BSTR, name, "ptr*", &attribute := 0, "HRESULT")
        return IXMLDOMAttribute(attribute)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IXMLDOMEntityReference} 
     */
    createEntityReference(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(54, this, BSTR, name, "ptr*", &entityRef := 0, "HRESULT")
        return IXMLDOMEntityReference(entityRef)
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @returns {IXMLDOMNodeList} 
     */
    getElementsByTagName(tagName) {
        tagName := tagName is String ? BSTR.Alloc(tagName).Value : tagName

        result := ComCall(55, this, BSTR, tagName, "ptr*", &resultList := 0, "HRESULT")
        return IXMLDOMNodeList(resultList)
    }

    /**
     * 
     * @param {VARIANT} Type 
     * @param {BSTR} name 
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     */
    createNode(Type, name, namespaceURI) {
        name := name is String ? BSTR.Alloc(name).Value : name
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(56, this, VARIANT, Type, BSTR, name, BSTR, namespaceURI, "ptr*", &_node := 0, "HRESULT")
        return IXMLDOMNode(_node)
    }

    /**
     * 
     * @param {BSTR} idString 
     * @returns {IXMLDOMNode} 
     */
    nodeFromID(idString) {
        idString := idString is String ? BSTR.Alloc(idString).Value : idString

        result := ComCall(57, this, BSTR, idString, "ptr*", &_node := 0, "HRESULT")
        return IXMLDOMNode(_node)
    }

    /**
     * The load command loads a file in a device-specific format. Digital-video and video-overlay devices recognize this command.
     * @remarks
     * The "vidboard" device sends a notification message when the loading is completed.
     * @param {VARIANT} xmlSource 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/Multimedia/load
     */
    load(xmlSource) {
        result := ComCall(58, this, VARIANT, xmlSource, VARIANT_BOOL.Ptr, &isSuccessful := 0, "HRESULT")
        return isSuccessful
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(59, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {IXMLDOMParseError} 
     */
    get_parseError() {
        result := ComCall(60, this, "ptr*", &errorObj := 0, "HRESULT")
        return IXMLDOMParseError(errorObj)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_url() {
        urlString := BSTR.Owned()
        result := ComCall(61, this, BSTR.Ptr, urlString, "HRESULT")
        return urlString
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_async() {
        result := ComCall(62, this, VARIANT_BOOL.Ptr, &isAsync := 0, "HRESULT")
        return isAsync
    }

    /**
     * 
     * @param {VARIANT_BOOL} isAsync 
     * @returns {HRESULT} 
     */
    put_async(isAsync) {
        result := ComCall(63, this, VARIANT_BOOL, isAsync, "HRESULT")
        return result
    }

    /**
     * Submits an error message to the information queue and terminates the current draw or dispatch call being executed.
     * @remarks
     * This operation does nothing on rasterizers that do not support it.
     * @returns {HRESULT} None
     * 
     * 
     * 
     * This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/abort
     */
    abort() {
        result := ComCall(64, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrXML 
     * @returns {VARIANT_BOOL} 
     */
    loadXML(bstrXML) {
        bstrXML := bstrXML is String ? BSTR.Alloc(bstrXML).Value : bstrXML

        result := ComCall(65, this, BSTR, bstrXML, VARIANT_BOOL.Ptr, &isSuccessful := 0, "HRESULT")
        return isSuccessful
    }

    /**
     * The save command saves an MCI file. Video-overlay and waveform-audio devices recognize this command. Although digital-video devices and MIDI sequencers also recognize this command, the MCIAVI and MCISEQ drivers do not support it.
     * @remarks
     * The *filename* variable is required if the device was opened using the "new" device identifier.
     * @param {VARIANT} destination 
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFilename"></span><span id="lpszfilename"></span><span id="LPSZFILENAME"></span>*lpszFilename*
     * 
     * Flag specifying the name of the file being saved and, optionally, additional flags modifying the save operation. The following table lists device types that recognize the **save** command and the flags used by each type.
     * 
     * 
     * 
     * | Value        | Meaning              | Meaning               |
     * |--------------|----------------------|-----------------------|
     * | digitalvideo | abort at *rectangle* | *filename*keepreserve |
     * | overlay      | at *rectangle*       | *filename*            |
     * | sequencer    | *filename*           |                       |
     * | waveaudio    | *filename*           |                       |
     * 
     * 
     * 
     *  
     * 
     * The following table lists the flags that can be specified in the **lpszFilename** parameter and their meanings.
     * 
     * 
     * 
     * | Value          | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
     * |----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | abort          | Stops a **save** operation in progress. If used, this must be the only item present.                                                                                                                                                                                                                                                                                                                                                                                                                 |
     * | at *rectangle* | Specifies a rectangle relative to the frame buffer origin. The *rectangle* is specified as *X1 Y1 X2 Y2*. The coordinates *X1 Y1* specify the upper left corner and the coordinates *X2 Y2* specify the width and height.For digital-video devices, the [capture](capture.md) command is used to capture the contents of the frame buffer.<br/>                                                                                                                                               |
     * | *filename*     | Specifies the filename to assign to the data file. If a path is not specified, the file will be placed on the disk and in the directory previously specified on the explicit or implicit [reserve](reserve.md) command. If **reserve** has not been issued, the default drive and directory are those associated with the application's task. If a path is specified, the device might require it to be on the disk drive specified by the explicit or implicit **reserve**. This flag is required. |
     * | keepreserve    | Specifies that unused disk space left over from the original **reserve** command is not deallocated.                                                                                                                                                                                                                                                                                                                                                                                                 |
     * 
     * 
     * 
     *  
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/save
     */
    save(destination) {
        result := ComCall(66, this, VARIANT, destination, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_validateOnParse() {
        result := ComCall(67, this, VARIANT_BOOL.Ptr, &isValidating := 0, "HRESULT")
        return isValidating
    }

    /**
     * 
     * @param {VARIANT_BOOL} isValidating 
     * @returns {HRESULT} 
     */
    put_validateOnParse(isValidating) {
        result := ComCall(68, this, VARIANT_BOOL, isValidating, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_resolveExternals() {
        result := ComCall(69, this, VARIANT_BOOL.Ptr, &isResolving := 0, "HRESULT")
        return isResolving
    }

    /**
     * 
     * @param {VARIANT_BOOL} isResolving 
     * @returns {HRESULT} 
     */
    put_resolveExternals(isResolving) {
        result := ComCall(70, this, VARIANT_BOOL, isResolving, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_preserveWhiteSpace() {
        result := ComCall(71, this, VARIANT_BOOL.Ptr, &isPreserving := 0, "HRESULT")
        return isPreserving
    }

    /**
     * 
     * @param {VARIANT_BOOL} isPreserving 
     * @returns {HRESULT} 
     */
    put_preserveWhiteSpace(isPreserving) {
        result := ComCall(72, this, VARIANT_BOOL, isPreserving, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} readystatechangeSink 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(readystatechangeSink) {
        result := ComCall(73, this, VARIANT, readystatechangeSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ondataavailableSink 
     * @returns {HRESULT} 
     */
    put_ondataavailable(ondataavailableSink) {
        result := ComCall(74, this, VARIANT, ondataavailableSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ontransformnodeSink 
     * @returns {HRESULT} 
     */
    put_ontransformnode(ontransformnodeSink) {
        result := ComCall(75, this, VARIANT, ontransformnodeSink, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLDOMDocument.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_doctype := CallbackCreate(GetMethod(implObj, "get_doctype"), flags, 2)
        this.vtbl.get_implementation := CallbackCreate(GetMethod(implObj, "get_implementation"), flags, 2)
        this.vtbl.get_documentElement := CallbackCreate(GetMethod(implObj, "get_documentElement"), flags, 2)
        this.vtbl.putref_documentElement := CallbackCreate(GetMethod(implObj, "putref_documentElement"), flags, 2)
        this.vtbl.createElement := CallbackCreate(GetMethod(implObj, "createElement"), flags, 3)
        this.vtbl.createDocumentFragment := CallbackCreate(GetMethod(implObj, "createDocumentFragment"), flags, 2)
        this.vtbl.createTextNode := CallbackCreate(GetMethod(implObj, "createTextNode"), flags, 3)
        this.vtbl.createComment := CallbackCreate(GetMethod(implObj, "createComment"), flags, 3)
        this.vtbl.createCDATASection := CallbackCreate(GetMethod(implObj, "createCDATASection"), flags, 3)
        this.vtbl.createProcessingInstruction := CallbackCreate(GetMethod(implObj, "createProcessingInstruction"), flags, 4)
        this.vtbl.createAttribute := CallbackCreate(GetMethod(implObj, "createAttribute"), flags, 3)
        this.vtbl.createEntityReference := CallbackCreate(GetMethod(implObj, "createEntityReference"), flags, 3)
        this.vtbl.getElementsByTagName := CallbackCreate(GetMethod(implObj, "getElementsByTagName"), flags, 3)
        this.vtbl.createNode := CallbackCreate(GetMethod(implObj, "createNode"), flags, 5)
        this.vtbl.nodeFromID := CallbackCreate(GetMethod(implObj, "nodeFromID"), flags, 3)
        this.vtbl.load := CallbackCreate(GetMethod(implObj, "load"), flags, 3)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.get_parseError := CallbackCreate(GetMethod(implObj, "get_parseError"), flags, 2)
        this.vtbl.get_url := CallbackCreate(GetMethod(implObj, "get_url"), flags, 2)
        this.vtbl.get_async := CallbackCreate(GetMethod(implObj, "get_async"), flags, 2)
        this.vtbl.put_async := CallbackCreate(GetMethod(implObj, "put_async"), flags, 2)
        this.vtbl.abort := CallbackCreate(GetMethod(implObj, "abort"), flags, 1)
        this.vtbl.loadXML := CallbackCreate(GetMethod(implObj, "loadXML"), flags, 3)
        this.vtbl.save := CallbackCreate(GetMethod(implObj, "save"), flags, 2)
        this.vtbl.get_validateOnParse := CallbackCreate(GetMethod(implObj, "get_validateOnParse"), flags, 2)
        this.vtbl.put_validateOnParse := CallbackCreate(GetMethod(implObj, "put_validateOnParse"), flags, 2)
        this.vtbl.get_resolveExternals := CallbackCreate(GetMethod(implObj, "get_resolveExternals"), flags, 2)
        this.vtbl.put_resolveExternals := CallbackCreate(GetMethod(implObj, "put_resolveExternals"), flags, 2)
        this.vtbl.get_preserveWhiteSpace := CallbackCreate(GetMethod(implObj, "get_preserveWhiteSpace"), flags, 2)
        this.vtbl.put_preserveWhiteSpace := CallbackCreate(GetMethod(implObj, "put_preserveWhiteSpace"), flags, 2)
        this.vtbl.put_onreadystatechange := CallbackCreate(GetMethod(implObj, "put_onreadystatechange"), flags, 2)
        this.vtbl.put_ondataavailable := CallbackCreate(GetMethod(implObj, "put_ondataavailable"), flags, 2)
        this.vtbl.put_ontransformnode := CallbackCreate(GetMethod(implObj, "put_ontransformnode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_doctype)
        CallbackFree(this.vtbl.get_implementation)
        CallbackFree(this.vtbl.get_documentElement)
        CallbackFree(this.vtbl.putref_documentElement)
        CallbackFree(this.vtbl.createElement)
        CallbackFree(this.vtbl.createDocumentFragment)
        CallbackFree(this.vtbl.createTextNode)
        CallbackFree(this.vtbl.createComment)
        CallbackFree(this.vtbl.createCDATASection)
        CallbackFree(this.vtbl.createProcessingInstruction)
        CallbackFree(this.vtbl.createAttribute)
        CallbackFree(this.vtbl.createEntityReference)
        CallbackFree(this.vtbl.getElementsByTagName)
        CallbackFree(this.vtbl.createNode)
        CallbackFree(this.vtbl.nodeFromID)
        CallbackFree(this.vtbl.load)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.get_parseError)
        CallbackFree(this.vtbl.get_url)
        CallbackFree(this.vtbl.get_async)
        CallbackFree(this.vtbl.put_async)
        CallbackFree(this.vtbl.abort)
        CallbackFree(this.vtbl.loadXML)
        CallbackFree(this.vtbl.save)
        CallbackFree(this.vtbl.get_validateOnParse)
        CallbackFree(this.vtbl.put_validateOnParse)
        CallbackFree(this.vtbl.get_resolveExternals)
        CallbackFree(this.vtbl.put_resolveExternals)
        CallbackFree(this.vtbl.get_preserveWhiteSpace)
        CallbackFree(this.vtbl.put_preserveWhiteSpace)
        CallbackFree(this.vtbl.put_onreadystatechange)
        CallbackFree(this.vtbl.put_ondataavailable)
        CallbackFree(this.vtbl.put_ontransformnode)
    }
}
