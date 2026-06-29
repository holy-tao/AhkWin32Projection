#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TfLBBalloonStyle.ahk" { TfLBBalloonStyle }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfFnBalloon interface is implemented by a text service and is used by an application or other text service to update the balloon item that the text service adds to the language bar.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnballoon
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnBalloon extends IUnknown {
    /**
     * The interface identifier for ITfFnBalloon
     * @type {Guid}
     */
    static IID := Guid("{3bab89e4-5fbe-45f4-a5bc-dca36ad225a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnBalloon interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UpdateBalloon : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnBalloon.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnBalloon::UpdateBalloon method
     * @remarks
     * The language bar balloon implementation should update its style and text by modifying the values returned from <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getstatus">ITfLangBarItemBalloon::GetBalloonInfo</a> and then call <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemsink-onupdate">ITfLangBarItemSink::OnUpdate</a> with TF_LBI_BALLOON to cause the language bar to obtain the updated information.
     * @param {TfLBBalloonStyle} style Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbballoonstyle">TfLBBalloonStyle</a> values that specifies the new balloon style.
     * @param {PWSTR} pch Pointer to a <b>WCHAR</b> buffer that contains the new text for the balloon.
     * @param {Integer} cch Contains the number of characters of the new text in <i>pch</i>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnballoon-updateballoon
     */
    UpdateBalloon(style, pch, cch) {
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(3, this, TfLBBalloonStyle, style, "ptr", pch, "uint", cch, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnBalloon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateBalloon := CallbackCreate(GetMethod(implObj, "UpdateBalloon"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateBalloon)
    }
}
