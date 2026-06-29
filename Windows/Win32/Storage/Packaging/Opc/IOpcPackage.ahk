#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpcPartSet.ahk" { IOpcPartSet }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOpcRelationshipSet.ahk" { IOpcRelationshipSet }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a package and provides methods to access the package's parts and relationships.
 * @remarks
 * To get a pointer to this interface, call either the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcfactory-createpackage">IOpcFactory::CreatePackage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcfactory-readpackagefromstream">IOpcFactory::ReadPackageFromStream</a> method.
 * 
 * Package relationships serve as an entry point  to the package by  links from the package to target  resources. The target of a package relationship is often an important part described in the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i> or by the package format designer.
 * 
 * For example, a package relationship can provide access to the Core Properties part that stores package metadata, or to a part containing format-specific data, where the part and data are described by the package designer.  The Main Document part of the word processing OpenXML format is one such format-specific part. For more information about this part, see Part 1: Fundamentals in <a href="https://www.ecma-international.org/publications/standards/Ecma-376.htm">ECMA-376 OpenXML</a> (http://www.ecma-international.org/publications/standards/Ecma-376.htm).
 * 
 * The definitive way to find a part of interest is by using a relationship type. Several steps are required; for details, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/parts-overview">Parts Overview</a> and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/finding-the-core-properties-part">Finding the Core Properties Part</a> how-to task.
 * 
 * For more information about packages, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>OPC</i>.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcpackage
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcPackage extends IUnknown {
    /**
     * The interface identifier for IOpcPackage
     * @type {Guid}
     */
    static IID := Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee70}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcPackage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPartSet         : IntPtr
        GetRelationshipSet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcPackage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a part set object that contains IOpcPart interface pointers.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface is only used to represent parts in the package that are not Relationships parts.
     * 
     * For more information about packages, parts, relationships, and the interfaces that represent them, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {IOpcPartSet} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpartset">IOpcPartSet</a> interface of the part set object that contains <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface pointers to part objects.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpackage-getpartset
     */
    GetPartSet() {
        result := ComCall(3, this, "ptr*", &partSet := 0, "HRESULT")
        return IOpcPartSet(partSet)
    }

    /**
     * Gets a relationship set object that represents the Relationships part that stores package relationships.
     * @remarks
     * The Package relationships represented in the set provide the entry point to a package for an application.
     * 
     * For more information about packages, parts, relationships, and the interfaces that represent them, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
     * @returns {IOpcRelationshipSet} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipset">IOpcRelationshipSet</a> interface of the relationship set object. The set represents the Relationships part that stores package relationships.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcpackage-getrelationshipset
     */
    GetRelationshipSet() {
        result := ComCall(4, this, "ptr*", &relationshipSet := 0, "HRESULT")
        return IOpcRelationshipSet(relationshipSet)
    }

    Query(iid) {
        if (IOpcPackage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPartSet := CallbackCreate(GetMethod(implObj, "GetPartSet"), flags, 2)
        this.vtbl.GetRelationshipSet := CallbackCreate(GetMethod(implObj, "GetRelationshipSet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPartSet)
        CallbackFree(this.vtbl.GetRelationshipSet)
    }
}
