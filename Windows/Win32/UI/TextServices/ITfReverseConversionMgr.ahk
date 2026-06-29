#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfReverseConversion.ahk" { ITfReverseConversion }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to ITfReverseConversion objects, which are used to perform reverse conversions.
 * @remarks
 * A reverse conversion provides the keystroke sequences required to create the specified string.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfreverseconversionmgr
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfReverseConversionMgr extends IUnknown {
    /**
     * The interface identifier for ITfReverseConversionMgr
     * @type {Guid}
     */
    static IID := Guid("{b643c236-c493-41b6-abb3-692412775cc4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfReverseConversionMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetReverseConversion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfReverseConversionMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an ITfReverseConversion object that can perform reverse conversions.
     * @remarks
     * A reverse conversion provides the keystroke sequences required to create the specified string.
     * 
     * When neither the <b>TF_RCM_HINT_COLLISION</b> or <b>TF_RCM_HINT_READING_LENGTH</b> flag is  specified for <i>dwflag</i>, the IME might not arrange the output in any sort of order.
     * @param {Integer} langid The language ID of the profile to which the target strings belong.
     * @param {Pointer<Guid>} guidProfile The GUID of the profile to which the target strings belong.
     * @param {Integer} dwflag <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RCM_COMLESS"></a><a id="tf_rcm_comless"></a><dl>
     * <dt><b>TF_RCM_COMLESS</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activate the reverse conversion interface without COM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RCM_VKEY"></a><a id="tf_rcm_vkey"></a><dl>
     * <dt><b>TF_RCM_VKEY</b></dt>
     * <dt> 0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output should be an array of virtual key codes (instead of character key codes). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RCM_HINT_READING_LENGTH"></a><a id="tf_rcm_hint_reading_length"></a><dl>
     * <dt><b>TF_RCM_HINT_READING_LENGTH</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reverse conversion should prioritize the order of entries in the output list based on the length of input sequence, with the shortest sequences first. It is possible that an input sequence with a low collision count might be much higher than an input sequence with a similar (but slightly higher) collision count. The interpretation of this flag varies depending on the IME. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RCM_HINT_COLLISION_"></a><a id="tf_rcm_hint_collision_"></a><dl>
     * <dt><b>TF_RCM_HINT_COLLISION </b></dt>
     * <dt> 0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reverse conversion should prioritize the order of entries in the output list based on the collision count, with the entries containing the lowest number of collisions first.    If an input sequence corresponds to many more characters than a slightly longer input sequence, it might  be preferable to use the longer input sequence instead.  The IME determines whether this flag will affect the reverse conversion output.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {ITfReverseConversion} A pointer to the address of the ITfReverseConversion object that can perform the specified reverse conversion.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreverseconversionmgr-getreverseconversion
     */
    GetReverseConversion(langid, guidProfile, dwflag) {
        result := ComCall(3, this, "ushort", langid, Guid.Ptr, guidProfile, "uint", dwflag, "ptr*", &ppReverseConversion := 0, "HRESULT")
        return ITfReverseConversion(ppReverseConversion)
    }

    Query(iid) {
        if (ITfReverseConversionMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetReverseConversion := CallbackCreate(GetMethod(implObj, "GetReverseConversion"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetReverseConversion)
    }
}
