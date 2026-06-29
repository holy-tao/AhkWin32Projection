#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\KSJACK_DESCRIPTION2.ahk" { KSJACK_DESCRIPTION2 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IKsJackDescription2 interface provides information about the jacks or internal connectors that provide a physical connection between a device on an audio adapter and an external or internal endpoint device (for example, a microphone or CD player).
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iksjackdescription2
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsJackDescription2 extends IUnknown {
    /**
     * The interface identifier for IKsJackDescription2
     * @type {Guid}
     */
    static IID := Guid("{478f3a9b-e0c9-4827-9228-6f5505ffe76a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsJackDescription2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetJackCount        : IntPtr
        GetJackDescription2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsJackDescription2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetJackCount method gets the number of jacks on the connector, which are required to connect to an endpoint device.
     * @returns {Integer} Receives the number of audio jacks associated with the connector.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksjackdescription2-getjackcount
     */
    GetJackCount() {
        result := ComCall(3, this, "uint*", &pcJacks := 0, "HRESULT")
        return pcJacks
    }

    /**
     * The GetJackDescription2 method gets the description of a specified audio jack.
     * @param {Integer} nJack The index of the jack to get a description for. If the connection consists of <i>n</i> jacks, the jacks are numbered from 0 to <i>n</i>– 1. To get the number of jacks, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iksjackdescription2-getjackcount">IKsJackDescription::GetJackCount</a> method.
     * @returns {KSJACK_DESCRIPTION2} Pointer to a caller-allocated buffer into which the method writes a structure of type <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_description2">KSJACK_DESCRIPTION2</a> that contains information about the jack. The buffer size must be at least <c>sizeof(KSJACK_DESCRIPTION2)</c>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksjackdescription2-getjackdescription2
     */
    GetJackDescription2(nJack) {
        pDescription2 := KSJACK_DESCRIPTION2()
        result := ComCall(4, this, "uint", nJack, KSJACK_DESCRIPTION2.Ptr, pDescription2, "HRESULT")
        return pDescription2
    }

    Query(iid) {
        if (IKsJackDescription2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetJackCount := CallbackCreate(GetMethod(implObj, "GetJackCount"), flags, 2)
        this.vtbl.GetJackDescription2 := CallbackCreate(GetMethod(implObj, "GetJackDescription2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetJackCount)
        CallbackFree(this.vtbl.GetJackDescription2)
    }
}
