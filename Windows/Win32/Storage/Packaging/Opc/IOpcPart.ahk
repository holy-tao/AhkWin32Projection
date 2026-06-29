#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\OPC_COMPRESSION_OPTIONS.ahk" { OPC_COMPRESSION_OPTIONS }
#Import ".\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOpcRelationshipSet.ahk" { IOpcRelationshipSet }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a part that contains data and is not a Relationships part.
 * @remarks
 * To create a part object to represent a part, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpartset-createpart">IOpcPartSet::CreatePart</a> method. To get a pointer to the interface of a part object that represents an existing part, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpartset-getpart">IOpcPartSet::GetPart</a> or  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpartenumerator-getcurrent">IOpcPartEnumerator::GetCurrent</a> method.
 * 
 * A Relationships part cannot be represented by an implementation of the <b>IOpcPart</b> interface.
 * 
 * Methods of an <b>IOpcPart</b> interface provide access to part information through the properties listed in the following table:
 * 
 * <table>
 * <tr>
 * <th>Method</th>
 * <th>Property</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpart-getcompressionoptions">GetCompressionOptions</a>
 * </td>
 * <td>Compression </td>
 * <td>
 * The compression option to be used on part content.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpart-getcontentstream">GetContentStream</a>
 * </td>
 * <td>Content</td>
 * <td>
 * The stream of bytes that makes up the part as described in the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpart-getcontenttype">GetContentType</a>
 * </td>
 * <td>Content type</td>
 * <td>
 * The media type of the part content, as specified by the package designer in compliance with the rules in the <i>OPC</i>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpart-getname">GetName</a>
 * </td>
 * <td>Name</td>
 * <td>
 * The URI of the part in the package. 
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information about parts, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>OPC</i>.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcpart
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcPart extends IUnknown {
    /**
     * The interface identifier for IOpcPart
     * @type {Guid}
     */
    static IID := Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee71}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcPart interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRelationshipSet    : IntPtr
        GetContentStream      : IntPtr
        GetName               : IntPtr
        GetContentType        : IntPtr
        GetCompressionOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcPart.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a relationship set object that represents the Relationships part that stores relationships that have the part as their source.
     * @remarks
     * The definitive way to find a part of interest is by using a relationship type to find the relationship that has the part of interest as its target. The target's URI can then be resolved to a part name which is used to access the part.
     * 
     * For more information about using the relationship type to find a relationship and then a part of interest, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipset">IOpcRelationshipSet</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a>.
     * 
     * For more information about parts and relationships, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {IOpcRelationshipSet} A pointer to a relationship set object that represents the Relationships part  that stores all relationships that have the part as their source.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getrelationshipset
     */
    GetRelationshipSet() {
        result := ComCall(3, this, "ptr*", &relationshipSet := 0, "HRESULT")
        return IOpcRelationshipSet(relationshipSet)
    }

    /**
     * Gets a stream that provides read/write access to part content.
     * @remarks
     * For more information about parts, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {IStream} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface of a stream that provides read and write access to part content.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getcontentstream
     */
    GetContentStream() {
        result := ComCall(4, this, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    /**
     * Gets a part URI object that represents the part name.
     * @remarks
     * For more information about parts, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>OPC</i>.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part URI object that represents the part name.
     * 
     * Part names conform to specific syntax specified in the <i>OPC</i>.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getname
     */
    GetName() {
        result := ComCall(5, this, "ptr*", &name := 0, "HRESULT")
        return IOpcPartUri(name)
    }

    /**
     * Gets the media type of part content.
     * @remarks
     * This method allocates memory used by the string returned in <i>contentType</i>.  If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory.
     * 
     * For more information about parts, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {PWSTR} The media  type of part content, as specified by the package format designer and adhering to <a href="https://www.w3.org/Protocols/rfc2616/rfc2616.html">RFC 2616: HTTP/1.1</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getcontenttype
     */
    GetContentType() {
        result := ComCall(6, this, PWSTR.Ptr, &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * Gets a value that describes the way part content is compressed.
     * @remarks
     * For more information about parts, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {OPC_COMPRESSION_OPTIONS} A value that describes the way part content is compressed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getcompressionoptions
     */
    GetCompressionOptions() {
        result := ComCall(7, this, "int*", &compressionOptions := 0, "HRESULT")
        return compressionOptions
    }

    Query(iid) {
        if (IOpcPart.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRelationshipSet := CallbackCreate(GetMethod(implObj, "GetRelationshipSet"), flags, 2)
        this.vtbl.GetContentStream := CallbackCreate(GetMethod(implObj, "GetContentStream"), flags, 2)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetContentType := CallbackCreate(GetMethod(implObj, "GetContentType"), flags, 2)
        this.vtbl.GetCompressionOptions := CallbackCreate(GetMethod(implObj, "GetCompressionOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRelationshipSet)
        CallbackFree(this.vtbl.GetContentStream)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetContentType)
        CallbackFree(this.vtbl.GetCompressionOptions)
    }
}
