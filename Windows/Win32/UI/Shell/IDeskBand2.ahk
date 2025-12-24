#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDeskBand.ahk

/**
 * Exposes methods to enable and query translucency effects in a deskband object.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ideskband">IDeskBand</a> interfaces, from which it inherits.
 * 
 * If implemented in all active deskbands, this interface allows the taskbar to be displayed using translucent effects. If an active deskband does not implement <b>IDeskBand2</b>, then translucency is disabled for the entire taskbar.
 * 
 * A deskband can implement <b>IDeskBand2</b> as a communication conduit between itself and the taskbar as follows:
 * 
 *                 
 * 
 * <ul>
 * <li>Taskbar calls <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ideskband2-canrendercomposited">IDeskBand2::CanRenderComposited</a> to learn if a deskband supports translucency. If one or more do not, the entire taskbar is rendered opaque.</li>
 * <li>Taskbar calls <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ideskband2-setcompositionstate">IDeskBand2::SetCompositionState</a> as appropriate in response to a user turning translucent effects on or off. The taskbar should attempt to render itself translucent or opaque in response to this call.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ideskband2-getcompositionstate">IDeskBand2::GetCompositionState</a> is the counterpart of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ideskband2-setcompositionstate">IDeskBand2::SetCompositionState</a>.</li>
 * </ul>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ideskband2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDeskBand2 extends IDeskBand{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeskBand2
     * @type {Guid}
     */
    static IID => Guid("{79d16de4-abee-4021-8d9d-9169b261d657}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanRenderComposited", "SetCompositionState", "GetCompositionState"]

    /**
     * Indicates the deskband's ability to be displayed as translucent.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, contains a <b>BOOL</b> indicating ability.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ideskband2-canrendercomposited
     */
    CanRenderComposited() {
        result := ComCall(9, this, "int*", &pfCanRenderComposited := 0, "HRESULT")
        return pfCanRenderComposited
    }

    /**
     * Sets the composition state.
     * @param {BOOL} fCompositionEnabled Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable the composition state; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ideskband2-setcompositionstate
     */
    SetCompositionState(fCompositionEnabled) {
        result := ComCall(10, this, "int", fCompositionEnabled, "HRESULT")
        return result
    }

    /**
     * Gets the composition state.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, contains a <b>BOOL</b> that indicates state.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ideskband2-getcompositionstate
     */
    GetCompositionState() {
        result := ComCall(11, this, "int*", &pfCompositionEnabled := 0, "HRESULT")
        return pfCompositionEnabled
    }
}
