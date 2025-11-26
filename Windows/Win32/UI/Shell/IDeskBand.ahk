#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDockingWindow.ahk

/**
 * Used to obtain information about a band object.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> interfaces, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IDeskBand</b> if you are implementing a band object.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * You do not call this interface directly. <b>IDeskBand</b> is used by the Shell or the browser to obtain display information for a band object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ideskband
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDeskBand extends IDockingWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeskBand
     * @type {Guid}
     */
    static IID => Guid("{eb0fe172-1a3a-11d0-89b3-00a0c90a90ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBandInfo"]

    /**
     * Gets state information for a band object.
     * @param {Integer} dwBandID Type: <b>DWORD</b>
     * 
     * The identifier of the band, assigned by the container. The band object can retain this value if it is required.
     * @param {Integer} dwViewMode Type: <b>DWORD</b>
     * @param {Pointer<DESKBANDINFO>} pdbi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-deskbandinfo">DESKBANDINFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-deskbandinfo">DESKBANDINFO</a> structure that receives the band information for the object. The <b>dwMask</b> member of this structure indicates the specific information that is being requested.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ideskband-getbandinfo
     */
    GetBandInfo(dwBandID, dwViewMode, pdbi) {
        result := ComCall(8, this, "uint", dwBandID, "uint", dwViewMode, "ptr", pdbi, "HRESULT")
        return result
    }
}
