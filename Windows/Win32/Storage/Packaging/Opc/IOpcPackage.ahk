#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcPartSet.ahk
#Include .\IOpcRelationshipSet.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a package and provides methods to access the package's parts and relationships.
 * @remarks
 * 
 * To get a pointer to this interface, call either the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcfactory-createpackage">IOpcFactory::CreatePackage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcfactory-readpackagefromstream">IOpcFactory::ReadPackageFromStream</a> method.
 * 
 * Package relationships serve as an entry point  to the package by  links from the package to target  resources. The target of a package relationship is often an important part described in the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i> or by the package format designer.
 * 
 * For example, a package relationship can provide access to the Core Properties part that stores package metadata, or to a part containing format-specific data, where the part and data are described by the package designer.  The Main Document part of the word processing OpenXML format is one such format-specific part. For more information about this part, see Part 1: Fundamentals in <a href="https://www.ecma-international.org/publications/standards/Ecma-376.htm">ECMA-376 OpenXML</a> (http://www.ecma-international.org/publications/standards/Ecma-376.htm).
 * 
 * The definitive way to find a part of interest is by using a relationship type. Several steps are required; for details, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/parts-overview">Parts Overview</a> and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/finding-the-core-properties-part">Finding the Core Properties Part</a> how-to task.
 * 
 * For more information about packages, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>OPC</i>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcpackage
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcPackage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcPackage
     * @type {Guid}
     */
    static IID => Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPartSet", "GetRelationshipSet"]

    /**
     * 
     * @returns {IOpcPartSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpackage-getpartset
     */
    GetPartSet() {
        result := ComCall(3, this, "ptr*", &partSet := 0, "HRESULT")
        return IOpcPartSet(partSet)
    }

    /**
     * 
     * @returns {IOpcRelationshipSet} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpackage-getrelationshipset
     */
    GetRelationshipSet() {
        result := ComCall(4, this, "ptr*", &relationshipSet := 0, "HRESULT")
        return IOpcRelationshipSet(relationshipSet)
    }
}
