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
     * 
     * @param {IOpcPartUri} partUri 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcparturi-compareparturi
     */
    ComparePartUri(partUri) {
        result := ComCall(31, this, "ptr", partUri, "int*", &comparisonResult := 0, "HRESULT")
        return comparisonResult
    }

    /**
     * 
     * @returns {IOpcUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcparturi-getsourceuri
     */
    GetSourceUri() {
        result := ComCall(32, this, "ptr*", &sourceUri := 0, "HRESULT")
        return IOpcUri(sourceUri)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcparturi-isrelationshipsparturi
     */
    IsRelationshipsPartUri() {
        result := ComCall(33, this, "int*", &isRelationshipUri := 0, "HRESULT")
        return isRelationshipUri
    }
}
