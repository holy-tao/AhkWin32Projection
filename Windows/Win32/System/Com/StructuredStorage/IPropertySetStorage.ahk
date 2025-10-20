#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} rfmtid 
     * @param {Pointer<Guid>} pclsid 
     * @param {Integer} grfFlags 
     * @param {Integer} grfMode 
     * @param {Pointer<IPropertyStorage>} ppprstg 
     * @returns {HRESULT} 
     */
    Create(rfmtid, pclsid, grfFlags, grfMode, ppprstg) {
        result := ComCall(3, this, "ptr", rfmtid, "ptr", pclsid, "uint", grfFlags, "uint", grfMode, "ptr", ppprstg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfmtid 
     * @param {Integer} grfMode 
     * @param {Pointer<IPropertyStorage>} ppprstg 
     * @returns {HRESULT} 
     */
    Open(rfmtid, grfMode, ppprstg) {
        result := ComCall(4, this, "ptr", rfmtid, "uint", grfMode, "ptr", ppprstg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rfmtid 
     * @returns {HRESULT} 
     */
    Delete(rfmtid) {
        result := ComCall(5, this, "ptr", rfmtid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATPROPSETSTG>} ppenum 
     * @returns {HRESULT} 
     */
    Enum(ppenum) {
        result := ComCall(6, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
