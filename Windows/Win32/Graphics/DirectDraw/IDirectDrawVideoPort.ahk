#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DDVIDEOPORTBANDWIDTH.ahk" { DDVIDEOPORTBANDWIDTH }
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORCONTROL.ahk" { DDCOLORCONTROL }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DDVIDEOPORTINFO.ahk" { DDVIDEOPORTINFO }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IDirectDrawVideoPort extends IUnknown {
    /**
     * The interface identifier for IDirectDrawVideoPort
     * @type {Guid}
     */
    static IID := Guid("{b36d93e0-2b43-11cf-a2de-00aa00b93356}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawVideoPort interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Flip                 : IntPtr
        GetBandwidthInfo     : IntPtr
        GetColorControls     : IntPtr
        GetInputFormats      : IntPtr
        GetOutputFormats     : IntPtr
        GetFieldPolarity     : IntPtr
        GetVideoLine         : IntPtr
        GetVideoSignalStatus : IntPtr
        SetColorControls     : IntPtr
        SetTargetSurface     : IntPtr
        StartVideo           : IntPtr
        StopVideo            : IntPtr
        UpdateVideo          : IntPtr
        WaitForSync          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawVideoPort.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    Flip(param0, param1) {
        result := ComCall(3, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDPIXELFORMAT>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDVIDEOPORTBANDWIDTH>} param4 
     * @returns {HRESULT} 
     */
    GetBandwidthInfo(param0, param1, param2, param3, param4) {
        result := ComCall(4, this, DDPIXELFORMAT.Ptr, param0, "uint", param1, "uint", param2, "uint", param3, DDVIDEOPORTBANDWIDTH.Ptr, param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} 
     */
    GetColorControls(param0) {
        result := ComCall(5, this, DDCOLORCONTROL.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpNumFormats 
     * @param {Integer} param2 
     * @returns {DDPIXELFORMAT} 
     */
    GetInputFormats(lpNumFormats, param2) {
        lpNumFormatsMarshal := lpNumFormats is VarRef ? "uint*" : "ptr"

        param1 := DDPIXELFORMAT()
        result := ComCall(6, this, lpNumFormatsMarshal, lpNumFormats, DDPIXELFORMAT.Ptr, param1, "uint", param2, "HRESULT")
        return param1
    }

    /**
     * 
     * @param {Pointer<DDPIXELFORMAT>} param0 
     * @param {Pointer<Integer>} lpNumFormats 
     * @param {Integer} param3 
     * @returns {DDPIXELFORMAT} 
     */
    GetOutputFormats(param0, lpNumFormats, param3) {
        lpNumFormatsMarshal := lpNumFormats is VarRef ? "uint*" : "ptr"

        param2 := DDPIXELFORMAT()
        result := ComCall(7, this, DDPIXELFORMAT.Ptr, param0, lpNumFormatsMarshal, lpNumFormats, DDPIXELFORMAT.Ptr, param2, "uint", param3, "HRESULT")
        return param2
    }

    /**
     * 
     * @param {Pointer<BOOL>} param0 
     * @returns {HRESULT} 
     */
    GetFieldPolarity(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetVideoLine(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetVideoSignalStatus(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} 
     */
    SetColorControls(param0) {
        result := ComCall(11, this, DDCOLORCONTROL.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetTargetSurface(param0, param1) {
        result := ComCall(12, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDVIDEOPORTINFO>} param0 
     * @returns {HRESULT} 
     */
    StartVideo(param0) {
        result := ComCall(13, this, DDVIDEOPORTINFO.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopVideo() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDVIDEOPORTINFO>} param0 
     * @returns {HRESULT} 
     */
    UpdateVideo(param0) {
        result := ComCall(15, this, DDVIDEOPORTINFO.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    WaitForSync(param0, param1, param2) {
        result := ComCall(16, this, "uint", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawVideoPort.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Flip := CallbackCreate(GetMethod(implObj, "Flip"), flags, 3)
        this.vtbl.GetBandwidthInfo := CallbackCreate(GetMethod(implObj, "GetBandwidthInfo"), flags, 6)
        this.vtbl.GetColorControls := CallbackCreate(GetMethod(implObj, "GetColorControls"), flags, 2)
        this.vtbl.GetInputFormats := CallbackCreate(GetMethod(implObj, "GetInputFormats"), flags, 4)
        this.vtbl.GetOutputFormats := CallbackCreate(GetMethod(implObj, "GetOutputFormats"), flags, 5)
        this.vtbl.GetFieldPolarity := CallbackCreate(GetMethod(implObj, "GetFieldPolarity"), flags, 2)
        this.vtbl.GetVideoLine := CallbackCreate(GetMethod(implObj, "GetVideoLine"), flags, 2)
        this.vtbl.GetVideoSignalStatus := CallbackCreate(GetMethod(implObj, "GetVideoSignalStatus"), flags, 2)
        this.vtbl.SetColorControls := CallbackCreate(GetMethod(implObj, "SetColorControls"), flags, 2)
        this.vtbl.SetTargetSurface := CallbackCreate(GetMethod(implObj, "SetTargetSurface"), flags, 3)
        this.vtbl.StartVideo := CallbackCreate(GetMethod(implObj, "StartVideo"), flags, 2)
        this.vtbl.StopVideo := CallbackCreate(GetMethod(implObj, "StopVideo"), flags, 1)
        this.vtbl.UpdateVideo := CallbackCreate(GetMethod(implObj, "UpdateVideo"), flags, 2)
        this.vtbl.WaitForSync := CallbackCreate(GetMethod(implObj, "WaitForSync"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Flip)
        CallbackFree(this.vtbl.GetBandwidthInfo)
        CallbackFree(this.vtbl.GetColorControls)
        CallbackFree(this.vtbl.GetInputFormats)
        CallbackFree(this.vtbl.GetOutputFormats)
        CallbackFree(this.vtbl.GetFieldPolarity)
        CallbackFree(this.vtbl.GetVideoLine)
        CallbackFree(this.vtbl.GetVideoSignalStatus)
        CallbackFree(this.vtbl.SetColorControls)
        CallbackFree(this.vtbl.SetTargetSurface)
        CallbackFree(this.vtbl.StartVideo)
        CallbackFree(this.vtbl.StopVideo)
        CallbackFree(this.vtbl.UpdateVideo)
        CallbackFree(this.vtbl.WaitForSync)
    }
}
