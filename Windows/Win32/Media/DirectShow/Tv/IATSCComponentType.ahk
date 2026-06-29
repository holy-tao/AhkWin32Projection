#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMPEG2ComponentType.ahk" { IMPEG2ComponentType }

/**
 * The IATSCComponentType interface represents a component type for a component in an ATSC broadcast. The ATSCComponentType object exposes this interface. Use this interface to determine if an audio stream is in AC-3 format.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCComponentType)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iatsccomponenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IATSCComponentType extends IMPEG2ComponentType {
    /**
     * The interface identifier for IATSCComponentType
     * @type {Guid}
     */
    static IID := Guid("{fc189e4d-7bd4-4125-b3b3-3a76a332cc96}")

    /**
     * The class identifier for ATSCComponentType
     * @type {Guid}
     */
    static CLSID := Guid("{a8dcf3d5-0780-4ef4-8a83-2cffaacb8ace}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IATSCComponentType interfaces
    */
    struct Vtbl extends IMPEG2ComponentType.Vtbl {
        get_Flags : IntPtr
        put_Flags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IATSCComponentType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
        set => this.put_Flags(value)
    }

    /**
     * The get_Flags method queries whether an audio component is in AC-3 format.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsccomponenttype-get_flags
     */
    get_Flags() {
        result := ComCall(28, this, "int*", &Flags := 0, "HRESULT")
        return Flags
    }

    /**
     * The put_Flags method specifies whether an audio component is in AC-3 format.
     * @param {Integer} flags 
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsccomponenttype-put_flags
     */
    put_Flags(flags) {
        result := ComCall(29, this, "int", flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IATSCComponentType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.put_Flags := CallbackCreate(GetMethod(implObj, "put_Flags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.put_Flags)
    }
}
