#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcUri.ahk

/**
 * Represents the part name of a part.
 * @remarks
 * 
 * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
 * The behavior and performance of this interface is the same on all supported Windows versions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcparturi
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
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcparturi-compareparturi
     */
    ComparePartUri(partUri) {
        result := ComCall(31, this, "ptr", partUri, "int*", &comparisonResult := 0, "HRESULT")
        return comparisonResult
    }

    /**
     * Gets the source URI of the relationships that are stored in a Relationships part. The current part URI object represents the part name of that Relationships part.
     * @returns {IOpcUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a> interface of the OPC URI object that represents the  URI of the source of the relationships stored in the Relationships part.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcparturi-getsourceuri
     */
    GetSourceUri() {
        result := ComCall(32, this, "ptr*", &sourceUri := 0, "HRESULT")
        return IOpcUri(sourceUri)
    }

    /**
     * Returns a value that indicates whether the current part URI object represents the part name of a Relationships part.
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
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcparturi-isrelationshipsparturi
     */
    IsRelationshipsPartUri() {
        result := ComCall(33, this, "int*", &isRelationshipUri := 0, "HRESULT")
        return isRelationshipUri
    }
}
