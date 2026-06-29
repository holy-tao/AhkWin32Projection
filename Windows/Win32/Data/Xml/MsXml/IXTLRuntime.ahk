#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXTLRuntime extends IXMLDOMNode {
    /**
     * The interface identifier for IXTLRuntime
     * @type {Guid}
     */
    static IID := Guid("{3efaa425-272f-11d2-836f-0000f87a7782}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXTLRuntime interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
        uniqueID            : IntPtr
        depth               : IntPtr
        childNumber         : IntPtr
        ancestorChildNumber : IntPtr
        absoluteChildNumber : IntPtr
        formatIndex         : IntPtr
        formatNumber        : IntPtr
        formatDate          : IntPtr
        formatTime          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXTLRuntime.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    uniqueID(pNode) {
        result := ComCall(43, this, "ptr", pNode, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    depth(pNode) {
        result := ComCall(44, this, "ptr", pNode, "int*", &pDepth := 0, "HRESULT")
        return pDepth
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    childNumber(pNode) {
        result := ComCall(45, this, "ptr", pNode, "int*", &pNumber := 0, "HRESULT")
        return pNumber
    }

    /**
     * 
     * @param {BSTR} bstrNodeName 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    ancestorChildNumber(bstrNodeName, pNode) {
        bstrNodeName := bstrNodeName is String ? BSTR.Alloc(bstrNodeName).Value : bstrNodeName

        result := ComCall(46, this, BSTR, bstrNodeName, "ptr", pNode, "int*", &pNumber := 0, "HRESULT")
        return pNumber
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    absoluteChildNumber(pNode) {
        result := ComCall(47, this, "ptr", pNode, "int*", &pNumber := 0, "HRESULT")
        return pNumber
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {BSTR} bstrFormat 
     * @returns {BSTR} 
     */
    formatIndex(lIndex, bstrFormat) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        pbstrFormattedString := BSTR.Owned()
        result := ComCall(48, this, "int", lIndex, BSTR, bstrFormat, BSTR.Ptr, pbstrFormattedString, "HRESULT")
        return pbstrFormattedString
    }

    /**
     * 
     * @param {Float} dblNumber 
     * @param {BSTR} bstrFormat 
     * @returns {BSTR} 
     */
    formatNumber(dblNumber, bstrFormat) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        pbstrFormattedString := BSTR.Owned()
        result := ComCall(49, this, "double", dblNumber, BSTR, bstrFormat, BSTR.Ptr, pbstrFormattedString, "HRESULT")
        return pbstrFormattedString
    }

    /**
     * 
     * @param {VARIANT} varDate 
     * @param {BSTR} bstrFormat 
     * @param {VARIANT} varDestLocale 
     * @returns {BSTR} 
     */
    formatDate(varDate, bstrFormat, varDestLocale) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        pbstrFormattedString := BSTR.Owned()
        result := ComCall(50, this, VARIANT, varDate, BSTR, bstrFormat, VARIANT, varDestLocale, BSTR.Ptr, pbstrFormattedString, "HRESULT")
        return pbstrFormattedString
    }

    /**
     * 
     * @param {VARIANT} varTime 
     * @param {BSTR} bstrFormat 
     * @param {VARIANT} varDestLocale 
     * @returns {BSTR} 
     */
    formatTime(varTime, bstrFormat, varDestLocale) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        pbstrFormattedString := BSTR.Owned()
        result := ComCall(51, this, VARIANT, varTime, BSTR, bstrFormat, VARIANT, varDestLocale, BSTR.Ptr, pbstrFormattedString, "HRESULT")
        return pbstrFormattedString
    }

    Query(iid) {
        if (IXTLRuntime.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.uniqueID := CallbackCreate(GetMethod(implObj, "uniqueID"), flags, 3)
        this.vtbl.depth := CallbackCreate(GetMethod(implObj, "depth"), flags, 3)
        this.vtbl.childNumber := CallbackCreate(GetMethod(implObj, "childNumber"), flags, 3)
        this.vtbl.ancestorChildNumber := CallbackCreate(GetMethod(implObj, "ancestorChildNumber"), flags, 4)
        this.vtbl.absoluteChildNumber := CallbackCreate(GetMethod(implObj, "absoluteChildNumber"), flags, 3)
        this.vtbl.formatIndex := CallbackCreate(GetMethod(implObj, "formatIndex"), flags, 4)
        this.vtbl.formatNumber := CallbackCreate(GetMethod(implObj, "formatNumber"), flags, 4)
        this.vtbl.formatDate := CallbackCreate(GetMethod(implObj, "formatDate"), flags, 5)
        this.vtbl.formatTime := CallbackCreate(GetMethod(implObj, "formatTime"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.uniqueID)
        CallbackFree(this.vtbl.depth)
        CallbackFree(this.vtbl.childNumber)
        CallbackFree(this.vtbl.ancestorChildNumber)
        CallbackFree(this.vtbl.absoluteChildNumber)
        CallbackFree(this.vtbl.formatIndex)
        CallbackFree(this.vtbl.formatNumber)
        CallbackFree(this.vtbl.formatDate)
        CallbackFree(this.vtbl.formatTime)
    }
}
