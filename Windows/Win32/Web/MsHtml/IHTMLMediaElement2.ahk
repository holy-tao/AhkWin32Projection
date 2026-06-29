#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLMediaElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLMediaElement2
     * @type {Guid}
     */
    static IID := Guid("{30510809-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLMediaElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_currentTimeDouble         : IntPtr
        get_currentTimeDouble         : IntPtr
        get_initialTimeDouble         : IntPtr
        get_durationDouble            : IntPtr
        put_defaultPlaybackRateDouble : IntPtr
        get_defaultPlaybackRateDouble : IntPtr
        put_playbackRateDouble        : IntPtr
        get_playbackRateDouble        : IntPtr
        put_volumeDouble              : IntPtr
        get_volumeDouble              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLMediaElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    currentTimeDouble {
        get => this.get_currentTimeDouble()
        set => this.put_currentTimeDouble(value)
    }

    /**
     * @type {Float} 
     */
    initialTimeDouble {
        get => this.get_initialTimeDouble()
    }

    /**
     * @type {Float} 
     */
    durationDouble {
        get => this.get_durationDouble()
    }

    /**
     * @type {Float} 
     */
    defaultPlaybackRateDouble {
        get => this.get_defaultPlaybackRateDouble()
        set => this.put_defaultPlaybackRateDouble(value)
    }

    /**
     * @type {Float} 
     */
    playbackRateDouble {
        get => this.get_playbackRateDouble()
        set => this.put_playbackRateDouble(value)
    }

    /**
     * @type {Float} 
     */
    volumeDouble {
        get => this.get_volumeDouble()
        set => this.put_volumeDouble(value)
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_currentTimeDouble(v) {
        result := ComCall(7, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_currentTimeDouble() {
        result := ComCall(8, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_initialTimeDouble() {
        result := ComCall(9, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_durationDouble() {
        result := ComCall(10, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_defaultPlaybackRateDouble(v) {
        result := ComCall(11, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_defaultPlaybackRateDouble() {
        result := ComCall(12, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_playbackRateDouble(v) {
        result := ComCall(13, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_playbackRateDouble() {
        result := ComCall(14, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_volumeDouble(v) {
        result := ComCall(15, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_volumeDouble() {
        result := ComCall(16, this, "double*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLMediaElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_currentTimeDouble := CallbackCreate(GetMethod(implObj, "put_currentTimeDouble"), flags, 2)
        this.vtbl.get_currentTimeDouble := CallbackCreate(GetMethod(implObj, "get_currentTimeDouble"), flags, 2)
        this.vtbl.get_initialTimeDouble := CallbackCreate(GetMethod(implObj, "get_initialTimeDouble"), flags, 2)
        this.vtbl.get_durationDouble := CallbackCreate(GetMethod(implObj, "get_durationDouble"), flags, 2)
        this.vtbl.put_defaultPlaybackRateDouble := CallbackCreate(GetMethod(implObj, "put_defaultPlaybackRateDouble"), flags, 2)
        this.vtbl.get_defaultPlaybackRateDouble := CallbackCreate(GetMethod(implObj, "get_defaultPlaybackRateDouble"), flags, 2)
        this.vtbl.put_playbackRateDouble := CallbackCreate(GetMethod(implObj, "put_playbackRateDouble"), flags, 2)
        this.vtbl.get_playbackRateDouble := CallbackCreate(GetMethod(implObj, "get_playbackRateDouble"), flags, 2)
        this.vtbl.put_volumeDouble := CallbackCreate(GetMethod(implObj, "put_volumeDouble"), flags, 2)
        this.vtbl.get_volumeDouble := CallbackCreate(GetMethod(implObj, "get_volumeDouble"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_currentTimeDouble)
        CallbackFree(this.vtbl.get_currentTimeDouble)
        CallbackFree(this.vtbl.get_initialTimeDouble)
        CallbackFree(this.vtbl.get_durationDouble)
        CallbackFree(this.vtbl.put_defaultPlaybackRateDouble)
        CallbackFree(this.vtbl.get_defaultPlaybackRateDouble)
        CallbackFree(this.vtbl.put_playbackRateDouble)
        CallbackFree(this.vtbl.get_playbackRateDouble)
        CallbackFree(this.vtbl.put_volumeDouble)
        CallbackFree(this.vtbl.get_volumeDouble)
    }
}
