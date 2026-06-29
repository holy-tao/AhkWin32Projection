#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IImageDecodeEventSink extends IUnknown {
    /**
     * The interface identifier for IImageDecodeEventSink
     * @type {Guid}
     */
    static IID := Guid("{baa342a0-2ded-11d0-86f4-00a0c913f750}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImageDecodeEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSurface       : IntPtr
        OnBeginDecode    : IntPtr
        OnBitsComplete   : IntPtr
        OnDecodeComplete : IntPtr
        OnPalette        : IntPtr
        OnProgress       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImageDecodeEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} nWidth 
     * @param {Integer} nHeight 
     * @param {Pointer<Guid>} bfid 
     * @param {Integer} nPasses 
     * @param {Integer} dwHints 
     * @returns {IUnknown} 
     */
    GetSurface(nWidth, nHeight, bfid, nPasses, dwHints) {
        result := ComCall(3, this, "int", nWidth, "int", nHeight, Guid.Ptr, bfid, "uint", nPasses, "uint", dwHints, "ptr*", &ppSurface := 0, "HRESULT")
        return IUnknown(ppSurface)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwEvents 
     * @param {Pointer<Integer>} pnFormats 
     * @param {Pointer<Pointer<Guid>>} ppFormats 
     * @returns {HRESULT} 
     */
    OnBeginDecode(pdwEvents, pnFormats, ppFormats) {
        pdwEventsMarshal := pdwEvents is VarRef ? "uint*" : "ptr"
        pnFormatsMarshal := pnFormats is VarRef ? "uint*" : "ptr"
        ppFormatsMarshal := ppFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pdwEventsMarshal, pdwEvents, pnFormatsMarshal, pnFormats, ppFormatsMarshal, ppFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnBitsComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    OnDecodeComplete(hrStatus) {
        result := ComCall(6, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnPalette() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pBounds 
     * @param {BOOL} bComplete 
     * @returns {HRESULT} 
     */
    OnProgress(pBounds, bComplete) {
        result := ComCall(8, this, RECT.Ptr, pBounds, BOOL, bComplete, "HRESULT")
        return result
    }

    Query(iid) {
        if (IImageDecodeEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSurface := CallbackCreate(GetMethod(implObj, "GetSurface"), flags, 7)
        this.vtbl.OnBeginDecode := CallbackCreate(GetMethod(implObj, "OnBeginDecode"), flags, 4)
        this.vtbl.OnBitsComplete := CallbackCreate(GetMethod(implObj, "OnBitsComplete"), flags, 1)
        this.vtbl.OnDecodeComplete := CallbackCreate(GetMethod(implObj, "OnDecodeComplete"), flags, 2)
        this.vtbl.OnPalette := CallbackCreate(GetMethod(implObj, "OnPalette"), flags, 1)
        this.vtbl.OnProgress := CallbackCreate(GetMethod(implObj, "OnProgress"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSurface)
        CallbackFree(this.vtbl.OnBeginDecode)
        CallbackFree(this.vtbl.OnBitsComplete)
        CallbackFree(this.vtbl.OnDecodeComplete)
        CallbackFree(this.vtbl.OnPalette)
        CallbackFree(this.vtbl.OnProgress)
    }
}
