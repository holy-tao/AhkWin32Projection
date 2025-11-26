#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables controls and containers to avoid performance bottlenecks on loading controls. It combines the load-time or initialization-time handshaking between the control and its container into a single call.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iquickactivate
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IQuickActivate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQuickActivate
     * @type {Guid}
     */
    static IID => Guid("{cf51ed10-62fe-11cf-bf86-00a0c9034836}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QuickActivate", "SetContentExtent", "GetContentExtent"]

    /**
     * Quick activates a control.
     * @param {Pointer<QACONTAINER>} pQaContainer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontainer">QACONTAINER</a> structure containing information about the container.
     * @param {Pointer<QACONTROL>} pQaControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontrol">QACONTROL</a> structure filled in by the control to return information about the control to the container. The container calling this method must reserve memory for this structure.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iquickactivate-quickactivate
     */
    QuickActivate(pQaContainer, pQaControl) {
        result := ComCall(3, this, "ptr", pQaContainer, "ptr", pQaControl, "HRESULT")
        return result
    }

    /**
     * Sets the content extent of a control.
     * @param {Pointer<SIZE>} pSizel The size of the content extent.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iquickactivate-setcontentextent
     */
    SetContentExtent(pSizel) {
        result := ComCall(4, this, "ptr", pSizel, "HRESULT")
        return result
    }

    /**
     * Gets the content extent of a control.
     * @returns {SIZE} A pointer to a structure that contains size of the content extent.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iquickactivate-getcontentextent
     */
    GetContentExtent() {
        pSizel := SIZE()
        result := ComCall(5, this, "ptr", pSizel, "HRESULT")
        return pSizel
    }
}
