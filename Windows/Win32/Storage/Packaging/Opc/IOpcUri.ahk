#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUri.ahk" { IUri }

/**
 * Represents the URI of the package root or of a part that is relative to the package root.
 * @remarks
 * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
 * The behavior and performance of this interface is the same on all supported Windows versions. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcuri
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcUri extends IUri {
    /**
     * The interface identifier for IOpcUri
     * @type {Guid}
     */
    static IID := Guid("{bc9c1b9b-d62c-49eb-aef0-3b4e0b28ebed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcUri interfaces
    */
    struct Vtbl extends IUri.Vtbl {
        GetRelationshipsPartUri : IntPtr
        GetRelativeUri          : IntPtr
        CombinePartUri          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcUri.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the part name of the Relationships part that stores relationships that have the source URI represented by the current OPC URI object.
     * @remarks
     * The following table shows Relationships part URIs for some OPC URIs.<table>
     * <tr>
     * <th>OPC URI</th>
     * <th>Relationships Part Name</th>
     * <th> Return Value</th>
     * </tr>
     * <tr>
     * <td>/mydoc/images/picture.jpg</td>
     * <td>/mydoc/images/_rels/picture.jpg.rels</td>
     * <td><b>S_OK</b></td>
     * </tr>
     * <tr>
     * <td>/</td>
     * <td>/_rels/.rels</td>
     * <td><b>S_OK</b></td>
     * </tr>
     * <tr>
     * <td>/mydoc/images/_rels/picture.jpg.rels</td>
     * <td>Undefined</td>
     * <td><b>OPC_E_NONCONFORMING_URI</b></td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
     * The behavior and performance of this method is the same on all supported Windows versions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part URI object that represents the part name of the Relationships part. The source URI of the relationships stored in this Relationships part is represented by the  current OPC URI object.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcuri-getrelationshipsparturi
     */
    GetRelationshipsPartUri() {
        result := ComCall(28, this, "ptr*", &relationshipPartUri := 0, "HRESULT")
        return IOpcPartUri(relationshipPartUri)
    }

    /**
     * Forms a relative URI for a specified part, relative to the URI represented by the current OPC URI object.
     * @remarks
     * Example input and output:
     * 
     * 
     * <table>
     * <tr>
     * <th>Input <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> represents</th>
     * <th>Current <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a> represents</th>
     * <th>Returned relative <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a> represents</th>
     * </tr>
     * <tr>
     * <td>/mydoc/markup/page.xml</td>
     * <td>	/mydoc/markup/picture.jpg	</td>
     * <td>picture.jpg</td>
     * </tr>
     * <tr>
     * <td>/mydoc/markup/page.xml</td>
     * <td>/mydoc/picture.jpg</td>
     * <td>../picture.jpg</td>
     * </tr>
     * <tr>
     * <td>/mydoc/markup/page.xml</td>
     * <td>/mydoc/images/pictures.jpg</td>
     * <td>../images/pictures.jpg</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
     * The behavior and performance of this method is the same on all supported Windows versions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
     * @param {IOpcPartUri} targetPartUri A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part URI object that represents the part name from which the relative URI is formed.
     * @returns {IUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a> interface of the URI of the part, relative to the current OPC URI object.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcuri-getrelativeuri
     */
    GetRelativeUri(targetPartUri) {
        result := ComCall(29, this, "ptr", targetPartUri, "ptr*", &relativeUri := 0, "HRESULT")
        return IUri(relativeUri)
    }

    /**
     * Forms the part name of the part that is referenced by the specified relative URI.
     * @remarks
     * Example input and output:
     * 
     * 
     * <table>
     * <tr>
     * <th>Input relative <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a></th>
     * <th>Current <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a>
     * </th>
     * <th>Formed <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a>
     * </th>
     * </tr>
     * <tr>
     * <td>picture.jpg</td>
     * <td>/mydoc/markup/page.xml</td>
     * <td>/mydoc/markup/picture.jpg</td>
     * </tr>
     * <tr>
     * <td>../picture.jpg</td>
     * <td>/mydoc/markup/page.xml</td>
     * <td>/mydoc/picture.jpg</td>
     * </tr>
     * <tr>
     * <td>../../images/picture.jpg</td>
     * <td>/mydoc/page.xml</td>
     * <td>/images/picture.jpg</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * For information about how to use this method to help resolve a part name, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/resolving-a-part-name-from-a-relationship-s-target-uri">Resolving a Part Name from a Target URI</a>.
     * 
     * <h3><a id="Support_on__Previous_Windows_Versions"></a><a id="support_on__previous_windows_versions"></a><a id="SUPPORT_ON__PREVIOUS_WINDOWS_VERSIONS"></a>Support on  Previous Windows Versions</h3>
     * The behavior and performance of this method is the same on all supported Windows versions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
     * @param {IUri} relativeUri A pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a> interface of the relative URI of the part.
     * 
     * To form the part URI object that represents the part name, this input URI is resolved against the URI represented as the current OPC URI object. Therefore, the input URI must be relative to the URI represented by the current OPC URI object.
     * 
     * This URI may include a fragment component; however, the fragment will be ignored and will not be included in the part name to be formed. A fragment component is preceded by a '#', as described in <a href="https://www.ietf.org/rfc/rfc3986.txt">RFC 3986: URI Generic Syntax</a>.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part URI object that represents the part name.
     *             
     * 
     * The part URI object is formed by resolving the relative URI in <i>relativeUri</i> against the URI represented by the current OPC URI object.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcuri-combineparturi
     */
    CombinePartUri(relativeUri) {
        result := ComCall(30, this, "ptr", relativeUri, "ptr*", &combinedUri := 0, "HRESULT")
        return IOpcPartUri(combinedUri)
    }

    Query(iid) {
        if (IOpcUri.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRelationshipsPartUri := CallbackCreate(GetMethod(implObj, "GetRelationshipsPartUri"), flags, 2)
        this.vtbl.GetRelativeUri := CallbackCreate(GetMethod(implObj, "GetRelativeUri"), flags, 3)
        this.vtbl.CombinePartUri := CallbackCreate(GetMethod(implObj, "CombinePartUri"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRelationshipsPartUri)
        CallbackFree(this.vtbl.GetRelativeUri)
        CallbackFree(this.vtbl.CombinePartUri)
    }
}
