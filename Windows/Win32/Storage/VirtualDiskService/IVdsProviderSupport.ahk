#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsProviderSupport interface (vdshwprv.h) provides a method to indicate what versions of the VDS interfaces are supported by the provider.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsprovidersupport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsProviderSupport extends IUnknown {
    /**
     * The interface identifier for IVdsProviderSupport
     * @type {Guid}
     */
    static IID := Guid("{1732be13-e8f9-4a03-bfbc-5f616aa66ce1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsProviderSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetVersionSupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsProviderSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsProviderSupport::GetVersionSupport (vdshwprv.h) method returns a bitmask of values enumerated by VDS_VERSION_SUPPORT_FLAG indicating the versions of the VDS interfaces.
     * @returns {Integer} Address of a <b>ULONG</b> that receives a bitmask of one or more of the values enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_version_support_flag">VDS_VERSION_SUPPORT_FLAG</a> indicating the 
     *       versions of the VDS interfaces supported by the provider.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsprovidersupport-getversionsupport
     */
    GetVersionSupport() {
        result := ComCall(3, this, "uint*", &ulVersionSupport := 0, "HRESULT")
        return ulVersionSupport
    }

    Query(iid) {
        if (IVdsProviderSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVersionSupport := CallbackCreate(GetMethod(implObj, "GetVersionSupport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVersionSupport)
    }
}
