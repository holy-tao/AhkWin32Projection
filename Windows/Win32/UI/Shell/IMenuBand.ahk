#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a Component Object Model (COM) object to receive and translate appropriate messages.
 * @remarks
 * 
  *  An application can call <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">QueryService</a> with one of the following service IDs. If the <i>riid</i> parameter of <b>QueryService</b> is IAccessible or IDispatch, the call to <b>QueryService</b> creates a new accessibility object. Otherwise, the call to <b>QueryService</b> is equivalent to a call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> with the service ID, as follows:
  * 
  * 
  * 
  * <table class="clsStd">
  * <tr>
  * <th>Service ID (SID)</th>
  * <th>Meaning</th>
  * </tr>
  * <tr>
  * <td>SID_SMenuBandChild</td>
  * <td>Retrieves the pointer to the <b>IMenuBand</b> interface for the submenu.</td>
  * </tr>
  * <tr>
  * <td>SID_SMenuBandParent</td>
  * <td>Retrieves the pointer to the <b>IMenuBand</b> interface for the parent menu.</td>
  * </tr>
  * <tr>
  * <td>SID_SMenuBandTop</td>
  * <td>Retrieves the pointer to the <b>IMenuBand</b> interface for the top menu.</td>
  * </tr>
  * </table>
  *  
  * 
  * In Windows 2000, this interface was implemented in browseui.dll. However, it is not recommended that this version be used.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-imenuband
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IMenuBand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuBand
     * @type {Guid}
     */
    static IID => Guid("{568804cd-cbd7-11d0-9816-00c04fd91972}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsMenuMessage", "TranslateMenuMessage"]

    /**
     * 
     * @param {Pointer<MSG>} pmsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imenuband-ismenumessage
     */
    IsMenuMessage(pmsg) {
        result := ComCall(3, this, "ptr", pmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pmsg 
     * @param {Pointer<LRESULT>} plRet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imenuband-translatemenumessage
     */
    TranslateMenuMessage(pmsg, plRet) {
        result := ComCall(4, this, "ptr", pmsg, "ptr", plRet, "HRESULT")
        return result
    }
}
