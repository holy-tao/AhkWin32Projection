#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\XmlStandalone.ahk" { XmlStandalone }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IXmlReader.ahk" { IXmlReader }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
export default struct IXmlWriterLite extends IUnknown {
    /**
     * The interface identifier for IXmlWriterLite
     * @type {Guid}
     */
    static IID := Guid("{862494c6-1310-4aad-b3cd-2dbeebf670d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXmlWriterLite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetOutput                  : IntPtr
        GetProperty                : IntPtr
        SetProperty                : IntPtr
        WriteAttributes            : IntPtr
        WriteAttributeString       : IntPtr
        WriteCData                 : IntPtr
        WriteCharEntity            : IntPtr
        WriteChars                 : IntPtr
        WriteComment               : IntPtr
        WriteDocType               : IntPtr
        WriteElementString         : IntPtr
        WriteEndDocument           : IntPtr
        WriteEndElement            : IntPtr
        WriteEntityRef             : IntPtr
        WriteFullEndElement        : IntPtr
        WriteName                  : IntPtr
        WriteNmToken               : IntPtr
        WriteNode                  : IntPtr
        WriteNodeShallow           : IntPtr
        WriteProcessingInstruction : IntPtr
        WriteRaw                   : IntPtr
        WriteRawChars              : IntPtr
        WriteStartDocument         : IntPtr
        WriteStartElement          : IntPtr
        WriteString                : IntPtr
        WriteSurrogateCharEntity   : IntPtr
        WriteWhitespace            : IntPtr
        Flush                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXmlWriterLite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pOutput 
     * @returns {HRESULT} 
     */
    SetOutput(pOutput) {
        result := ComCall(3, this, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {Integer} nProperty 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(nProperty) {
        result := ComCall(4, this, "uint", nProperty, "ptr*", &ppValue := 0, "HRESULT")
        return ppValue
    }

    /**
     * 
     * @param {Integer} nProperty 
     * @param {Pointer} pValue 
     * @returns {HRESULT} 
     */
    SetProperty(nProperty, pValue) {
        result := ComCall(5, this, "uint", nProperty, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXmlReader} pReader 
     * @param {BOOL} fWriteDefaultAttributes 
     * @returns {HRESULT} 
     */
    WriteAttributes(pReader, fWriteDefaultAttributes) {
        result := ComCall(6, this, "ptr", pReader, BOOL, fWriteDefaultAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszQName 
     * @param {Integer} cwszQName 
     * @param {PWSTR} pwszValue 
     * @param {Integer} cwszValue 
     * @returns {HRESULT} 
     */
    WriteAttributeString(pwszQName, cwszQName, pwszValue, cwszValue) {
        pwszQName := pwszQName is String ? StrPtr(pwszQName) : pwszQName
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(7, this, "ptr", pwszQName, "uint", cwszQName, "ptr", pwszValue, "uint", cwszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszText 
     * @returns {HRESULT} 
     */
    WriteCData(pwszText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(8, this, "ptr", pwszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wch 
     * @returns {HRESULT} 
     */
    WriteCharEntity(wch) {
        result := ComCall(9, this, "char", wch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwch 
     * @param {Integer} cwch 
     * @returns {HRESULT} 
     */
    WriteChars(pwch, cwch) {
        pwch := pwch is String ? StrPtr(pwch) : pwch

        result := ComCall(10, this, "ptr", pwch, "uint", cwch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszComment 
     * @returns {HRESULT} 
     */
    WriteComment(pwszComment) {
        pwszComment := pwszComment is String ? StrPtr(pwszComment) : pwszComment

        result := ComCall(11, this, "ptr", pwszComment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {PWSTR} pwszPublicId 
     * @param {PWSTR} pwszSystemId 
     * @param {PWSTR} pwszSubset 
     * @returns {HRESULT} 
     */
    WriteDocType(pwszName, pwszPublicId, pwszSystemId, pwszSubset) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszPublicId := pwszPublicId is String ? StrPtr(pwszPublicId) : pwszPublicId
        pwszSystemId := pwszSystemId is String ? StrPtr(pwszSystemId) : pwszSystemId
        pwszSubset := pwszSubset is String ? StrPtr(pwszSubset) : pwszSubset

        result := ComCall(12, this, "ptr", pwszName, "ptr", pwszPublicId, "ptr", pwszSystemId, "ptr", pwszSubset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszQName 
     * @param {Integer} cwszQName 
     * @param {PWSTR} pwszValue 
     * @returns {HRESULT} 
     */
    WriteElementString(pwszQName, cwszQName, pwszValue) {
        pwszQName := pwszQName is String ? StrPtr(pwszQName) : pwszQName
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(13, this, "ptr", pwszQName, "uint", cwszQName, "ptr", pwszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WriteEndDocument() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszQName 
     * @param {Integer} cwszQName 
     * @returns {HRESULT} 
     */
    WriteEndElement(pwszQName, cwszQName) {
        pwszQName := pwszQName is String ? StrPtr(pwszQName) : pwszQName

        result := ComCall(15, this, "ptr", pwszQName, "uint", cwszQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     */
    WriteEntityRef(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(16, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszQName 
     * @param {Integer} cwszQName 
     * @returns {HRESULT} 
     */
    WriteFullEndElement(pwszQName, cwszQName) {
        pwszQName := pwszQName is String ? StrPtr(pwszQName) : pwszQName

        result := ComCall(17, this, "ptr", pwszQName, "uint", cwszQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     */
    WriteName(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(18, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszNmToken 
     * @returns {HRESULT} 
     */
    WriteNmToken(pwszNmToken) {
        pwszNmToken := pwszNmToken is String ? StrPtr(pwszNmToken) : pwszNmToken

        result := ComCall(19, this, "ptr", pwszNmToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXmlReader} pReader 
     * @param {BOOL} fWriteDefaultAttributes 
     * @returns {HRESULT} 
     */
    WriteNode(pReader, fWriteDefaultAttributes) {
        result := ComCall(20, this, "ptr", pReader, BOOL, fWriteDefaultAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXmlReader} pReader 
     * @param {BOOL} fWriteDefaultAttributes 
     * @returns {HRESULT} 
     */
    WriteNodeShallow(pReader, fWriteDefaultAttributes) {
        result := ComCall(21, this, "ptr", pReader, BOOL, fWriteDefaultAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {PWSTR} pwszText 
     * @returns {HRESULT} 
     */
    WriteProcessingInstruction(pwszName, pwszText) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(22, this, "ptr", pwszName, "ptr", pwszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszData 
     * @returns {HRESULT} 
     */
    WriteRaw(pwszData) {
        pwszData := pwszData is String ? StrPtr(pwszData) : pwszData

        result := ComCall(23, this, "ptr", pwszData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwch 
     * @param {Integer} cwch 
     * @returns {HRESULT} 
     */
    WriteRawChars(pwch, cwch) {
        pwch := pwch is String ? StrPtr(pwch) : pwch

        result := ComCall(24, this, "ptr", pwch, "uint", cwch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {XmlStandalone} standalone 
     * @returns {HRESULT} 
     */
    WriteStartDocument(standalone) {
        result := ComCall(25, this, XmlStandalone, standalone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszQName 
     * @param {Integer} cwszQName 
     * @returns {HRESULT} 
     */
    WriteStartElement(pwszQName, cwszQName) {
        pwszQName := pwszQName is String ? StrPtr(pwszQName) : pwszQName

        result := ComCall(26, this, "ptr", pwszQName, "uint", cwszQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszText 
     * @returns {HRESULT} 
     */
    WriteString(pwszText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(27, this, "ptr", pwszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wchLow 
     * @param {Integer} wchHigh 
     * @returns {HRESULT} 
     */
    WriteSurrogateCharEntity(wchLow, wchHigh) {
        result := ComCall(28, this, "char", wchLow, "char", wchHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszWhitespace 
     * @returns {HRESULT} 
     */
    WriteWhitespace(pwszWhitespace) {
        pwszWhitespace := pwszWhitespace is String ? StrPtr(pwszWhitespace) : pwszWhitespace

        result := ComCall(29, this, "ptr", pwszWhitespace, "HRESULT")
        return result
    }

    /**
     * Clears the forward buffers for the stream and writes any buffered data to the configuration file.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-flush
     */
    Flush() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXmlWriterLite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutput := CallbackCreate(GetMethod(implObj, "SetOutput"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
        this.vtbl.WriteAttributes := CallbackCreate(GetMethod(implObj, "WriteAttributes"), flags, 3)
        this.vtbl.WriteAttributeString := CallbackCreate(GetMethod(implObj, "WriteAttributeString"), flags, 5)
        this.vtbl.WriteCData := CallbackCreate(GetMethod(implObj, "WriteCData"), flags, 2)
        this.vtbl.WriteCharEntity := CallbackCreate(GetMethod(implObj, "WriteCharEntity"), flags, 2)
        this.vtbl.WriteChars := CallbackCreate(GetMethod(implObj, "WriteChars"), flags, 3)
        this.vtbl.WriteComment := CallbackCreate(GetMethod(implObj, "WriteComment"), flags, 2)
        this.vtbl.WriteDocType := CallbackCreate(GetMethod(implObj, "WriteDocType"), flags, 5)
        this.vtbl.WriteElementString := CallbackCreate(GetMethod(implObj, "WriteElementString"), flags, 4)
        this.vtbl.WriteEndDocument := CallbackCreate(GetMethod(implObj, "WriteEndDocument"), flags, 1)
        this.vtbl.WriteEndElement := CallbackCreate(GetMethod(implObj, "WriteEndElement"), flags, 3)
        this.vtbl.WriteEntityRef := CallbackCreate(GetMethod(implObj, "WriteEntityRef"), flags, 2)
        this.vtbl.WriteFullEndElement := CallbackCreate(GetMethod(implObj, "WriteFullEndElement"), flags, 3)
        this.vtbl.WriteName := CallbackCreate(GetMethod(implObj, "WriteName"), flags, 2)
        this.vtbl.WriteNmToken := CallbackCreate(GetMethod(implObj, "WriteNmToken"), flags, 2)
        this.vtbl.WriteNode := CallbackCreate(GetMethod(implObj, "WriteNode"), flags, 3)
        this.vtbl.WriteNodeShallow := CallbackCreate(GetMethod(implObj, "WriteNodeShallow"), flags, 3)
        this.vtbl.WriteProcessingInstruction := CallbackCreate(GetMethod(implObj, "WriteProcessingInstruction"), flags, 3)
        this.vtbl.WriteRaw := CallbackCreate(GetMethod(implObj, "WriteRaw"), flags, 2)
        this.vtbl.WriteRawChars := CallbackCreate(GetMethod(implObj, "WriteRawChars"), flags, 3)
        this.vtbl.WriteStartDocument := CallbackCreate(GetMethod(implObj, "WriteStartDocument"), flags, 2)
        this.vtbl.WriteStartElement := CallbackCreate(GetMethod(implObj, "WriteStartElement"), flags, 3)
        this.vtbl.WriteString := CallbackCreate(GetMethod(implObj, "WriteString"), flags, 2)
        this.vtbl.WriteSurrogateCharEntity := CallbackCreate(GetMethod(implObj, "WriteSurrogateCharEntity"), flags, 3)
        this.vtbl.WriteWhitespace := CallbackCreate(GetMethod(implObj, "WriteWhitespace"), flags, 2)
        this.vtbl.Flush := CallbackCreate(GetMethod(implObj, "Flush"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutput)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.WriteAttributes)
        CallbackFree(this.vtbl.WriteAttributeString)
        CallbackFree(this.vtbl.WriteCData)
        CallbackFree(this.vtbl.WriteCharEntity)
        CallbackFree(this.vtbl.WriteChars)
        CallbackFree(this.vtbl.WriteComment)
        CallbackFree(this.vtbl.WriteDocType)
        CallbackFree(this.vtbl.WriteElementString)
        CallbackFree(this.vtbl.WriteEndDocument)
        CallbackFree(this.vtbl.WriteEndElement)
        CallbackFree(this.vtbl.WriteEntityRef)
        CallbackFree(this.vtbl.WriteFullEndElement)
        CallbackFree(this.vtbl.WriteName)
        CallbackFree(this.vtbl.WriteNmToken)
        CallbackFree(this.vtbl.WriteNode)
        CallbackFree(this.vtbl.WriteNodeShallow)
        CallbackFree(this.vtbl.WriteProcessingInstruction)
        CallbackFree(this.vtbl.WriteRaw)
        CallbackFree(this.vtbl.WriteRawChars)
        CallbackFree(this.vtbl.WriteStartDocument)
        CallbackFree(this.vtbl.WriteStartElement)
        CallbackFree(this.vtbl.WriteString)
        CallbackFree(this.vtbl.WriteSurrogateCharEntity)
        CallbackFree(this.vtbl.WriteWhitespace)
        CallbackFree(this.vtbl.Flush)
    }
}
