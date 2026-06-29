#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Changes the frame rate of a video stream.
 * @remarks
 * This DSP changes the frame rate by repeating or dropping frames.
 * 
 * By default, the DSP gets the frame rates from the media types. Optionally, you can specify the frame rates by setting the MFPKEY\_CONV\_INPUTFRAMERATE and MFPKEY\_CONV\_OUTPUTFRAMERATE properties. These values override the frame rate given in the media type. However, if you are using this DSP within the Media Foundation pipeline, you should not set these properties.
 * @see https://learn.microsoft.com/windows/win32/medfound/framerateconverter
 * @namespace Windows.Win32.System.Mmc
 */
export default struct Frame extends IDispatch {
    /**
     * The interface identifier for Frame
     * @type {Guid}
     */
    static IID := Guid("{e5e2d970-5bb3-4306-8804-b0968a31c8e6}")

    /**
     * The class identifier for Frame
     * @type {Guid}
     */
    static CLSID := Guid("{e5e2d970-5bb3-4306-8804-b0968a31c8e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Frame interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Maximize   : IntPtr
        Minimize   : IntPtr
        Restore    : IntPtr
        get_Top    : IntPtr
        put_Top    : IntPtr
        get_Bottom : IntPtr
        put_Bottom : IntPtr
        get_Left   : IntPtr
        put_Left   : IntPtr
        get_Right  : IntPtr
        put_Right  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Frame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Top {
        get => this.get_Top()
        set => this.put_Top(value)
    }

    /**
     * @type {Integer} 
     */
    Bottom {
        get => this.get_Bottom()
        set => this.put_Bottom(value)
    }

    /**
     * @type {Integer} 
     */
    Left {
        get => this.get_Left()
        set => this.put_Left(value)
    }

    /**
     * @type {Integer} 
     */
    Right {
        get => this.get_Right()
        set => this.put_Right(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Maximize() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Minimize() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Initiates a system restore.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/restore-systemrestore
     */
    Restore() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Top() {
        result := ComCall(10, this, "int*", &Top := 0, "HRESULT")
        return Top
    }

    /**
     * 
     * @param {Integer} top 
     * @returns {HRESULT} 
     */
    put_Top(top) {
        result := ComCall(11, this, "int", top, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bottom() {
        result := ComCall(12, this, "int*", &Bottom := 0, "HRESULT")
        return Bottom
    }

    /**
     * 
     * @param {Integer} bottom 
     * @returns {HRESULT} 
     */
    put_Bottom(bottom) {
        result := ComCall(13, this, "int", bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Left() {
        result := ComCall(14, this, "int*", &Left := 0, "HRESULT")
        return Left
    }

    /**
     * 
     * @param {Integer} left 
     * @returns {HRESULT} 
     */
    put_Left(left) {
        result := ComCall(15, this, "int", left, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Right() {
        result := ComCall(16, this, "int*", &Right := 0, "HRESULT")
        return Right
    }

    /**
     * 
     * @param {Integer} right 
     * @returns {HRESULT} 
     */
    put_Right(right) {
        result := ComCall(17, this, "int", right, "HRESULT")
        return result
    }

    Query(iid) {
        if (Frame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Maximize := CallbackCreate(GetMethod(implObj, "Maximize"), flags, 1)
        this.vtbl.Minimize := CallbackCreate(GetMethod(implObj, "Minimize"), flags, 1)
        this.vtbl.Restore := CallbackCreate(GetMethod(implObj, "Restore"), flags, 1)
        this.vtbl.get_Top := CallbackCreate(GetMethod(implObj, "get_Top"), flags, 2)
        this.vtbl.put_Top := CallbackCreate(GetMethod(implObj, "put_Top"), flags, 2)
        this.vtbl.get_Bottom := CallbackCreate(GetMethod(implObj, "get_Bottom"), flags, 2)
        this.vtbl.put_Bottom := CallbackCreate(GetMethod(implObj, "put_Bottom"), flags, 2)
        this.vtbl.get_Left := CallbackCreate(GetMethod(implObj, "get_Left"), flags, 2)
        this.vtbl.put_Left := CallbackCreate(GetMethod(implObj, "put_Left"), flags, 2)
        this.vtbl.get_Right := CallbackCreate(GetMethod(implObj, "get_Right"), flags, 2)
        this.vtbl.put_Right := CallbackCreate(GetMethod(implObj, "put_Right"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Maximize)
        CallbackFree(this.vtbl.Minimize)
        CallbackFree(this.vtbl.Restore)
        CallbackFree(this.vtbl.get_Top)
        CallbackFree(this.vtbl.put_Top)
        CallbackFree(this.vtbl.get_Bottom)
        CallbackFree(this.vtbl.put_Bottom)
        CallbackFree(this.vtbl.get_Left)
        CallbackFree(this.vtbl.put_Left)
        CallbackFree(this.vtbl.get_Right)
        CallbackFree(this.vtbl.put_Right)
    }
}
