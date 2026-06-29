#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\XmlNodeType.ahk" { XmlNodeType }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */
export default struct IXmlReader extends IUnknown {
    /**
     * The interface identifier for IXmlReader
     * @type {Guid}
     */
    static IID := Guid("{7279fc81-709d-4095-b63d-69fe4b0d9030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXmlReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetInput              : IntPtr
        GetProperty           : IntPtr
        SetProperty           : IntPtr
        Read                  : IntPtr
        GetNodeType           : IntPtr
        MoveToFirstAttribute  : IntPtr
        MoveToNextAttribute   : IntPtr
        MoveToAttributeByName : IntPtr
        MoveToElement         : IntPtr
        GetQualifiedName      : IntPtr
        GetNamespaceUri       : IntPtr
        GetLocalName          : IntPtr
        GetPrefix             : IntPtr
        GetValue              : IntPtr
        ReadValueChunk        : IntPtr
        GetBaseUri            : IntPtr
        IsDefault             : IntPtr
        IsEmptyElement        : IntPtr
        GetLineNumber         : IntPtr
        GetLinePosition       : IntPtr
        GetAttributeCount     : IntPtr
        GetDepth              : IntPtr
        IsEOF                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXmlReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @returns {XmlNodeType} 
     */
    Read() {
        result := ComCall(6, this, "int*", &pNodeType := 0, Int32)
        return pNodeType
    }

    /**
     * 
     * @returns {XmlNodeType} 
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
        result := ComCall(8, this, Int32)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveToNextAttribute() {
        result := ComCall(9, this, Int32)
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

        result := ComCall(10, this, "ptr", pwszLocalName, "ptr", pwszNamespaceUri, Int32)
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

        result := ComCall(17, this, "ptr", pwchBuffer, "uint", cwchChunkSize, pcwchReadMarshal, pcwchRead, Int32)
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
     * IsDefault
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-isdefault
     */
    IsDefault() {
        result := ComCall(19, this, BOOL)
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsEmptyElement() {
        result := ComCall(20, this, BOOL)
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
        result := ComCall(25, this, BOOL)
        return result
    }

    Query(iid) {
        if (IXmlReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInput := CallbackCreate(GetMethod(implObj, "SetInput"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 2)
        this.vtbl.GetNodeType := CallbackCreate(GetMethod(implObj, "GetNodeType"), flags, 2)
        this.vtbl.MoveToFirstAttribute := CallbackCreate(GetMethod(implObj, "MoveToFirstAttribute"), flags, 1)
        this.vtbl.MoveToNextAttribute := CallbackCreate(GetMethod(implObj, "MoveToNextAttribute"), flags, 1)
        this.vtbl.MoveToAttributeByName := CallbackCreate(GetMethod(implObj, "MoveToAttributeByName"), flags, 3)
        this.vtbl.MoveToElement := CallbackCreate(GetMethod(implObj, "MoveToElement"), flags, 1)
        this.vtbl.GetQualifiedName := CallbackCreate(GetMethod(implObj, "GetQualifiedName"), flags, 3)
        this.vtbl.GetNamespaceUri := CallbackCreate(GetMethod(implObj, "GetNamespaceUri"), flags, 3)
        this.vtbl.GetLocalName := CallbackCreate(GetMethod(implObj, "GetLocalName"), flags, 3)
        this.vtbl.GetPrefix := CallbackCreate(GetMethod(implObj, "GetPrefix"), flags, 3)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 3)
        this.vtbl.ReadValueChunk := CallbackCreate(GetMethod(implObj, "ReadValueChunk"), flags, 4)
        this.vtbl.GetBaseUri := CallbackCreate(GetMethod(implObj, "GetBaseUri"), flags, 3)
        this.vtbl.IsDefault := CallbackCreate(GetMethod(implObj, "IsDefault"), flags, 1)
        this.vtbl.IsEmptyElement := CallbackCreate(GetMethod(implObj, "IsEmptyElement"), flags, 1)
        this.vtbl.GetLineNumber := CallbackCreate(GetMethod(implObj, "GetLineNumber"), flags, 2)
        this.vtbl.GetLinePosition := CallbackCreate(GetMethod(implObj, "GetLinePosition"), flags, 2)
        this.vtbl.GetAttributeCount := CallbackCreate(GetMethod(implObj, "GetAttributeCount"), flags, 2)
        this.vtbl.GetDepth := CallbackCreate(GetMethod(implObj, "GetDepth"), flags, 2)
        this.vtbl.IsEOF := CallbackCreate(GetMethod(implObj, "IsEOF"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInput)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.GetNodeType)
        CallbackFree(this.vtbl.MoveToFirstAttribute)
        CallbackFree(this.vtbl.MoveToNextAttribute)
        CallbackFree(this.vtbl.MoveToAttributeByName)
        CallbackFree(this.vtbl.MoveToElement)
        CallbackFree(this.vtbl.GetQualifiedName)
        CallbackFree(this.vtbl.GetNamespaceUri)
        CallbackFree(this.vtbl.GetLocalName)
        CallbackFree(this.vtbl.GetPrefix)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.ReadValueChunk)
        CallbackFree(this.vtbl.GetBaseUri)
        CallbackFree(this.vtbl.IsDefault)
        CallbackFree(this.vtbl.IsEmptyElement)
        CallbackFree(this.vtbl.GetLineNumber)
        CallbackFree(this.vtbl.GetLinePosition)
        CallbackFree(this.vtbl.GetAttributeCount)
        CallbackFree(this.vtbl.GetDepth)
        CallbackFree(this.vtbl.IsEOF)
    }
}
