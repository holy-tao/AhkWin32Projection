#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\LANG_BAR_ITEM_ICON_MODE_FLAGS.ahk" { LANG_BAR_ITEM_ICON_MODE_FLAGS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfSystemDeviceTypeLangBarItem interface is implemented by a system language bar item and used by an application or text service to control how the system item displays its icon.
 * @remarks
 * Support for this interface is optional and must not be assumed.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itfsystemdevicetypelangbaritem
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfSystemDeviceTypeLangBarItem extends IUnknown {
    /**
     * The interface identifier for ITfSystemDeviceTypeLangBarItem
     * @type {Guid}
     */
    static IID := Guid("{45672eb9-9059-46a2-838d-4530355f6a77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfSystemDeviceTypeLangBarItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIconMode : IntPtr
        GetIconMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfSystemDeviceTypeLangBarItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfSystemDeviceTypeLangBarItem::SetIconMode method
     * @param {LANG_BAR_ITEM_ICON_MODE_FLAGS} dwFlags 
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system language bar item does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemdevicetypelangbaritem-seticonmode
     */
    SetIconMode(dwFlags) {
        result := ComCall(3, this, LANG_BAR_ITEM_ICON_MODE_FLAGS, dwFlags, "HRESULT")
        return result
    }

    /**
     * ITfSystemDeviceTypeLangBarItem::GetIconMode method
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives the current icon display mode for a system language bar item. For more information about possible values, see the dwFlags parameter in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itfsystemdevicetypelangbaritem-seticonmode">ITfSystemDeviceTypeLangBarItem::SetIconMode</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemdevicetypelangbaritem-geticonmode
     */
    GetIconMode() {
        result := ComCall(4, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    Query(iid) {
        if (ITfSystemDeviceTypeLangBarItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIconMode := CallbackCreate(GetMethod(implObj, "SetIconMode"), flags, 2)
        this.vtbl.GetIconMode := CallbackCreate(GetMethod(implObj, "GetIconMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIconMode)
        CallbackFree(this.vtbl.GetIconMode)
    }
}
