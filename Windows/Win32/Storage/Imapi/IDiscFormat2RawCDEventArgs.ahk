#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMAPI_FORMAT2_RAW_CD_WRITE_ACTION.ahk" { IMAPI_FORMAT2_RAW_CD_WRITE_ACTION }
#Import ".\IWriteEngine2EventArgs.ahk" { IWriteEngine2EventArgs }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use this interface to retrieve information about the current write operation. (IDiscFormat2RawCDEventArgs)
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-idiscformat2rawcdeventargs
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IDiscFormat2RawCDEventArgs extends IWriteEngine2EventArgs {
    /**
     * The interface identifier for IDiscFormat2RawCDEventArgs
     * @type {Guid}
     */
    static IID := Guid("{27354143-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiscFormat2RawCDEventArgs interfaces
    */
    struct Vtbl extends IWriteEngine2EventArgs.Vtbl {
        get_CurrentAction : IntPtr
        get_ElapsedTime   : IntPtr
        get_RemainingTime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiscFormat2RawCDEventArgs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IMAPI_FORMAT2_RAW_CD_WRITE_ACTION} 
     */
    CurrentAction {
        get => this.get_CurrentAction()
    }

    /**
     * @type {Integer} 
     */
    ElapsedTime {
        get => this.get_ElapsedTime()
    }

    /**
     * @type {Integer} 
     */
    RemainingTime {
        get => this.get_RemainingTime()
    }

    /**
     * Retrieves the current write action being performed. (IDiscFormat2RawCDEventArgs.get_CurrentAction)
     * @returns {IMAPI_FORMAT2_RAW_CD_WRITE_ACTION} Current write action being performed. For a list of possible actions, see  the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_format2_raw_cd_write_action">IMAPI_FORMAT2_RAW_CD_WRITE_ACTION</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcdeventargs-get_currentaction
     */
    get_CurrentAction() {
        result := ComCall(14, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the total elapsed time of the write operation. (IDiscFormat2RawCDEventArgs.get_ElapsedTime)
     * @returns {Integer} Elapsed time, in seconds, of the write operation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcdeventargs-get_elapsedtime
     */
    get_ElapsedTime() {
        result := ComCall(15, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the estimated remaining time of the write operation. (IDiscFormat2RawCDEventArgs.get_RemainingTime)
     * @remarks
     * The estimate for a single write operation can vary as the operation progresses. The drive provides updated information that can affect the projected duration of the write operation.
     * @returns {Integer} Estimated time, in seconds, needed for the remainder of the write operation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcdeventargs-get_remainingtime
     */
    get_RemainingTime() {
        result := ComCall(16, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IDiscFormat2RawCDEventArgs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentAction := CallbackCreate(GetMethod(implObj, "get_CurrentAction"), flags, 2)
        this.vtbl.get_ElapsedTime := CallbackCreate(GetMethod(implObj, "get_ElapsedTime"), flags, 2)
        this.vtbl.get_RemainingTime := CallbackCreate(GetMethod(implObj, "get_RemainingTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentAction)
        CallbackFree(this.vtbl.get_ElapsedTime)
        CallbackFree(this.vtbl.get_RemainingTime)
    }
}
