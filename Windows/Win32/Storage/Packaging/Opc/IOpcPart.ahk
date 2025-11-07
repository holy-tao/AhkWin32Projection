#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcRelationshipSet.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include .\IOpcPartUri.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a part that contains data and is not a Relationships part.
 * @remarks
 * 
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
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcpart
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcPart extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcPart
     * @type {Guid}
     */
    static IID => Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRelationshipSet", "GetContentStream", "GetName", "GetContentType", "GetCompressionOptions"]

    /**
     * 
     * @returns {IOpcRelationshipSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getrelationshipset
     */
    GetRelationshipSet() {
        result := ComCall(3, this, "ptr*", &relationshipSet := 0, "HRESULT")
        return IOpcRelationshipSet(relationshipSet)
    }

    /**
     * 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getcontentstream
     */
    GetContentStream() {
        result := ComCall(4, this, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    /**
     * 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getname
     */
    GetName() {
        result := ComCall(5, this, "ptr*", &name := 0, "HRESULT")
        return IOpcPartUri(name)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getcontenttype
     */
    GetContentType() {
        result := ComCall(6, this, "ptr*", &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpart-getcompressionoptions
     */
    GetCompressionOptions() {
        result := ComCall(7, this, "int*", &compressionOptions := 0, "HRESULT")
        return compressionOptions
    }
}
