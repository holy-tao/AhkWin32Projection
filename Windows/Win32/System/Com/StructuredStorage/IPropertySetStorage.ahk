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
     * 
     * @param {Pointer<Guid>} rfmtid 
     * @param {Pointer<Guid>} pclsid 
     * @param {Integer} grfFlags 
     * @param {Integer} grfMode 
     * @returns {IPropertyStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/propidl/nf-propidl-ipropertysetstorage-create
     */
    Create(rfmtid, pclsid, grfFlags, grfMode) {
        result := ComCall(3, this, "ptr", rfmtid, "ptr", pclsid, "uint", grfFlags, "uint", grfMode, "ptr*", &ppprstg := 0, "HRESULT")
        return IPropertyStorage(ppprstg)
    }

    /**
     * 
     * @param {Pointer<Guid>} rfmtid 
     * @param {Integer} grfMode 
     * @returns {IPropertyStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/propidl/nf-propidl-ipropertysetstorage-open
     */
    Open(rfmtid, grfMode) {
        result := ComCall(4, this, "ptr", rfmtid, "uint", grfMode, "ptr*", &ppprstg := 0, "HRESULT")
        return IPropertyStorage(ppprstg)
    }

    /**
     * 
     * @param {Pointer<Guid>} rfmtid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propidl/nf-propidl-ipropertysetstorage-delete
     */
    Delete(rfmtid) {
        result := ComCall(5, this, "ptr", rfmtid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSTATPROPSETSTG} 
     * @see https://learn.microsoft.com/windows/win32/api/propidl/nf-propidl-ipropertysetstorage-enum
     */
    Enum() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATPROPSETSTG(ppenum)
    }
}
