#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class IXmlReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlReader
     * @type {Guid}
     */
    static IID => Guid("{7279fc81-709d-4095-b63d-69fe4b0d9030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInput", "GetProperty", "SetProperty", "Read", "GetNodeType", "MoveToFirstAttribute", "MoveToNextAttribute", "MoveToAttributeByName", "MoveToElement", "GetQualifiedName", "GetNamespaceUri", "GetLocalName", "GetPrefix", "GetValue", "ReadValueChunk", "GetBaseUri", "IsDefault", "IsEmptyElement", "GetLineNumber", "GetLinePosition", "GetAttributeCount", "GetDepth", "IsEOF"]

    /**
     * 
     * @param {IUnknown} pInput 
     * @returns {HRESULT} 
     */
    SetInput(pInput) {
        result := ComCall(3, this, "ptr", pInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nProperty 
     * @returns {Pointer} 
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
     * @returns {Integer} 
     */
    Read() {
        result := ComCall(6, this, "int*", &pNodeType := 0, "int")
        return pNodeType
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNodeType() {
        result := ComCall(7, this, "int*", &pNodeType := 0, "HRESULT")
        return pNodeType
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveToFirstAttribute() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveToNextAttribute() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszLocalName 
     * @param {PWSTR} pwszNamespaceUri 
     * @returns {HRESULT} 
     */
    MoveToAttributeByName(pwszLocalName, pwszNamespaceUri) {
        pwszLocalName := pwszLocalName is String ? StrPtr(pwszLocalName) : pwszLocalName
        pwszNamespaceUri := pwszNamespaceUri is String ? StrPtr(pwszNamespaceUri) : pwszNamespaceUri

        result := ComCall(10, this, "ptr", pwszLocalName, "ptr", pwszNamespaceUri, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveToElement() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszQualifiedName 
     * @param {Pointer<Integer>} pcwchQualifiedName 
     * @returns {HRESULT} 
     */
    GetQualifiedName(ppwszQualifiedName, pcwchQualifiedName) {
        ppwszQualifiedNameMarshal := ppwszQualifiedName is VarRef ? "ptr*" : "ptr"
        pcwchQualifiedNameMarshal := pcwchQualifiedName is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, ppwszQualifiedNameMarshal, ppwszQualifiedName, pcwchQualifiedNameMarshal, pcwchQualifiedName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszNamespaceUri 
     * @param {Pointer<Integer>} pcwchNamespaceUri 
     * @returns {HRESULT} 
     */
    GetNamespaceUri(ppwszNamespaceUri, pcwchNamespaceUri) {
        ppwszNamespaceUriMarshal := ppwszNamespaceUri is VarRef ? "ptr*" : "ptr"
        pcwchNamespaceUriMarshal := pcwchNamespaceUri is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, ppwszNamespaceUriMarshal, ppwszNamespaceUri, pcwchNamespaceUriMarshal, pcwchNamespaceUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszLocalName 
     * @param {Pointer<Integer>} pcwchLocalName 
     * @returns {HRESULT} 
     */
    GetLocalName(ppwszLocalName, pcwchLocalName) {
        ppwszLocalNameMarshal := ppwszLocalName is VarRef ? "ptr*" : "ptr"
        pcwchLocalNameMarshal := pcwchLocalName is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, ppwszLocalNameMarshal, ppwszLocalName, pcwchLocalNameMarshal, pcwchLocalName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszPrefix 
     * @param {Pointer<Integer>} pcwchPrefix 
     * @returns {HRESULT} 
     */
    GetPrefix(ppwszPrefix, pcwchPrefix) {
        ppwszPrefixMarshal := ppwszPrefix is VarRef ? "ptr*" : "ptr"
        pcwchPrefixMarshal := pcwchPrefix is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, ppwszPrefixMarshal, ppwszPrefix, pcwchPrefixMarshal, pcwchPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszValue 
     * @param {Pointer<Integer>} pcwchValue 
     * @returns {HRESULT} 
     */
    GetValue(ppwszValue, pcwchValue) {
        ppwszValueMarshal := ppwszValue is VarRef ? "ptr*" : "ptr"
        pcwchValueMarshal := pcwchValue is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, ppwszValueMarshal, ppwszValue, pcwchValueMarshal, pcwchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchBuffer 
     * @param {Integer} cwchChunkSize 
     * @param {Pointer<Integer>} pcwchRead 
     * @returns {HRESULT} 
     */
    ReadValueChunk(pwchBuffer, cwchChunkSize, pcwchRead) {
        pwchBuffer := pwchBuffer is String ? StrPtr(pwchBuffer) : pwchBuffer

        pcwchReadMarshal := pcwchRead is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "ptr", pwchBuffer, "uint", cwchChunkSize, pcwchReadMarshal, pcwchRead, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszBaseUri 
     * @param {Pointer<Integer>} pcwchBaseUri 
     * @returns {HRESULT} 
     */
    GetBaseUri(ppwszBaseUri, pcwchBaseUri) {
        ppwszBaseUriMarshal := ppwszBaseUri is VarRef ? "ptr*" : "ptr"
        pcwchBaseUriMarshal := pcwchBaseUri is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, ppwszBaseUriMarshal, ppwszBaseUri, pcwchBaseUriMarshal, pcwchBaseUri, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsDefault() {
        result := ComCall(19, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsEmptyElement() {
        result := ComCall(20, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLineNumber() {
        result := ComCall(21, this, "uint*", &pnLineNumber := 0, "HRESULT")
        return pnLineNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLinePosition() {
        result := ComCall(22, this, "uint*", &pnLinePosition := 0, "HRESULT")
        return pnLinePosition
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAttributeCount() {
        result := ComCall(23, this, "uint*", &pnAttributeCount := 0, "HRESULT")
        return pnAttributeCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDepth() {
        result := ComCall(24, this, "uint*", &pnDepth := 0, "HRESULT")
        return pnDepth
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsEOF() {
        result := ComCall(25, this, "int")
        return result
    }
}
