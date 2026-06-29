#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_SignalProperties)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_signalproperties
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_SignalProperties extends IUnknown {
    /**
     * The interface identifier for IBDA_SignalProperties
     * @type {Guid}
     */
    static IID := Guid("{d2f1644b-b409-11d2-bc69-00a0c9ee9e16}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_SignalProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PutNetworkType  : IntPtr
        GetNetworkType  : IntPtr
        PutSignalSource : IntPtr
        GetSignalSource : IntPtr
        PutTuningSpace  : IntPtr
        GetTuningSpace  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_SignalProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Pointer<Guid>} guidNetworkType Specifies the network type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-putnetworktype
     */
    PutNetworkType(guidNetworkType) {
        result := ComCall(3, this, Guid.Ptr, guidNetworkType, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Pointer<Guid>} pguidNetworkType Receives a GUID identifying the network type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-getnetworktype
     */
    GetNetworkType(pguidNetworkType) {
        result := ComCall(4, this, Guid.Ptr, pguidNetworkType, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} ulSignalSource Specifies the signal source.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-putsignalsource
     */
    PutSignalSource(ulSignalSource) {
        result := ComCall(5, this, "uint", ulSignalSource, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method returns whatever value was last set by calling <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_signalproperties-putsignalsource">IBDA_SignalProperties::PutSignalSource</a>.
     * 
     * <div class="alert"><b>Note</b>  The <i>pulSignalSource</i> parameter is marked in the IDL file as [in, out] but is used as an [out] parameter. To preserve binary compatibility with previous versions, it has not been changed.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pulSignalSource Receives a value identifying the signal source. The value is an arbitrary identifier set by the network provider. If two tuners share the same signal source, they should have the same identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-getsignalsource
     */
    GetSignalSource(pulSignalSource) {
        pulSignalSourceMarshal := pulSignalSource is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulSignalSourceMarshal, pulSignalSource, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Pointer<Guid>} guidTuningSpace Specifies the tuning space.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-puttuningspace
     */
    PutTuningSpace(guidTuningSpace) {
        result := ComCall(7, this, Guid.Ptr, guidTuningSpace, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Pointer<Guid>} pguidTuingSpace Pointer to a variable that receives a GUID identifying the tuning space.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-gettuningspace
     */
    GetTuningSpace(pguidTuingSpace) {
        result := ComCall(8, this, Guid.Ptr, pguidTuingSpace, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_SignalProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PutNetworkType := CallbackCreate(GetMethod(implObj, "PutNetworkType"), flags, 2)
        this.vtbl.GetNetworkType := CallbackCreate(GetMethod(implObj, "GetNetworkType"), flags, 2)
        this.vtbl.PutSignalSource := CallbackCreate(GetMethod(implObj, "PutSignalSource"), flags, 2)
        this.vtbl.GetSignalSource := CallbackCreate(GetMethod(implObj, "GetSignalSource"), flags, 2)
        this.vtbl.PutTuningSpace := CallbackCreate(GetMethod(implObj, "PutTuningSpace"), flags, 2)
        this.vtbl.GetTuningSpace := CallbackCreate(GetMethod(implObj, "GetTuningSpace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PutNetworkType)
        CallbackFree(this.vtbl.GetNetworkType)
        CallbackFree(this.vtbl.PutSignalSource)
        CallbackFree(this.vtbl.GetSignalSource)
        CallbackFree(this.vtbl.PutTuningSpace)
        CallbackFree(this.vtbl.GetTuningSpace)
    }
}
