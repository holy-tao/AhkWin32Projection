#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_PROVIDER_PROP.ahk" { VDS_PROVIDER_PROP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsProvider interface (vdshwprv.h) returns the properties of a hardware or software provider.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsProvider extends IUnknown {
    /**
     * The interface identifier for IVdsProvider
     * @type {Guid}
     */
    static IID := Guid("{10c5e575-7984-4e81-a56b-431f5f92ae42}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsProvider::GetProperties (vdshwprv.h) method returns the properties of a provider.
     * @returns {VDS_PROVIDER_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_provider_prop">VDS_PROVIDER_PROP</a> 
     *       structure allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszName</b> and <b>pwszVersion</b> member strings. Callers must free 
     *       the strings by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsprovider-getproperties
     */
    GetProperties() {
        pProviderProp := VDS_PROVIDER_PROP()
        result := ComCall(3, this, VDS_PROVIDER_PROP.Ptr, pProviderProp, "HRESULT")
        return pProviderProp
    }

    Query(iid) {
        if (IVdsProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
    }
}
