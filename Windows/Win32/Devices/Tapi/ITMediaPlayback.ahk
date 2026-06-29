#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITMediaPlayback interface provides playback-specific methods that allow an application to set and get the list of files to play. This interface is created by calling QueryInterface on ITTerminal.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itmediaplayback
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITMediaPlayback extends IDispatch {
    /**
     * The interface identifier for ITMediaPlayback
     * @type {Guid}
     */
    static IID := Guid("{627e8ae6-ae4c-4a69-bb63-2ad625404b77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITMediaPlayback interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_PlayList : IntPtr
        get_PlayList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITMediaPlayback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    PlayList {
        get => this.get_PlayList()
        set => this.put_PlayList(value)
    }

    /**
     * The put_PlayList method provides the file playback terminal with the list of files to play.
     * @param {VARIANT} PlayListVariant Variant of type VT_ARRAY, which contains variants of type VT_BSTR and VT_STORAGE. 
     * 
     * 
     * 
     * 
     * The VT_BSTR elements of the array contain the names of the files to play. The file name extension is used to determine the type of file. Currently, the supported file name extensions are .avi and .wav.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediaplayback-put_playlist
     */
    put_PlayList(PlayListVariant) {
        result := ComCall(7, this, VARIANT, PlayListVariant, "HRESULT")
        return result
    }

    /**
     * The get_PlayList method gets the list of files to play.
     * @returns {VARIANT} Pointer to variant of type VT_ARRAY, which contains variants of type VT_BSTR and VT_STORAGE. 
     * 
     * 
     * 
     * 
     * The VT_BSTR elements of the array contain the names of the files to play. The file name extension is used to specify the type of file. Currently, supported file name extensions are .avi and .wav.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediaplayback-get_playlist
     */
    get_PlayList() {
        pPlayListVariant := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, pPlayListVariant, "HRESULT")
        return pPlayListVariant
    }

    Query(iid) {
        if (ITMediaPlayback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_PlayList := CallbackCreate(GetMethod(implObj, "put_PlayList"), flags, 2)
        this.vtbl.get_PlayList := CallbackCreate(GetMethod(implObj, "get_PlayList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_PlayList)
        CallbackFree(this.vtbl.get_PlayList)
    }
}
