#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\DirectDraw\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRVideoStreamControl interface is implemented on each input pin of the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrvideostreamcontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRVideoStreamControl extends IUnknown {
    /**
     * The interface identifier for IVMRVideoStreamControl
     * @type {Guid}
     */
    static IID := Guid("{058d1f11-2a54-4bef-bd54-df706626b727}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRVideoStreamControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetColorKey          : IntPtr
        GetColorKey          : IntPtr
        SetStreamActiveState : IntPtr
        GetStreamActiveState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRVideoStreamControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetColorKey method sets the source color key that the VMR will use when compositing the video image.
     * @param {Pointer<DDCOLORKEY>} lpClrKey Specifies the source color key as a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-ddcolorkey">DDCOLORKEY</a> type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrvideostreamcontrol-setcolorkey
     */
    SetColorKey(lpClrKey) {
        result := ComCall(3, this, DDCOLORKEY.Ptr, lpClrKey, "HRESULT")
        return result
    }

    /**
     * The GetColorKey method retrieves the source color key currently set for this stream.
     * @returns {DDCOLORKEY} Address of a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-ddcolorkey">DDCOLORKEY</a> structure that receives the source color key.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrvideostreamcontrol-getcolorkey
     */
    GetColorKey() {
        lpClrKey := DDCOLORKEY()
        result := ComCall(4, this, DDCOLORKEY.Ptr, lpClrKey, "HRESULT")
        return lpClrKey
    }

    /**
     * The SetStreamActiveState method activates or inactivates an input stream.
     * @param {BOOL} fActive Specifies the state of the stream. <b>TRUE</b> means active; <b>FALSE</b> means inactive.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrvideostreamcontrol-setstreamactivestate
     */
    SetStreamActiveState(fActive) {
        result := ComCall(5, this, BOOL, fActive, "HRESULT")
        return result
    }

    /**
     * The GetStreamActiveState method retrieves the state of the stream.
     * @returns {BOOL} Receives the current state of the stream. <b>TRUE</b> means the stream is active; <b>FALSE</b> means that it is inactive.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrvideostreamcontrol-getstreamactivestate
     */
    GetStreamActiveState() {
        result := ComCall(6, this, BOOL.Ptr, &lpfActive := 0, "HRESULT")
        return lpfActive
    }

    Query(iid) {
        if (IVMRVideoStreamControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetColorKey := CallbackCreate(GetMethod(implObj, "SetColorKey"), flags, 2)
        this.vtbl.GetColorKey := CallbackCreate(GetMethod(implObj, "GetColorKey"), flags, 2)
        this.vtbl.SetStreamActiveState := CallbackCreate(GetMethod(implObj, "SetStreamActiveState"), flags, 2)
        this.vtbl.GetStreamActiveState := CallbackCreate(GetMethod(implObj, "GetStreamActiveState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetColorKey)
        CallbackFree(this.vtbl.GetColorKey)
        CallbackFree(this.vtbl.SetStreamActiveState)
        CallbackFree(this.vtbl.GetStreamActiveState)
    }
}
