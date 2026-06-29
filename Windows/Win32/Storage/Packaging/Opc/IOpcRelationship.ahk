#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\OPC_URI_TARGET_MODE.ahk" { OPC_URI_TARGET_MODE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUri.ahk" { IUri }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IOpcUri.ahk" { IOpcUri }

/**
 * Represents a relationship, which is a link between a source, which is a part or the package, and a target.
 * @remarks
 * To create a relationship object to represent a relationship, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipset-createrelationship">IOpcRelationshipSet::CreateRelationship</a> method. To get a pointer to the interface of a relationship object that represents an existing relationship, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipset-getrelationship">IOpcRelationshipSet::GetRelationship</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipenumerator-getcurrent">IOpcRelationshipEnumerator::GetCurrent</a> method.
 * 
 * Example relationship markup for a relationship that targets a part:
 * 
 * 
 * ```xml
 * <Relationship Id="rId1"
 *     Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument"
 *     Target="word/document.xml" />
 * ```
 * 
 * 
 * Using the relationship type (<b>Type</b> attribute of the <b>Relationship</b> element)  is the definitive way  find a 
 * part in a package. For more information about  why the relationship type is used, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/parts-overview">Parts Overview</a>.  For an example of to use the relationship type to find a part, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/finding-the-core-properties-part">Finding the Core Properties Part</a>. 
 * 
 * Valid identifiers for relationships conform to the restrictions for <b>xsd:ID</b>, which are documented in section 3.3.8 ID of the <a href="https://www.w3.org/TR/xmlschema-2/#ID">W3C Recommendation, XML Schema Part 2: Datatypes Second Edition</a> (http://www.w3.org/TR/xmlschema-2/#ID).
 * 
 * <b>IOpcRelationship</b> interface methods provide access to relationship properties for a relationship (which is represented by a relationship object). The methods, associated properties and descriptions are listed in the following table.
 * 
 * <table>
 * <tr>
 * <th>Method</th>
 * <th>Property</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-getid">GetId</a>
 * </td>
 * <td>Relationship identifier</td>
 * <td>
 * The unique, arbitrary identifier of a relationship that is local to the package.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-getrelationshiptype">GetRelationshipType</a>
 * </td>
 * <td>Relationship type</td>
 * <td>
 * The qualified name of a relationship defined by the package designer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-getsourceuri">GetSourceUri</a>
 * </td>
 * <td>Source URI</td>
 * <td>
 * The URI of the relationship's source. The source URI can be the URI of the package or of a part.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-gettargetmode">GetTargetMode</a>
 * </td>
 * <td>Target mode</td>
 * <td>
 * Indicates whether the relationship's target is internal or external to the package.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-gettargeturi">GetTargetUri</a>
 * </td>
 * <td>Target URI</td>
 * <td>
 * The URI of the relationship's target.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information about relationships, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcrelationship
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcRelationship extends IUnknown {
    /**
     * The interface identifier for IOpcRelationship
     * @type {Guid}
     */
    static IID := Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee72}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcRelationship interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetId               : IntPtr
        GetRelationshipType : IntPtr
        GetSourceUri        : IntPtr
        GetTargetUri        : IntPtr
        GetTargetMode       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcRelationship.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the unique identifier of the relationship.
     * @remarks
     * The identifier of a relationship is not useful for finding relationships because it is arbitrary and local to the package.
     * 
     * The definitive way to find a part of interest is by using a relationship type.
     * 
     * Finding a part requires several steps. For detailed information about finding a part, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/finding-the-core-properties-part">Finding the Core Properties Part</a>.
     * 
     * This method allocates memory used by the string returned in <i>relationshipIdentifier</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * For more information about relationships, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {PWSTR} The identifier of the relationship.
     * 
     * The identifier of a relationship is arbitrary and local to the package, and, therefore, .
     * 
     * Valid identifiers conform to the restrictions for <b>xsd:ID</b>, which are  documented in section 3.3.8 ID of the <a href="https://www.w3.org/TR/xmlschema-2/#ID">W3C Recommendation, XML Schema Part 2: Datatypes Second Edition</a> (http://www.w3.org/TR/xmlschema-2/#ID).
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-getid
     */
    GetId() {
        result := ComCall(3, this, PWSTR.Ptr, &relationshipIdentifier := 0, "HRESULT")
        return relationshipIdentifier
    }

    /**
     * Gets the relationship type.
     * @remarks
     * This method allocates memory used by the string returned in <i>relationshipType</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * The definitive way to find a part of interest is by using a relationship type.
     * 
     * Finding a part of interest requires several steps. For detailed information about finding a part, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/finding-the-core-properties-part">Finding the Core Properties Part</a>.
     * 
     * For more information about relationships, relationship types and a list of relationship types defined by the OPC, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>OPC</i>.
     * @returns {PWSTR} Receives the relationship type, which is the qualified name of the relationship, as defined by the package format designer or the <i>OPC</i>.
     * 
     * For more information about relationship types see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-getrelationshiptype
     */
    GetRelationshipType() {
        result := ComCall(4, this, PWSTR.Ptr, &relationshipType := 0, "HRESULT")
        return relationshipType
    }

    /**
     * Gets the URI of the relationship�source.
     * @remarks
     * If the source of a relationship is the package itself, the URI in <i>sourceUri</i> represents the package root: "/".
     * 
     * If the relationship  target is a part, form the part name by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcuri-combineparturi">IOpcUri::CombinePartUri</a> method from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a> interface pointer received in <i>sourceUri</i>. Use the relative URI received in the <i>targetUri</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-gettargeturi">GetTargetUri</a> method as the input parameter of the <b>IOpcUri::CombinePartUri</b> call. For an example, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/resolving-a-part-name-from-a-relationship-s-target-uri">Resolving a Part Name from a Target URI</a>.
     * 
     * For more information about relationships, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {IOpcUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a> interface of the OPC URI object that represents the URI of the relationship source.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-getsourceuri
     */
    GetSourceUri() {
        result := ComCall(5, this, "ptr*", &sourceUri := 0, "HRESULT")
        return IOpcUri(sourceUri)
    }

    /**
     * Gets the URI of the relationship�target.
     * @remarks
     * The definitive way to find a part of interest is by using a relationship type.
     * 
     * Finding a part of interest requires several steps. For detailed information about finding a part, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/parts-overview">Parts Overview</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/finding-the-core-properties-part">Finding the Core Properties Part</a>.
     * 
     * To determine whether the target of the relationship is internal or external, call the <b>GetTargetUri</b> method.
     * 
     * If the relationship target is internal, the target is a part.
     * 
     * If the relationship target is a part, the URI in <i>targetUri</i> is relative to the URI of the relationship source.
     * 
     * If the relationship  target is a part, form the part name by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcuri-combineparturi">IOpcUri::CombinePartUri</a> method from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a> interface pointer received in <i>sourceUri</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-getsourceuri">GetSourceUri</a> method. Use the relative URI received in <i>targetUri</i> as the input parameter of the <b>IOpcUri::CombinePartUri</b> call. For an example, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/resolving-a-part-name-from-a-relationship-s-target-uri">Resolving a Part Name from a Target URI</a>.
     * 
     * For more information about relationships, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {IUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a> interface of the URI that represents the URI of the relationship's target.
     * 
     * If the relationship target is internal, the  target is a part and the URI of the target is relative to the URI of the source part.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-gettargeturi
     */
    GetTargetUri() {
        result := ComCall(6, this, "ptr*", &targetUri := 0, "HRESULT")
        return IUri(targetUri)
    }

    /**
     * Gets a value that describes whether the relationship's target is internal or external to the package.
     * @remarks
     * If the relationship target is internal, the  target is a part. The URI of the target is relative to the URI of the source part.
     * 
     * To get the URI of the target of the relationship, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-gettargeturi">IOpcRelationship::GetTargetUri</a> method.
     * 
     * The definitive way to find a part of interest is by using a relationship type.
     * 
     * Finding a part of interest requires several steps. For detailed information about finding a part, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/parts-overview">Parts Overview</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/finding-the-core-properties-part">Finding the Core Properties Part</a>.
     * 
     * For more information about relationships, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {OPC_URI_TARGET_MODE} A value  that describes whether the relationship's target is internal or external to the package.
     * 
     * If the target of the relationship is internal, the target is a part.
     * 
     * If the target of the relationship is external, the target is a resource outside of the package.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-gettargetmode
     */
    GetTargetMode() {
        result := ComCall(7, this, "int*", &targetMode := 0, "HRESULT")
        return targetMode
    }

    Query(iid) {
        if (IOpcRelationship.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 2)
        this.vtbl.GetRelationshipType := CallbackCreate(GetMethod(implObj, "GetRelationshipType"), flags, 2)
        this.vtbl.GetSourceUri := CallbackCreate(GetMethod(implObj, "GetSourceUri"), flags, 2)
        this.vtbl.GetTargetUri := CallbackCreate(GetMethod(implObj, "GetTargetUri"), flags, 2)
        this.vtbl.GetTargetMode := CallbackCreate(GetMethod(implObj, "GetTargetMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetRelationshipType)
        CallbackFree(this.vtbl.GetSourceUri)
        CallbackFree(this.vtbl.GetTargetUri)
        CallbackFree(this.vtbl.GetTargetMode)
    }
}
