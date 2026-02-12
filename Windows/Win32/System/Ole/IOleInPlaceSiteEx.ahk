#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleInPlaceSite.ahk

/**
 * Provides an additional set of activation and deactivation notification methods that enable an object to avoid unnecessary flashing on the screen when the object is activated and deactivated.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-ioleinplacesiteex
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceSiteEx extends IOleInPlaceSite{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceSiteEx
     * @type {Guid}
     */
    static IID => Guid("{9c2cad80-3424-11cf-b670-00aa004cd6d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInPlaceActivateEx", "OnInPlaceDeactivateEx", "RequestUIActivate"]

    /**
     * Called by the embedded object to determine whether it needs to redraw itself upon activation.
     * @remarks
     * This method replaces <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-oninplaceactivate">IOleInPlaceSite::OnInPlaceActivate</a>. If the older method is used, the object must always redraw itself on activation.
     * 
     * Windowless objects are required to use this method instead of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-oninplaceactivate">IOleInPlaceSite::OnInPlaceActivate</a> to notify the container of whether they are activating windowless or not.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The container should carefully check the invalidation status of the object, its z-order, clipping and any other relevant parameters to determine the appropriate value to return in <i>pfNoRedraw</i>.
     * 
     * A container can cache the value of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-activateflags">ACTIVATEFLAGS</a> enumeration instead of calling the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolewindow-getwindow">GetWindow</a> method in the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplaceobjectwindowless">IOleInPlaceObjectWindowless</a> interface repeatedly.
     * @param {Integer} dwFlags Indicates whether the object is activated as a windowless object. This parameter takes values from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-activateflags">ACTIVATEFLAGS</a> enumeration. See <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplacesitewindowless">IOleInPlaceSiteWindowless</a> for more information on windowless objects.
     * @returns {BOOL} A pointer to a variable that receives the current redraw status. The status is <b>TRUE</b> if the object need not redraw itself upon activation and <b>FALSE</b> otherwise. Windowless objects usually do not need the value returned by this parameter and may pass a <b>NULL</b> pointer to save the container the burden of computing this value.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleinplacesiteex-oninplaceactivateex
     */
    OnInPlaceActivateEx(dwFlags) {
        result := ComCall(15, this, "int*", &pfNoRedraw := 0, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfNoRedraw
    }

    /**
     * Notifies the container if the object needs to be redrawn upon deactivation.
     * @remarks
     * This method replaces <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-oninplacedeactivate">IOleInPlaceSite::OnInPlaceDeactivate</a>. If the older method is used, the object must always be redrawn on deactivation.
     * @param {BOOL} fNoRedraw If <b>TRUE</b>, the container need not redraw the object after completing the deactivation; if <b>FALSE</b> the object must be redrawn after deactivation.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleinplacesiteex-oninplacedeactivateex
     */
    OnInPlaceDeactivateEx(fNoRedraw) {
        result := ComCall(16, this, "int", fNoRedraw, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the container that the object is about to enter the UI-active state.
     * @remarks
     * An object calls this method to determine if it can enter the UI-active state and to notify the container that it is about to make this transition. The container can return S_FALSE to deny this request, for example, if the end user has canceled the operation or if the currently active object will not relinquish its active state.
     * 
     * If the object does not call <b>IOleInPlaceSiteEx::RequestUIActivate</b>, the container handles data validation and fires Enter and Exit events from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-onuiactivate">IOleInPlaceSite::OnUIActivate</a>.
     * @returns {HRESULT} This method returns S_OK if the object can continue the activation process and call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-onuiactivate">IOleInPlaceSite::OnUIActivate</a>. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object cannot enter the UI-active state. The object must call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-onuideactivate">IOleInPlaceSite::OnUIDeactivate</a> so the container can perform its the necessary processing to restore the focus.
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
     * The operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleinplacesiteex-requestuiactivate
     */
    RequestUIActivate() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
