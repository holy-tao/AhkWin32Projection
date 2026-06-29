#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IATSCLocator.ahk" { IATSCLocator }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IATASCLocator2 interface enables the network provider to determine the physical channel, transport stream ID, and program number of an ATSC transmission.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCLocator2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iatsclocator2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IATSCLocator2 extends IATSCLocator {
    /**
     * The interface identifier for IATSCLocator2
     * @type {Guid}
     */
    static IID := Guid("{612aa885-66cf-4090-ba0a-566f5312e4ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IATSCLocator2 interfaces
    */
    struct Vtbl extends IATSCLocator.Vtbl {
        get_ProgramNumber : IntPtr
        put_ProgramNumber : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IATSCLocator2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ProgramNumber {
        get => this.get_ProgramNumber()
        set => this.put_ProgramNumber(value)
    }

    /**
     * The get_ProgramNumber method retrieves the program number.
     * @returns {Integer} Pointer to a variable that receives the program number.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsclocator2-get_programnumber
     */
    get_ProgramNumber() {
        result := ComCall(26, this, "int*", &ProgramNumber := 0, "HRESULT")
        return ProgramNumber
    }

    /**
     * The put_ProgramNumber method specifies the program number.
     * @param {Integer} ProgramNumber Specifies the program number.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsclocator2-put_programnumber
     */
    put_ProgramNumber(ProgramNumber) {
        result := ComCall(27, this, "int", ProgramNumber, "HRESULT")
        return result
    }

    Query(iid) {
        if (IATSCLocator2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProgramNumber := CallbackCreate(GetMethod(implObj, "get_ProgramNumber"), flags, 2)
        this.vtbl.put_ProgramNumber := CallbackCreate(GetMethod(implObj, "put_ProgramNumber"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProgramNumber)
        CallbackFree(this.vtbl.put_ProgramNumber)
    }
}
