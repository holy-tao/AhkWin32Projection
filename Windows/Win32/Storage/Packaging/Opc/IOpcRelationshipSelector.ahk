#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents how to select, from a Relationships part, the relationships to be referenced for signing.
 * @remarks
 * 
 * To create an 
 * 				 <b>IOpcRelationshipSelector</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipselectorset-create">IOpcRelationshipSelectorSet::Create</a> method.
 * 
 * To access an <b>IOpcRelationshipSelector</b>, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipselectorenumerator-getcurrent">IOpcRelationshipSelectorEnumerator::GetCurrent</a> method.
 * 
 * Use the <b>IOpcRelationshipSelector</b> interface methods to select relationships for signing. A relationship is selected if its type or identifier matches the string that is retrieved by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipselector-getselectioncriterion">GetSelectionCriterion</a> method. This string is either a relationship type or a relationship identifier.  Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipselector-getselectortype">GetSelectorType</a> method to get an <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_relationship_selector">OPC_RELATIONSHIP_SELECTOR</a> value to determine whether the string is a relationship type or an identifier. To access these relationship properties, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-getrelationshiptype">IOpcRelationship::GetRelationshipType</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationship-getid">IOpcRelationship::GetId</a> methods.
 * 
 * The following table shows how <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_relationship_selector">OPC_RELATIONSHIP_SELECTOR</a> values map to the relationship type and relationship identifier properties.<table>
 * <tr>
 * <th>
 * <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_relationship_selector">OPC_RELATIONSHIP_SELECTOR</a>  Value</th>
 * <th>Relationship Property</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td><b>OPC_RELATIONSHIP_SELECT_BY_TYPE</b></td>
 * <td>Relationship type</td>
 * <td>
 * Selects relationships that have a relationship type that matches <i>selectionCriterion</i> string.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td><b>OPC_RELATIONSHIP_SELECT_BY_ID</b></td>
 * <td>Relationship identifier</td>
 * <td>
 * Selects relationships that have a relationship identifier that matches <i>selectionCriterion</i> string.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * When a signature is generated, the relationship selection information provided by the interface is serialized in the XML markup of the signature (signature markup). In signature markup, this information is represented by the  <b>RelationshipReference</b> and <b>RelationshipGroupReference</b> elements, which are specified in section 12. Digital Signatures in the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>. The following table shows how the elements map to relationship properties and to <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_relationship_selector">OPC_RELATIONSHIP_SELECTOR</a> values.<table>
 * <tr>
 * <th>Package signature element</th>
 * <th>Relationship Property</th>
 * <th>
 * <a href="https://docs.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_relationship_selector">OPC_RELATIONSHIP_SELECTOR</a>  Value</th>
 * </tr>
 * <tr>
 * <td><b>RelationshipGroupReference</b></td>
 * <td>Relationship type</td>
 * <td><b>OPC_RELATIONSHIP_SELECT_BY_TYPE</b></td>
 * </tr>
 * <tr>
 * <td><b>RelationshipReference</b></td>
 * <td>Relationship identifier</td>
 * <td><b>OPC_RELATIONSHIP_SELECT_BY_ID</b></td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcrelationshipselector
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcRelationshipSelector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcRelationshipSelector
     * @type {Guid}
     */
    static IID => Guid("{f8f26c7f-b28f-4899-84c8-5d5639ede75f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSelectorType", "GetSelectionCriterion"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselector-getselectortype
     */
    GetSelectorType() {
        result := ComCall(3, this, "int*", &selector := 0, "HRESULT")
        return selector
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselector-getselectioncriterion
     */
    GetSelectionCriterion() {
        result := ComCall(4, this, "ptr*", &selectionCriterion := 0, "HRESULT")
        return selectionCriterion
    }
}
