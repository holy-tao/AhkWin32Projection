#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcPart.ahk
#Include .\IOpcPartEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An unordered set of IOpcPart interface pointers to part objects that represent the parts in a package that are not Relationships parts.
 * @remarks
 * 
 * To retrieve the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface pointer of the part object that represents a specific part, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpartset-partexists">PartExists</a> method and pass in the part name to confirm that the part is represented in the set. If it is, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpartset-getpart">GetPart</a> method and pass in the part name to retrieve the <b>IOpcPart</b> interface pointer.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcpartset-createpart">CreatePart</a> method cannot create a part object that represents a Relationships part.
 * 
 * When a package that is represented as a package object is serialized, only the parts that are represented by part objects with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface pointers included in the set are serialized with the package.
 * 
 * If a part is not represented by a part object in the set when the package is serialized, that part will not be serialized with the package.
 * 
 * When a part object is created and a pointer to it is added to the set, the part it represents is serialized when the package is serialized.
 * 
 * When an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface pointer is deleted from the set, the part it represents is not serialized when the package is serialized.
 * 
 * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> provides access to the properties of the part. For details about these properties, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/parts-overview">Parts Overview</a> and <b>IOpcPart</b>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcpartset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcPartSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcPartSet
     * @type {Guid}
     */
    static IID => Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPart", "CreatePart", "DeletePart", "PartExists", "GetEnumerator"]

    /**
     * Gets a part object, which represents a specified part, in the set.
     * @param {IOpcPartUri} name A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part URI object that represents the part name of a part.
     * @returns {IOpcPart} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> of the part object that represents the part that has the specified part name.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcpartset-getpart
     */
    GetPart(name) {
        result := ComCall(3, this, "ptr", name, "ptr*", &part := 0, "HRESULT")
        return IOpcPart(part)
    }

    /**
     * Creates a part object that represents a part and adds a pointer to the object's IOpcPart interface to the set.
     * @param {IOpcPartUri} name A pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of a part URI object that represents the part name of the part.
     * 
     * To create  a part URI object (which implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface) to represent the part name of the part, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcfactory-createparturi">IOpcFactory::CreatePartUri</a> method.
     * @param {PWSTR} contentType The media type of part content.
     * @param {Integer} compressionOptions A value that describes the way to compress the part content of the part.
     * @returns {IOpcPart} A pointer to the new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> that represents the part.
     * 
     * This parameter cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcpartset-createpart
     */
    CreatePart(name, contentType, compressionOptions) {
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(4, this, "ptr", name, "ptr", contentType, "int", compressionOptions, "ptr*", &part := 0, "HRESULT")
        return IOpcPart(part)
    }

    /**
     * Deletes the IOpcPart interface pointer of a specified part object from the set.
     * @param {IOpcPartUri} name A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part URI object that represents the part name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>name</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OPC_E_NO_SUCH_PART</b></dt>
     * <dt>0x80510018</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified part does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Package Consumption error</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <b>HRESULT</b> error code from the <a href="/previous-versions/windows/desktop/opc/package-consumption-error-group">Package Consumption Error Group</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Part URI error</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <b>HRESULT</b> error code from the <a href="/previous-versions/windows/desktop/opc/part-uri-error-group">Part URI Error Group</a>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcpartset-deletepart
     */
    DeletePart(name) {
        result := ComCall(5, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether a specified part is represented as a part object in the set.
     * @param {IOpcPartUri} name A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a>  that represents the part name of the part.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcpartset-partexists
     */
    PartExists(name) {
        result := ComCall(6, this, "ptr", name, "int*", &partExists := 0, "HRESULT")
        return partExists
    }

    /**
     * Gets an enumerator of IOpcPart interface pointers in the set.
     * @returns {IOpcPartEnumerator} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpartenumerator">IOpcPartEnumerator</a> interface of the enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface pointers in the set.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcpartset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(7, this, "ptr*", &partEnumerator := 0, "HRESULT")
        return IOpcPartEnumerator(partEnumerator)
    }
}
