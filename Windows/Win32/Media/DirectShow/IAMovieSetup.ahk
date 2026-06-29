#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface has been deprecated. (IAMovieSetup)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamoviesetup
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMovieSetup extends IUnknown {
    /**
     * The interface identifier for IAMovieSetup
     * @type {Guid}
     */
    static IID := Guid("{a3d8cec0-7e5a-11cf-bbc5-00805f6cef20}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMovieSetup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Register   : IntPtr
        Unregister : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMovieSetup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  The IAMovieSetup interface is deprecated. Use the AMovieDllRegisterServer2 function instead. Adds the filter to the registry.
     * @remarks
     * This method registers the filter, its pins, and the media type associated with the pins. It should be implemented to use <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltermapper">IFilterMapper</a> methods to accomplish this. See the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasefilter-register">CBaseFilter::Register</a> member function for a description of its implementation.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamoviesetup-register
     */
    Register() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Note  The IAMovieSetup interface is deprecated. Use the AMovieDllRegisterServer2 function instead. Removes the filter from the registry.
     * @remarks
     * This method should be implemented to use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltermapper-unregisterfilter">IFilterMapper::UnregisterFilter</a> method to remove the filter from the registry. This effectively removes the pins and media types as well.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamoviesetup-unregister
     */
    Unregister() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMovieSetup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 1)
        this.vtbl.Unregister := CallbackCreate(GetMethod(implObj, "Unregister"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.Unregister)
    }
}
