#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcPartUri.ahk
#Include ..\..\..\System\Com\IUri.ahk

/**
 * Represents the URI of the package root or of a part that is relative to the package root.
 * @remarks
 * 
  * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
  * The behavior and performance of this interface is the same on all supported Windows versions. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcuri
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcUri extends IUri{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcUri
     * @type {Guid}
     */
    static IID => Guid("{bc9c1b9b-d62c-49eb-aef0-3b4e0b28ebed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRelationshipsPartUri", "GetRelativeUri", "CombinePartUri"]

    /**
     * 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcuri-getrelationshipsparturi
     */
    GetRelationshipsPartUri() {
        result := ComCall(28, this, "ptr*", &relationshipPartUri := 0, "HRESULT")
        return IOpcPartUri(relationshipPartUri)
    }

    /**
     * 
     * @param {IOpcPartUri} targetPartUri 
     * @returns {IUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcuri-getrelativeuri
     */
    GetRelativeUri(targetPartUri) {
        result := ComCall(29, this, "ptr", targetPartUri, "ptr*", &relativeUri := 0, "HRESULT")
        return IUri(relativeUri)
    }

    /**
     * 
     * @param {IUri} relativeUri 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcuri-combineparturi
     */
    CombinePartUri(relativeUri) {
        result := ComCall(30, this, "ptr", relativeUri, "ptr*", &combinedUri := 0, "HRESULT")
        return IOpcPartUri(combinedUri)
    }
}
