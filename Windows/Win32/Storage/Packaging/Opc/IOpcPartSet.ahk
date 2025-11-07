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
     * 
     * @param {IOpcPartUri} name 
     * @returns {IOpcPart} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartset-getpart
     */
    GetPart(name) {
        result := ComCall(3, this, "ptr", name, "ptr*", &part := 0, "HRESULT")
        return IOpcPart(part)
    }

    /**
     * 
     * @param {IOpcPartUri} name 
     * @param {PWSTR} contentType 
     * @param {Integer} compressionOptions 
     * @returns {IOpcPart} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartset-createpart
     */
    CreatePart(name, contentType, compressionOptions) {
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(4, this, "ptr", name, "ptr", contentType, "int", compressionOptions, "ptr*", &part := 0, "HRESULT")
        return IOpcPart(part)
    }

    /**
     * 
     * @param {IOpcPartUri} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartset-deletepart
     */
    DeletePart(name) {
        result := ComCall(5, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} name 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartset-partexists
     */
    PartExists(name) {
        result := ComCall(6, this, "ptr", name, "int*", &partExists := 0, "HRESULT")
        return partExists
    }

    /**
     * 
     * @returns {IOpcPartEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpartset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(7, this, "ptr*", &partEnumerator := 0, "HRESULT")
        return IOpcPartEnumerator(partEnumerator)
    }
}
