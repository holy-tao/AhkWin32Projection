#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IAMNetShowPreroll interface sets and retrieves the preroll settings for the legacy Windows Media Player 6.4 source filter. The Windows Media Source filter implements this interface. The filter's default preroll time is five seconds.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iamnetshowpreroll
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMNetShowPreroll extends IDispatch {
    /**
     * The interface identifier for IAMNetShowPreroll
     * @type {Guid}
     */
    static IID := Guid("{aae7e4e2-6388-11d1-8d93-006097c9a2b2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMNetShowPreroll interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_Preroll : IntPtr
        get_Preroll : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMNetShowPreroll.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Preroll {
        get => this.get_Preroll()
        set => this.put_Preroll(value)
    }

    /**
     * The put_Preroll method specifies whether the filter should start prerolling.
     * @param {VARIANT_BOOL} fPreroll 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowpreroll-put_preroll
     */
    put_Preroll(fPreroll) {
        result := ComCall(7, this, VARIANT_BOOL, fPreroll, "HRESULT")
        return result
    }

    /**
     * The get_Preroll method queries whether the filter is currently prerolling.
     * @param {Pointer<VARIANT_BOOL>} pfPreroll Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowpreroll-get_preroll
     */
    get_Preroll(pfPreroll) {
        pfPrerollMarshal := pfPreroll is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, pfPrerollMarshal, pfPreroll, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMNetShowPreroll.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Preroll := CallbackCreate(GetMethod(implObj, "put_Preroll"), flags, 2)
        this.vtbl.get_Preroll := CallbackCreate(GetMethod(implObj, "get_Preroll"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Preroll)
        CallbackFree(this.vtbl.get_Preroll)
    }
}
