#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMFilterMiscFlags interface queries whether a filter is a source filter or a renderer.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamfiltermiscflags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMFilterMiscFlags extends IUnknown {
    /**
     * The interface identifier for IAMFilterMiscFlags
     * @type {Guid}
     */
    static IID := Guid("{2dd74950-a890-11d1-abe8-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMFilterMiscFlags interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMiscFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMFilterMiscFlags.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetMiscFlags method returns the filter's type, either source or renderer.
     * @returns {Integer} This method returns a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_am_filter_misc_flags">_AM_FILTER_MISC_FLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamfiltermiscflags-getmiscflags
     */
    GetMiscFlags() {
        result := ComCall(3, this, UInt32)
        return result
    }

    Query(iid) {
        if (IAMFilterMiscFlags.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMiscFlags := CallbackCreate(GetMethod(implObj, "GetMiscFlags"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMiscFlags)
    }
}
