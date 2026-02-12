#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TF_LANGBARITEMINFO.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarItem interface is implemented by a language bar item provider and used by the language bar manager to obtain detailed information about the language bar item.
 * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nn-ctfutb-itflangbaritem
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarItem
     * @type {Guid}
     */
    static IID => Guid("{73540d69-edeb-4ee9-96c9-23aa30b25916}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "GetStatus", "Show", "GetTooltipString"]

    /**
     * ITfLangBarItem::GetInfo method
     * @returns {TF_LANGBARITEMINFO} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/ns-ctfutb-tf_langbariteminfo">TF_LANGBARITEMINFO</a> structure that receives the language bar item information.
     * 
     * Starting with Windows 8, the item will be ignored if the structure does not include GUID_LBI_INPUTMODE. For more information, see [Third-party input method editors](https://docs.microsoft.com/en-us/windows/win32/w8cookbook/third-party-input-method-editors#manifestation) in the Compatibility cookbook for Windows.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbaritem-getinfo
     */
    GetInfo() {
        pInfo := TF_LANGBARITEMINFO()
        result := ComCall(3, this, "ptr", pInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInfo
    }

    /**
     * ITfLangBarItem::GetStatus method
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-lbi-status--constants">TF_LBI_STATUS_*</a> values that indicate the current status of the item.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbaritem-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "uint*", &pdwStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwStatus
    }

    /**
     * ITfLangBarItem::Show method
     * @remarks
     * The language bar item implementation should update its visible status by modifying the value returned from <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getstatus">ITfLangBarItem::GetStatus</a> to include or exclude the TF_LBI_STATUS_HIDDEN status flag. The implementation then prompts language bar to obtain the new status value by calling <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemsink-onupdate">ITfLangBarItemSink::OnUpdate</a> with TF_LBI_STATUS.
     * 
     * This method is only useful when the item has the TF_LBI_STYLE_HIDDENSTATUSCONTROL style. Without this style, only the language bar can show or hide the item.
     * @param {BOOL} fShow Contains a <b>BOOL</b> that indicates if the item should be shown or hidden. Contains a nonzero value if the item should be shown or zero otherwise.
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
     * The language bar item does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbaritem-show
     */
    Show(fShow) {
        result := ComCall(5, this, "int", fShow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfLangBarItem::GetTooltipString method
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that receives the tooltip string for the language bar item. This string must be allocated using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> function. The caller must free this buffer when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbaritem-gettooltipstring
     */
    GetTooltipString() {
        pbstrToolTip := BSTR()
        result := ComCall(6, this, "ptr", pbstrToolTip, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrToolTip
    }
}
