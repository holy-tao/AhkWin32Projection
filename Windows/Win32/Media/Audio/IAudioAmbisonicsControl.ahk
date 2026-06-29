#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AMBISONICS_PARAMS.ahk" { AMBISONICS_PARAMS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioAmbisonicsControl extends IUnknown {
    /**
     * The interface identifier for IAudioAmbisonicsControl
     * @type {Guid}
     */
    static IID := Guid("{28724c91-df35-4856-9f76-d6a26413f3df}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioAmbisonicsControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetData         : IntPtr
        SetHeadTracking : IntPtr
        GetHeadTracking : IntPtr
        SetRotation     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioAmbisonicsControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<AMBISONICS_PARAMS>} pAmbisonicsParams 
     * @param {Integer} cbAmbisonicsParams 
     * @returns {HRESULT} 
     */
    SetData(pAmbisonicsParams, cbAmbisonicsParams) {
        result := ComCall(3, this, AMBISONICS_PARAMS.Ptr, pAmbisonicsParams, "uint", cbAmbisonicsParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bEnableHeadTracking 
     * @returns {HRESULT} 
     */
    SetHeadTracking(bEnableHeadTracking) {
        result := ComCall(4, this, BOOL, bEnableHeadTracking, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetHeadTracking() {
        result := ComCall(5, this, BOOL.Ptr, &pbEnableHeadTracking := 0, "HRESULT")
        return pbEnableHeadTracking
    }

    /**
     * 
     * @param {Float} X 
     * @param {Float} Y 
     * @param {Float} Z 
     * @param {Float} W 
     * @returns {HRESULT} 
     */
    SetRotation(X, Y, Z, W) {
        result := ComCall(6, this, "float", X, "float", Y, "float", Z, "float", W, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioAmbisonicsControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetData := CallbackCreate(GetMethod(implObj, "SetData"), flags, 3)
        this.vtbl.SetHeadTracking := CallbackCreate(GetMethod(implObj, "SetHeadTracking"), flags, 2)
        this.vtbl.GetHeadTracking := CallbackCreate(GetMethod(implObj, "GetHeadTracking"), flags, 2)
        this.vtbl.SetRotation := CallbackCreate(GetMethod(implObj, "SetRotation"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetData)
        CallbackFree(this.vtbl.SetHeadTracking)
        CallbackFree(this.vtbl.GetHeadTracking)
        CallbackFree(this.vtbl.SetRotation)
    }
}
