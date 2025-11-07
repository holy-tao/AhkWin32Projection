#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcUri.ahk
#Include ..\..\..\System\Com\IUri.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a relationship, which is a link between a source, which is a part or the package, and a target.
 * @remarks
 * 
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
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcrelationship
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcRelationship extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcRelationship
     * @type {Guid}
     */
    static IID => Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetRelationshipType", "GetSourceUri", "GetTargetUri", "GetTargetMode"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-getid
     */
    GetId() {
        result := ComCall(3, this, "ptr*", &relationshipIdentifier := 0, "HRESULT")
        return relationshipIdentifier
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-getrelationshiptype
     */
    GetRelationshipType() {
        result := ComCall(4, this, "ptr*", &relationshipType := 0, "HRESULT")
        return relationshipType
    }

    /**
     * 
     * @returns {IOpcUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-getsourceuri
     */
    GetSourceUri() {
        result := ComCall(5, this, "ptr*", &sourceUri := 0, "HRESULT")
        return IOpcUri(sourceUri)
    }

    /**
     * 
     * @returns {IUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-gettargeturi
     */
    GetTargetUri() {
        result := ComCall(6, this, "ptr*", &targetUri := 0, "HRESULT")
        return IUri(targetUri)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationship-gettargetmode
     */
    GetTargetMode() {
        result := ComCall(7, this, "int*", &targetMode := 0, "HRESULT")
        return targetMode
    }
}
