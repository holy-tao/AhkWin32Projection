#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class IXmlWriterLite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlWriterLite
     * @type {Guid}
     */
    static IID => Guid("{862494c6-1310-4aad-b3cd-2dbeebf670d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutput", "GetProperty", "SetProperty", "WriteAttributes", "WriteAttributeString", "WriteCData", "WriteCharEntity", "WriteChars", "WriteComment", "WriteDocType", "WriteElementString", "WriteEndDocument", "WriteEndElement", "WriteEntityRef", "WriteFullEndElement", "WriteName", "WriteNmToken", "WriteNode", "WriteNodeShallow", "WriteProcessingInstruction", "WriteRaw", "WriteRawChars", "WriteStartDocument", "WriteStartElement", "WriteString", "WriteSurrogateCharEntity", "WriteWhitespace", "Flush"]

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
     * 
     * @param {Integer} nProperty 
     * @param {Pointer<Pointer>} ppValue 
     * @returns {HRESULT} 
     */
    GetProperty(nProperty, ppValue) {
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", nProperty, ppValueMarshal, ppValue, "HRESULT")
        return result
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
        result := ComCall(6, this, "ptr", pReader, "int", fWriteDefaultAttributes, "HRESULT")
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
        result := ComCall(20, this, "ptr", pReader, "int", fWriteDefaultAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXmlReader} pReader 
     * @param {BOOL} fWriteDefaultAttributes 
     * @returns {HRESULT} 
     */
    WriteNodeShallow(pReader, fWriteDefaultAttributes) {
        result := ComCall(21, this, "ptr", pReader, "int", fWriteDefaultAttributes, "HRESULT")
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
     * @param {Integer} standalone 
     * @returns {HRESULT} 
     */
    WriteStartDocument(standalone) {
        result := ComCall(25, this, "int", standalone, "HRESULT")
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
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(30, this, "HRESULT")
        return result
    }
}
