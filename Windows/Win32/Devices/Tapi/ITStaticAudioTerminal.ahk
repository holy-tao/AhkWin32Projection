#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITStaticAudioTerminal interface is an interface that TAPI 3.1 MSPs must expose on all static audio terminals. The interface defines methods on static audio terminal objects that are needed to support phone devices.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itstaticaudioterminal
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITStaticAudioTerminal extends IDispatch {
    /**
     * The interface identifier for ITStaticAudioTerminal
     * @type {Guid}
     */
    static IID := Guid("{a86b7871-d14c-48e6-922e-a8d15f984800}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITStaticAudioTerminal interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_WaveId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITStaticAudioTerminal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    WaveId {
        get => this.get_WaveId()
    }

    /**
     * The get_WaveId method returns the wave ID for the audio device used to implement this terminal.
     * @remarks
     * All MSPs must implement the 
     * <b>get_WaveId</b> method on their audio terminals for TAPI's association of phone devices and audio terminals to work for calls on that MSP's addresses. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstaticaudioterminal">ITStaticAudioTerminal</a> for what to do for audio terminals that are not accessible via standard Windows audio APIs.
     * 
     * All other terminals must return the correct wave ID, even if the internal implementation of the terminal does not use wave. In such cases, a mapping should be possible between the identifier used in the nonwave APIs and the wave ID. The MSP must perform this mapping.
     * @returns {Integer} Pointer to a variable where, on success, the method will store the wave ID for this terminal.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstaticaudioterminal-get_waveid
     */
    get_WaveId() {
        result := ComCall(7, this, "int*", &plWaveId := 0, "HRESULT")
        return plWaveId
    }

    Query(iid) {
        if (ITStaticAudioTerminal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WaveId := CallbackCreate(GetMethod(implObj, "get_WaveId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WaveId)
    }
}
