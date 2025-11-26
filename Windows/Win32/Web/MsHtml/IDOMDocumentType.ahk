#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMDocumentType extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMDocumentType
     * @type {Guid}
     */
    static IID => Guid("{30510738-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMDocumentType
     * @type {Guid}
     */
    static CLSID => Guid("{30510739-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_name", "get_entities", "get_notations", "get_publicId", "get_systemId", "get_internalSubset"]

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {IDispatch} 
     */
    entities {
        get => this.get_entities()
    }

    /**
     * @type {IDispatch} 
     */
    notations {
        get => this.get_notations()
    }

    /**
     * @type {VARIANT} 
     */
    publicId {
        get => this.get_publicId()
    }

    /**
     * @type {VARIANT} 
     */
    systemId {
        get => this.get_systemId()
    }

    /**
     * @type {VARIANT} 
     */
    internalSubset {
        get => this.get_internalSubset()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_entities() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_notations() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_publicId() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_systemId() {
        p := VARIANT()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_internalSubset() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }
}
