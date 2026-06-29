#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuningSpace.ahk" { ITuningSpace }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\DVBSystemType.ahk" { DVBSystemType }

/**
 * The IDVBTuningSpace interface is implemented on the DVBTuningSpace object.Note  New applications should use the IDVBTuningSpace2 interface, which inherits IDVBTuningSpace and adds additional methods. .
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTuningSpace)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbtuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBTuningSpace extends ITuningSpace {
    /**
     * The interface identifier for IDVBTuningSpace
     * @type {Guid}
     */
    static IID := Guid("{ada0b268-3b19-4e5b-acc4-49f852be13ba}")

    /**
     * The class identifier for DVBTuningSpace
     * @type {Guid}
     */
    static CLSID := Guid("{c6b14b32-76aa-4a86-a7ac-5c79aaf58da7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBTuningSpace interfaces
    */
    struct Vtbl extends ITuningSpace.Vtbl {
        get_SystemType : IntPtr
        put_SystemType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBTuningSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {DVBSystemType} 
     */
    SystemType {
        get => this.get_SystemType()
        set => this.put_SystemType(value)
    }

    /**
     * The get_SystemType method retrieves the system type.
     * @returns {DVBSystemType} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/dvbsystemtype">DVBSystemType</a> that receives the system type.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtuningspace-get_systemtype
     */
    get_SystemType() {
        result := ComCall(26, this, "int*", &SysType := 0, "HRESULT")
        return SysType
    }

    /**
     * The put_SystemType method sets the system type.
     * @param {DVBSystemType} SysType Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/dvbsystemtype">DVBSystemType</a> that specifies the system type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtuningspace-put_systemtype
     */
    put_SystemType(SysType) {
        result := ComCall(27, this, DVBSystemType, SysType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVBTuningSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SystemType := CallbackCreate(GetMethod(implObj, "get_SystemType"), flags, 2)
        this.vtbl.put_SystemType := CallbackCreate(GetMethod(implObj, "put_SystemType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SystemType)
        CallbackFree(this.vtbl.put_SystemType)
    }
}
