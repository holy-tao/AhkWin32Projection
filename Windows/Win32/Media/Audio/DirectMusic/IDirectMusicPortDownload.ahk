#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectMusicDownload.ahk" { IDirectMusicDownload }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct IDirectMusicPortDownload extends IUnknown {
    /**
     * The interface identifier for IDirectMusicPortDownload
     * @type {Guid}
     */
    static IID := Guid("{d2ac287a-b39b-11d1-8704-00600893b1bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectMusicPortDownload interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBuffer      : IntPtr
        AllocateBuffer : IntPtr
        GetDLId        : IntPtr
        GetAppend      : IntPtr
        Download       : IntPtr
        Unload         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectMusicPortDownload.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwDLId 
     * @returns {IDirectMusicDownload} 
     */
    GetBuffer(dwDLId) {
        result := ComCall(3, this, "uint", dwDLId, "ptr*", &ppIDMDownload := 0, "HRESULT")
        return IDirectMusicDownload(ppIDMDownload)
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @returns {IDirectMusicDownload} 
     */
    AllocateBuffer(dwSize) {
        result := ComCall(4, this, "uint", dwSize, "ptr*", &ppIDMDownload := 0, "HRESULT")
        return IDirectMusicDownload(ppIDMDownload)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStartDLId 
     * @param {Integer} dwCount 
     * @returns {HRESULT} 
     */
    GetDLId(pdwStartDLId, dwCount) {
        pdwStartDLIdMarshal := pdwStartDLId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwStartDLIdMarshal, pdwStartDLId, "uint", dwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAppend 
     * @returns {HRESULT} 
     */
    GetAppend(pdwAppend) {
        pdwAppendMarshal := pdwAppend is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwAppendMarshal, pdwAppend, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicDownload} pIDMDownload 
     * @returns {HRESULT} 
     */
    Download(pIDMDownload) {
        result := ComCall(7, this, "ptr", pIDMDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicDownload} pIDMDownload 
     * @returns {HRESULT} 
     */
    Unload(pIDMDownload) {
        result := ComCall(8, this, "ptr", pIDMDownload, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectMusicPortDownload.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 3)
        this.vtbl.AllocateBuffer := CallbackCreate(GetMethod(implObj, "AllocateBuffer"), flags, 3)
        this.vtbl.GetDLId := CallbackCreate(GetMethod(implObj, "GetDLId"), flags, 3)
        this.vtbl.GetAppend := CallbackCreate(GetMethod(implObj, "GetAppend"), flags, 2)
        this.vtbl.Download := CallbackCreate(GetMethod(implObj, "Download"), flags, 2)
        this.vtbl.Unload := CallbackCreate(GetMethod(implObj, "Unload"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBuffer)
        CallbackFree(this.vtbl.AllocateBuffer)
        CallbackFree(this.vtbl.GetDLId)
        CallbackFree(this.vtbl.GetAppend)
        CallbackFree(this.vtbl.Download)
        CallbackFree(this.vtbl.Unload)
    }
}
