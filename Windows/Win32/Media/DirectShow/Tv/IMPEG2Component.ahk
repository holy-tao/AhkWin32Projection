#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IComponent.ahk" { IComponent }

/**
 * The IMPEG2Component interface contains methods for getting and setting properties that describe an MPEG2 elementary stream.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2Component)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-impeg2component
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMPEG2Component extends IComponent {
    /**
     * The interface identifier for IMPEG2Component
     * @type {Guid}
     */
    static IID := Guid("{1493e353-1eb6-473c-802d-8e6b8ec9d2a9}")

    /**
     * The class identifier for MPEG2Component
     * @type {Guid}
     */
    static CLSID := Guid("{055cb2d7-2969-45cd-914b-76890722f112}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMPEG2Component interfaces
    */
    struct Vtbl extends IComponent.Vtbl {
        get_PID           : IntPtr
        put_PID           : IntPtr
        get_PCRPID        : IntPtr
        put_PCRPID        : IntPtr
        get_ProgramNumber : IntPtr
        put_ProgramNumber : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMPEG2Component.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    PID {
        get => this.get_PID()
        set => this.put_PID(value)
    }

    /**
     * @type {Integer} 
     */
    PCRPID {
        get => this.get_PCRPID()
        set => this.put_PCRPID(value)
    }

    /**
     * @type {Integer} 
     */
    ProgramNumber {
        get => this.get_ProgramNumber()
        set => this.put_ProgramNumber(value)
    }

    /**
     * The get_PID method returns the packet identifier (PID) for this substream.
     * @returns {Integer} Pointer to a variable that receives the PID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-get_pid
     */
    get_PID() {
        result := ComCall(16, this, "int*", &PID := 0, "HRESULT")
        return PID
    }

    /**
     * The put_PID method sets the packet identifier (PID) for this substream.
     * @param {Integer} PID Specifies the PID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-put_pid
     */
    put_PID(PID) {
        result := ComCall(17, this, "int", PID, "HRESULT")
        return result
    }

    /**
     * The get_PCRPID method returns the packet identifier (PID) for the packets that contain the PCR for this substream.
     * @returns {Integer} Pointer to a variable that receives the PCR PID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-get_pcrpid
     */
    get_PCRPID() {
        result := ComCall(18, this, "int*", &PCRPID := 0, "HRESULT")
        return PCRPID
    }

    /**
     * The put_PCRPID method sets the packet identifier (PID) for the packets that contain the PCR for this substream.
     * @param {Integer} PCRPID Specifies the PCR PID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-put_pcrpid
     */
    put_PCRPID(PCRPID) {
        result := ComCall(19, this, "int", PCRPID, "HRESULT")
        return result
    }

    /**
     * The get_ProgramNumber method returns the program number for this substream.
     * @returns {Integer} Pointer to a variable that receives the program number.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-get_programnumber
     */
    get_ProgramNumber() {
        result := ComCall(20, this, "int*", &ProgramNumber := 0, "HRESULT")
        return ProgramNumber
    }

    /**
     * The put_ProgramNumber method sets the program number for this substream.
     * @param {Integer} ProgramNumber Specifies the program number.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2component-put_programnumber
     */
    put_ProgramNumber(ProgramNumber) {
        result := ComCall(21, this, "int", ProgramNumber, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMPEG2Component.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PID := CallbackCreate(GetMethod(implObj, "get_PID"), flags, 2)
        this.vtbl.put_PID := CallbackCreate(GetMethod(implObj, "put_PID"), flags, 2)
        this.vtbl.get_PCRPID := CallbackCreate(GetMethod(implObj, "get_PCRPID"), flags, 2)
        this.vtbl.put_PCRPID := CallbackCreate(GetMethod(implObj, "put_PCRPID"), flags, 2)
        this.vtbl.get_ProgramNumber := CallbackCreate(GetMethod(implObj, "get_ProgramNumber"), flags, 2)
        this.vtbl.put_ProgramNumber := CallbackCreate(GetMethod(implObj, "put_ProgramNumber"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PID)
        CallbackFree(this.vtbl.put_PID)
        CallbackFree(this.vtbl.get_PCRPID)
        CallbackFree(this.vtbl.put_PCRPID)
        CallbackFree(this.vtbl.get_ProgramNumber)
        CallbackFree(this.vtbl.put_ProgramNumber)
    }
}
