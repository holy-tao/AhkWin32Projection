#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class IXmlWriter extends IUnknown{
    /**
     * The interface identifier for IXmlWriter
     * @type {Guid}
     */
    static IID => Guid("{7279fc88-709d-4095-b63d-69fe4b0d9030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pOutput 
     * @returns {HRESULT} 
     */
    SetOutput(pOutput) {
        result := ComCall(3, this, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nProperty 
     * @param {Pointer<IntPtr>} ppValue 
     * @returns {HRESULT} 
     */
    GetProperty(nProperty, ppValue) {
        result := ComCall(4, this, "uint", nProperty, "ptr*", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nProperty 
     * @param {Pointer} pValue 
     * @returns {HRESULT} 
     */
    SetProperty(nProperty, pValue) {
        result := ComCall(5, this, "uint", nProperty, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXmlReader>} pReader 
     * @param {BOOL} fWriteDefaultAttributes 
     * @returns {HRESULT} 
     */
    WriteAttributes(pReader, fWriteDefaultAttributes) {
        result := ComCall(6, this, "ptr", pReader, "int", fWriteDefaultAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPrefix 
     * @param {PWSTR} pwszLocalName 
     * @param {PWSTR} pwszNamespaceUri 
     * @param {PWSTR} pwszValue 
     * @returns {HRESULT} 
     */
    WriteAttributeString(pwszPrefix, pwszLocalName, pwszNamespaceUri, pwszValue) {
        pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix
        pwszLocalName := pwszLocalName is String ? StrPtr(pwszLocalName) : pwszLocalName
        pwszNamespaceUri := pwszNamespaceUri is String ? StrPtr(pwszNamespaceUri) : pwszNamespaceUri
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(7, this, "ptr", pwszPrefix, "ptr", pwszLocalName, "ptr", pwszNamespaceUri, "ptr", pwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszText 
     * @returns {HRESULT} 
     */
    WriteCData(pwszText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(8, this, "ptr", pwszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wch 
     * @returns {HRESULT} 
     */
    WriteCharEntity(wch) {
        result := ComCall(9, this, "char", wch, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(10, this, "ptr", pwch, "uint", cwch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszComment 
     * @returns {HRESULT} 
     */
    WriteComment(pwszComment) {
        pwszComment := pwszComment is String ? StrPtr(pwszComment) : pwszComment

        result := ComCall(11, this, "ptr", pwszComment, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(12, this, "ptr", pwszName, "ptr", pwszPublicId, "ptr", pwszSystemId, "ptr", pwszSubset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPrefix 
     * @param {PWSTR} pwszLocalName 
     * @param {PWSTR} pwszNamespaceUri 
     * @param {PWSTR} pwszValue 
     * @returns {HRESULT} 
     */
    WriteElementString(pwszPrefix, pwszLocalName, pwszNamespaceUri, pwszValue) {
        pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix
        pwszLocalName := pwszLocalName is String ? StrPtr(pwszLocalName) : pwszLocalName
        pwszNamespaceUri := pwszNamespaceUri is String ? StrPtr(pwszNamespaceUri) : pwszNamespaceUri
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(13, this, "ptr", pwszPrefix, "ptr", pwszLocalName, "ptr", pwszNamespaceUri, "ptr", pwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WriteEndDocument() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WriteEndElement() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     */
    WriteEntityRef(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(16, this, "ptr", pwszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WriteFullEndElement() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     */
    WriteName(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(18, this, "ptr", pwszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszNmToken 
     * @returns {HRESULT} 
     */
    WriteNmToken(pwszNmToken) {
        pwszNmToken := pwszNmToken is String ? StrPtr(pwszNmToken) : pwszNmToken

        result := ComCall(19, this, "ptr", pwszNmToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXmlReader>} pReader 
     * @param {BOOL} fWriteDefaultAttributes 
     * @returns {HRESULT} 
     */
    WriteNode(pReader, fWriteDefaultAttributes) {
        result := ComCall(20, this, "ptr", pReader, "int", fWriteDefaultAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXmlReader>} pReader 
     * @param {BOOL} fWriteDefaultAttributes 
     * @returns {HRESULT} 
     */
    WriteNodeShallow(pReader, fWriteDefaultAttributes) {
        result := ComCall(21, this, "ptr", pReader, "int", fWriteDefaultAttributes, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(22, this, "ptr", pwszName, "ptr", pwszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszLocalName 
     * @param {PWSTR} pwszNamespaceUri 
     * @returns {HRESULT} 
     */
    WriteQualifiedName(pwszLocalName, pwszNamespaceUri) {
        pwszLocalName := pwszLocalName is String ? StrPtr(pwszLocalName) : pwszLocalName
        pwszNamespaceUri := pwszNamespaceUri is String ? StrPtr(pwszNamespaceUri) : pwszNamespaceUri

        result := ComCall(23, this, "ptr", pwszLocalName, "ptr", pwszNamespaceUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszData 
     * @returns {HRESULT} 
     */
    WriteRaw(pwszData) {
        pwszData := pwszData is String ? StrPtr(pwszData) : pwszData

        result := ComCall(24, this, "ptr", pwszData, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(25, this, "ptr", pwch, "uint", cwch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} standalone 
     * @returns {HRESULT} 
     */
    WriteStartDocument(standalone) {
        result := ComCall(26, this, "int", standalone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPrefix 
     * @param {PWSTR} pwszLocalName 
     * @param {PWSTR} pwszNamespaceUri 
     * @returns {HRESULT} 
     */
    WriteStartElement(pwszPrefix, pwszLocalName, pwszNamespaceUri) {
        pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix
        pwszLocalName := pwszLocalName is String ? StrPtr(pwszLocalName) : pwszLocalName
        pwszNamespaceUri := pwszNamespaceUri is String ? StrPtr(pwszNamespaceUri) : pwszNamespaceUri

        result := ComCall(27, this, "ptr", pwszPrefix, "ptr", pwszLocalName, "ptr", pwszNamespaceUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszText 
     * @returns {HRESULT} 
     */
    WriteString(pwszText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(28, this, "ptr", pwszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wchLow 
     * @param {Integer} wchHigh 
     * @returns {HRESULT} 
     */
    WriteSurrogateCharEntity(wchLow, wchHigh) {
        result := ComCall(29, this, "char", wchLow, "char", wchHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszWhitespace 
     * @returns {HRESULT} 
     */
    WriteWhitespace(pwszWhitespace) {
        pwszWhitespace := pwszWhitespace is String ? StrPtr(pwszWhitespace) : pwszWhitespace

        result := ComCall(30, this, "ptr", pwszWhitespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(31, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
