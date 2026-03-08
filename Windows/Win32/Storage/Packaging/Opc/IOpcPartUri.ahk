#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcUri.ahk

/**
 * Represents the part name of a part.
 * @remarks
 * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
 * The behavior and performance of this interface is the same on all supported Windows versions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcparturi
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcPartUri extends IOpcUri{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcPartUri
     * @type {Guid}
     */
    static IID => Guid("{7d3babe7-88b2-46ba-85cb-4203cb016c87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ComparePartUri", "GetSourceUri", "IsRelationshipsPartUri"]

    /**
     * Returns an integer that indicates whether the URIs represented by the current part URI object and a specified part URI object are equivalent.
     * @remarks
     * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
     * The behavior and performance of this method is the same on all supported Windows versions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
     * @param {IOpcPartUri} partUri A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part URI object to compare with the current part URI object.
     * @returns {Integer} Receives an integer that indicates whether the two part URI objects are equivalent.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>&lt;0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current part URI object is less than the input part URI object that is passed in <i>partUri</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current part URI object is equivalent to the input part URI object that is passed in <i>partUri</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>&gt;0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current part URI object is greater than the input part URI object that is passed in <i>partUri</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcparturi-compareparturi
     */
    ComparePartUri(partUri) {
        result := ComCall(31, this, "ptr", partUri, "int*", &comparisonResult := 0, "HRESULT")
        return comparisonResult
    }

    /**
     * Gets the source URI of the relationships that are stored in a Relationships part. The current part URI object represents the part name of that Relationships part.
     * @remarks
     * If the current part URI object represents the part name of the Relationships part that stores package relationships ("/_rels/.rels"),  the OPC URI object returned in <i>sourceUri</i> will represent the package root ("/").
     *         
     * 
     * If the current part URI object is not the part name of a Relationships part,  this method fails with the <b>OPC_E_RELATIONSHIP_URI_REQUIRED</b> error. The syntax for Relationship part names is specified in the <i>OPC</i>.
     * 
     * The following table shows possible current part URIs and the source URI that would be returned by this method. <table>
     * <tr>
     * <th>Current Part URI </th>
     * <th>Current Part URI Description</th>
     * <th>Source URI</th>
     * <th>Source URI Description</th>
     * <th>Return Value</th>
     * </tr>
     * <tr>
     * <td>/mydoc/_rels/picture.jpg.rels</td>
     * <td>The part name of a  Relationships part</td>
     * <td>/mydoc/picture.jpg</td>
     * <td>The part name of the part that is the source of the relationships stored in the Relationships part that is represented by the current part URI object</td>
     * <td><b>S_OK</b></td>
     * </tr>
     * <tr>
     * <td>/_rels/.rels</td>
     * <td>The part name of a  Relationships part</td>
     * <td>/</td>
     * <td>The package root; the source of the relationships stored in the Relationships part that is represented by the current part URI object</td>
     * <td><b>S_OK</b></td>
     * </tr>
     * <tr>
     * <td>/mydoc/image/chart1.jpg</td>
     * <td>The part name of a  part that is not a Relationships part</td>
     * <td>Undefined</td>
     * <td> Undefined</td>
     * <td><b>OPC_E_RELATIONSHIP_URI_REQUIRED</b></td>
     * </tr>
     * <tr>
     * <td>/_rels/a.jpg</td>
     * <td>The part name of a  part that is not a Relationships part</td>
     * <td>Undefined</td>
     * <td> Undefined</td>
     * <td><b>OPC_E_RELATIONSHIP_URI_REQUIRED</b></td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
     * The behavior and performance of this method is the same on all supported Windows versions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
     * @returns {IOpcUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a> interface of the OPC URI object that represents the  URI of the source of the relationships stored in the Relationships part.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcparturi-getsourceuri
     */
    GetSourceUri() {
        result := ComCall(32, this, "ptr*", &sourceUri := 0, "HRESULT")
        return IOpcUri(sourceUri)
    }

    /**
     * Returns a value that indicates whether the current part URI object represents the part name of a Relationships part.
     * @remarks
     * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
     * The behavior and performance of this method is the same on all supported Windows versions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
     * @returns {BOOL} Receives a value that indicates whether the current part URI object represents the part name of a Relationships part.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current part URI object represents the part name of a Relationships part.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current part URI object does not represent the part name of a Relationships part.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcparturi-isrelationshipsparturi
     */
    IsRelationshipsPartUri() {
        result := ComCall(33, this, "int*", &isRelationshipUri := 0, "HRESULT")
        return isRelationshipUri
    }
}
