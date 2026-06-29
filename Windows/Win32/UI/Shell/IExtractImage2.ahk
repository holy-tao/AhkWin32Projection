#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IExtractImage.ahk" { IExtractImage }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Extends the capabilities of IExtractImage.
 * @remarks
 * Implement <b>IExtractImage2</b> to provide date stamps for your thumbnail images.
 * 
 * You do not call this interface directly. <b>IExtractImage2</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
 * 
 * <b>IExtractImage2</b> implements all the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a> methods as well as 
 * 				<b>IUnknown</b>. The listed method is specific to <b>IExtractImage2</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iextractimage2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExtractImage2 extends IExtractImage {
    /**
     * The interface identifier for IExtractImage2
     * @type {Guid}
     */
    static IID := Guid("{953bb1ee-93b4-11d1-98a3-00c04fb687da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExtractImage2 interfaces
    */
    struct Vtbl extends IExtractImage.Vtbl {
        GetDateStamp : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExtractImage2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requests the date the image was last modified. This method allows the Shell to determine whether cached images are out-of-date.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure used to return the last time the image was modified.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iextractimage2-getdatestamp
     */
    GetDateStamp() {
        pDateStamp := FILETIME()
        result := ComCall(5, this, FILETIME.Ptr, pDateStamp, "HRESULT")
        return pDateStamp
    }

    Query(iid) {
        if (IExtractImage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDateStamp := CallbackCreate(GetMethod(implObj, "GetDateStamp"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDateStamp)
    }
}
