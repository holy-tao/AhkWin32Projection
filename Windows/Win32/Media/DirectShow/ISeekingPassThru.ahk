#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPin.ahk" { IPin }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISeekingPassThru interface creates a helper object that implements seeking for one-input filters.
 * @remarks
 * To obtain this interface, call <b>CoCreateInstance</b> with CLSID_SeekingPassThru. You can also use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/createpospassthru">CreatePosPassThru</a> function in the base class library.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iseekingpassthru
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ISeekingPassThru extends IUnknown {
    /**
     * The interface identifier for ISeekingPassThru
     * @type {Guid}
     */
    static IID := Guid("{36b73883-c2c8-11cf-8b46-00805f6cef60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISeekingPassThru interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISeekingPassThru.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Init method initializes the seeking helper object.
     * @param {BOOL} bSupportRendering Boolean value that specifies whether the filter is a renderer. Use the value <b>TRUE</b> if the filter is a renderer, or <b>FALSE</b> otherwise.
     * @param {IPin} pPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface on the input pin of the filter.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object was already initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to create the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iseekingpassthru-init
     */
    Init(bSupportRendering, pPin) {
        result := ComCall(3, this, BOOL, bSupportRendering, "ptr", pPin, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISeekingPassThru.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
    }
}
