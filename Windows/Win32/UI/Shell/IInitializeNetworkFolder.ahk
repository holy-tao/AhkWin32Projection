#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that initializes the network data source CLSID_NetworkPlaces as specified.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iinitializenetworkfolder
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInitializeNetworkFolder extends IUnknown {
    /**
     * The interface identifier for IInitializeNetworkFolder
     * @type {Guid}
     */
    static IID := Guid("{6e0f9881-42a8-4f2a-97f8-8af4e026d92d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInitializeNetworkFolder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInitializeNetworkFolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a network folder, as specified.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The Shell namespace location for this data source, as an IDList.
     * @param {Pointer<ITEMIDLIST>} pidlTarget Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The target namespace location, as an IDList. This is used when the data source is aliased into the namespace. This parameter specifies the location of the network item that the data source will represent. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipersistfolder3-initializeex">InitializeEx</a> and in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a> see the <i>pidlTargetFolder</i>   definition for more information.
     * @param {Integer} uDisplayType Type: <b>UINT</b>
     * 
     * The display type of the network resource this data source will represent. This is one of the RESOURCEDISPLAYTYPE_XXX values found in winnetwk.h.
     * @param {PWSTR} pszResName Type: <b>LPCWSTR</b>
     * 
     * The network resource name. for example, \\server or \\server\share. this is passed to the WNet in the <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a>.<i>lpRemoteName</i> field.
     * @param {PWSTR} pszProvider Type: <b>LPCWSTR</b>
     * 
     * Optional network provider, as in the <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a>.<i>lpProvider</i> field.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iinitializenetworkfolder-initialize
     */
    Initialize(pidl, pidlTarget, uDisplayType, pszResName, pszProvider) {
        pszResName := pszResName is String ? StrPtr(pszResName) : pszResName
        pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

        result := ComCall(3, this, ITEMIDLIST.Ptr, pidl, ITEMIDLIST.Ptr, pidlTarget, "uint", uDisplayType, "ptr", pszResName, "ptr", pszProvider, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInitializeNetworkFolder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
