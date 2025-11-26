#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyStorage.ahk
#Include .\IEnumSTATPROPSETSTG.ahk
#Include ..\IUnknown.ahk

/**
 * The IPropertySetStorage interface creates, opens, deletes, and enumerates property set storages that support instances of the IPropertyStorage interface.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  There is an exception to the above in The DocumentSummaryInformation and UserDefined property set. This property set is unique in that it may have two property set sections in a single underlying stream. This property set is described in <a href="https://docs.microsoft.com/windows/desktop/Stg/the-documentsummaryinformation-and-userdefined-property-sets">The DocumentSummaryInformation and UserDefined Property Sets</a>. The first section is the DocumentSummaryInformation property set. The second section is the UserDefined property set. Each section is identified by a unique format identifier (FMTID).  For example, FMTID_DocSummaryInformation and FMTID_UserDefined property set. The fact that these two property sets can exist in a single stream affects the behavior of the <b>IPropertySetStorage</b> interface.<p class="note">When <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a> is called to create the UserDefined property set, the first section is created automatically. Once the FMTID_UserDefinedProperties is created, FMTID_DocSummaryInformation need not be created, but can be operend with a call to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-open">IPropertySetStorage::Open</a>. Creating the first section does not automatically create the second section and it is not possible to open both sections simultaneously.
 * 
 * <p class="note">Calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-delete">IPropertySetStorage::Delete</a>, to delete the first section, causes both sections to be deleted.  In other words, calling <b>IPropertySetStorage::Delete</b> with FMTID_DocSummaryInformation causes both that section and the FMTID_UserDefinedProperties section to be deleted. However, deleting the second section does not automatically delete the first section.
 * 
 * <p class="note">When <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-enum">IPropertySetStorage::Enum</a> is used to enumerate property sets, the UserDefined property set is not enumerated.
 * 
 * </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propidl/nn-propidl-ipropertysetstorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IPropertySetStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySetStorage
     * @type {Guid}
     */
    static IID => Guid("{0000013a-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "Open", "Delete", "Enum"]

    /**
     * Creates and opens a new property set in the property set storage object.
     * @param {Pointer<Guid>} rfmtid The FMTID of the property set to be created. For information about FMTIDs that are well-known and predefined in the Platform SDK, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/predefined-property-set-format-identifiers">Predefined Property Set Format Identifiers</a>.
     * @param {Pointer<Guid>} pclsid A pointer to the initial class identifier CLSID for this property set. May be <b>NULL</b>, in which case it is set to all zeroes. The CLSID is the CLSID of a class that displays and/or provides programmatic access to the property values. If there is no such class, it is recommended that the FMTID be used.
     * @param {Integer} grfFlags The values from <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>.
     * @param {Integer} grfMode An access mode in which the newly created property set is to be opened, taken from certain values of <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM_Constants</a>, as described in the following Remarks section.
     * @returns {IPropertyStorage} A pointer to the output variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//propidl/nf-propidl-ipropertysetstorage-create
     */
    Create(rfmtid, pclsid, grfFlags, grfMode) {
        result := ComCall(3, this, "ptr", rfmtid, "ptr", pclsid, "uint", grfFlags, "uint", grfMode, "ptr*", &ppprstg := 0, "HRESULT")
        return IPropertyStorage(ppprstg)
    }

    /**
     * Opens a property set contained in the property set storage object.
     * @param {Pointer<Guid>} rfmtid The format identifier (FMTID) of the property set to be opened. For more information about well-known and predefined FMTIDs in the Platform SDK, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/predefined-property-set-format-identifiers">Predefined Property Set Format Identifiers</a>.
     * @param {Integer} grfMode The access mode in which the newly created property set is to be opened. These flags are taken from <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. Flags that may be used and their meanings in the context of this method are described in the following Remarks section.
     * @returns {IPropertyStorage} A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> pointer variable that receives the interface pointer to the requested property storage subobject.
     * @see https://docs.microsoft.com/windows/win32/api//propidl/nf-propidl-ipropertysetstorage-open
     */
    Open(rfmtid, grfMode) {
        result := ComCall(4, this, "ptr", rfmtid, "uint", grfMode, "ptr*", &ppprstg := 0, "HRESULT")
        return IPropertyStorage(ppprstg)
    }

    /**
     * The Delete method deletes one of the property sets contained in the property set storage object.
     * @param {Pointer<Guid>} rfmtid FMTID of the property set to be deleted.
     * @returns {HRESULT} This method supports the standard return value E_UNEXPECTED, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//propidl/nf-propidl-ipropertysetstorage-delete
     */
    Delete(rfmtid) {
        result := ComCall(5, this, "ptr", rfmtid, "HRESULT")
        return result
    }

    /**
     * The Enum method creates an enumerator object which contains information on the property sets stored in this property set storage. On return, this method supplies a pointer to the IEnumSTATPROPSETSTG pointer on the enumerator object.
     * @returns {IEnumSTATPROPSETSTG} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ienumstatpropsetstg">IEnumSTATPROPSETSTG</a> pointer variable that receives the interface pointer to the newly created enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//propidl/nf-propidl-ipropertysetstorage-enum
     */
    Enum() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATPROPSETSTG(ppenum)
    }
}
