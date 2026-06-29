#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\KSJACK_DESCRIPTION3.ahk" { KSJACK_DESCRIPTION3 }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsJackDescription3 extends IUnknown {
    /**
     * The interface identifier for IKsJackDescription3
     * @type {Guid}
     */
    static IID := Guid("{e3f6778b-6660-4cc8-a291-ecc4192d9967}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsJackDescription3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetJackCount        : IntPtr
        GetJackDescription3 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsJackDescription3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetJackCount() {
        result := ComCall(3, this, "uint*", &pcJacks := 0, "HRESULT")
        return pcJacks
    }

    /**
     * 
     * @param {Integer} nJack 
     * @returns {KSJACK_DESCRIPTION3} 
     */
    GetJackDescription3(nJack) {
        pDescription3 := KSJACK_DESCRIPTION3()
        result := ComCall(4, this, "uint", nJack, KSJACK_DESCRIPTION3.Ptr, pDescription3, "HRESULT")
        return pDescription3
    }

    Query(iid) {
        if (IKsJackDescription3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetJackCount := CallbackCreate(GetMethod(implObj, "GetJackCount"), flags, 2)
        this.vtbl.GetJackDescription3 := CallbackCreate(GetMethod(implObj, "GetJackDescription3"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetJackCount)
        CallbackFree(this.vtbl.GetJackDescription3)
    }
}
