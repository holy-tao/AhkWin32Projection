#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\InterleavingMode.ahk" { InterleavingMode }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IConfigInterleaving interface controls how the AVI Mux filter interleaves audio and video samples.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iconfiginterleaving
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IConfigInterleaving extends IUnknown {
    /**
     * The interface identifier for IConfigInterleaving
     * @type {Guid}
     */
    static IID := Guid("{bee3d220-157b-11d0-bd23-00a0c911ce86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConfigInterleaving interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_Mode         : IntPtr
        get_Mode         : IntPtr
        put_Interleaving : IntPtr
        get_Interleaving : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConfigInterleaving.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {InterleavingMode} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * The put_Mode method sets how audio samples and video frames are to be written to disk, by specifying quality of interleaving.
     * @param {InterleavingMode} _mode Interleaving quality setting specified in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-interleavingmode">InterleavingMode</a> enumeration.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfiginterleaving-put_mode
     */
    put_Mode(_mode) {
        result := ComCall(3, this, InterleavingMode, _mode, "HRESULT")
        return result
    }

    /**
     * The get_Mode method retrieves the interleaving quality setting.
     * @returns {InterleavingMode} Receives the interleaving quality, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-interleavingmode">InterleavingMode</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfiginterleaving-get_mode
     */
    get_Mode() {
        result := ComCall(4, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * The put_Interleaving method sets the audio preroll time and the frequency of interleaving for an AVI file.
     * @remarks
     * An audio preroll of 750 milliseconds is recommended when authoring a file for distribution.
     *       
     * 
     * If you do not call this method, the default value for <i>prtInterleave</i> is 1000 milliseconds. The smaller the number, the larger the resulting file.
     * @param {Pointer<Integer>} prtInterleave The approximate duration of each interleaved group of audio or video chunks, in 100-nanosecond units.
     *           The exact amount of interleaving is also affected by the interleave mode, which is specified by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iconfiginterleaving-put_mode">IConfigInterleaving::put_Mode</a>.
     * @param {Pointer<Integer>} prtPreroll The amount of audio data, in 100-nanosecond units, that is written to the file before the first video frame.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfiginterleaving-put_interleaving
     */
    put_Interleaving(prtInterleave, prtPreroll) {
        prtInterleaveMarshal := prtInterleave is VarRef ? "int64*" : "ptr"
        prtPrerollMarshal := prtPreroll is VarRef ? "int64*" : "ptr"

        result := ComCall(5, this, prtInterleaveMarshal, prtInterleave, prtPrerollMarshal, prtPreroll, "HRESULT")
        return result
    }

    /**
     * The get_Interleaving method gets the audio preroll time and the frequency of interleaving for an AVI file.
     * @remarks
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iconfiginterleaving-put_interleaving">IConfigInterleaving::put_Interleaving</a>.
     * @param {Pointer<Integer>} prtInterleave Receives the approximate duration of each interleaved group of audio or video chunks.
     * @param {Pointer<Integer>} prtPreroll Receives the amount of audio data, in 100-nanosecond units, that is written to the file before the first video frame.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfiginterleaving-get_interleaving
     */
    get_Interleaving(prtInterleave, prtPreroll) {
        prtInterleaveMarshal := prtInterleave is VarRef ? "int64*" : "ptr"
        prtPrerollMarshal := prtPreroll is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, prtInterleaveMarshal, prtInterleave, prtPrerollMarshal, prtPreroll, "HRESULT")
        return result
    }

    Query(iid) {
        if (IConfigInterleaving.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Mode := CallbackCreate(GetMethod(implObj, "put_Mode"), flags, 2)
        this.vtbl.get_Mode := CallbackCreate(GetMethod(implObj, "get_Mode"), flags, 2)
        this.vtbl.put_Interleaving := CallbackCreate(GetMethod(implObj, "put_Interleaving"), flags, 3)
        this.vtbl.get_Interleaving := CallbackCreate(GetMethod(implObj, "get_Interleaving"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Mode)
        CallbackFree(this.vtbl.get_Mode)
        CallbackFree(this.vtbl.put_Interleaving)
        CallbackFree(this.vtbl.get_Interleaving)
    }
}
