#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IHTMLPersistData extends IUnknown {
    /**
     * The interface identifier for IHTMLPersistData
     * @type {Guid}
     */
    static IID := Guid("{3050f4c5-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPersistData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        save      : IntPtr
        load      : IntPtr
        queryType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPersistData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The save command saves an MCI file. Video-overlay and waveform-audio devices recognize this command. Although digital-video devices and MIDI sequencers also recognize this command, the MCIAVI and MCISEQ drivers do not support it.
     * @remarks
     * The *filename* variable is required if the device was opened using the "new" device identifier.
     * @param {IUnknown} pUnk 
     * @param {Integer} lType 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/Multimedia/save
     */
    save(pUnk, lType) {
        result := ComCall(3, this, "ptr", pUnk, "int", lType, VARIANT_BOOL.Ptr, &fContinueBroacast := 0, "HRESULT")
        return fContinueBroacast
    }

    /**
     * The load command loads a file in a device-specific format. Digital-video and video-overlay devices recognize this command.
     * @remarks
     * The "vidboard" device sends a notification message when the loading is completed.
     * @param {IUnknown} pUnk 
     * @param {Integer} lType 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/Multimedia/load
     */
    load(pUnk, lType) {
        result := ComCall(4, this, "ptr", pUnk, "int", lType, VARIANT_BOOL.Ptr, &fDoDefault := 0, "HRESULT")
        return fDoDefault
    }

    /**
     * 
     * @param {Integer} lType 
     * @returns {VARIANT_BOOL} 
     */
    queryType(lType) {
        result := ComCall(5, this, "int", lType, VARIANT_BOOL.Ptr, &pfSupportsType := 0, "HRESULT")
        return pfSupportsType
    }

    Query(iid) {
        if (IHTMLPersistData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.save := CallbackCreate(GetMethod(implObj, "save"), flags, 4)
        this.vtbl.load := CallbackCreate(GetMethod(implObj, "load"), flags, 4)
        this.vtbl.queryType := CallbackCreate(GetMethod(implObj, "queryType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.save)
        CallbackFree(this.vtbl.load)
        CallbackFree(this.vtbl.queryType)
    }
}
