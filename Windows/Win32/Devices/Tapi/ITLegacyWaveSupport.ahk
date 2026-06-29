#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FULLDUPLEX_SUPPORT.ahk" { FULLDUPLEX_SUPPORT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITLegacyWaveSupport interface allows an application to discover whether a terminal created by a legacy TSP (pre-TAPI 3) can be controlled using the Wave API.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itlegacywavesupport
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITLegacyWaveSupport extends IDispatch {
    /**
     * The interface identifier for ITLegacyWaveSupport
     * @type {Guid}
     */
    static IID := Guid("{207823ea-e252-11d2-b77e-0080c7135381}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITLegacyWaveSupport interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        IsFullDuplex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITLegacyWaveSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IsFullDuplex method gets an indicator of whether the address supports wave devices.
     * @returns {FULLDUPLEX_SUPPORT} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-fullduplex_support">FULLDUPLEX_SUPPORT</a> enumerator member, such as FDS_SUPPORTED.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacywavesupport-isfullduplex
     */
    IsFullDuplex() {
        result := ComCall(7, this, "int*", &pSupport := 0, "HRESULT")
        return pSupport
    }

    Query(iid) {
        if (ITLegacyWaveSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsFullDuplex := CallbackCreate(GetMethod(implObj, "IsFullDuplex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsFullDuplex)
    }
}
