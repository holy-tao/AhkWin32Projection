#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMDSPStorage2.ahk" { IMDSPStorage2 }
#Import ".\IWMDMMetaData.ahk" { IWMDMMetaData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMDSPStorage3 interface extends IMDSPStorage2 by supporting metadata.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdspstorage3
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDSPStorage3 extends IMDSPStorage2 {
    /**
     * The interface identifier for IMDSPStorage3
     * @type {Guid}
     */
    static IID := Guid("{6c669867-97ed-4a67-9706-1c5529d2a414}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDSPStorage3 interfaces
    */
    struct Vtbl extends IMDSPStorage2.Vtbl {
        GetMetadata : IntPtr
        SetMetadata : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDSPStorage3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetMetadata method retrieves metadata from the service provider.
     * @remarks
     * The service provider calls <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmmetadata-additem">IWMDMMetaData::AddItem</a> for each of the metadata properties to be sent to the application. The service provider should use the predefined metadata name tags (g_wszWMDMTitle, g_wszAlbumTitle, g_dwBitrate, and so on) contained in the mswmdm.h file.
     * @param {IWMDMMetaData} pMetadata Pointer to an <b>IWMDMMetaData</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage3-getmetadata
     */
    GetMetadata(pMetadata) {
        result := ComCall(17, this, "ptr", pMetadata, "HRESULT")
        return result
    }

    /**
     * The SetMetadata method provides the metadata associated with a specified content.
     * @remarks
     * A service provider calls <b>IWMDMMetaData::QueryByName</b> or <b>IWMDMMetaData::QueryByIndex</b> to retrieve the metadata.
     * @param {IWMDMMetaData} pMetadata Pointer to an <b>IWMDMMetadata</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded, which indicates that SP has successfully processed the metadata.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support setting metadata.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorage3-setmetadata
     */
    SetMetadata(pMetadata) {
        result := ComCall(18, this, "ptr", pMetadata, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMDSPStorage3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMetadata := CallbackCreate(GetMethod(implObj, "GetMetadata"), flags, 2)
        this.vtbl.SetMetadata := CallbackCreate(GetMethod(implObj, "SetMetadata"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMetadata)
        CallbackFree(this.vtbl.SetMetadata)
    }
}
