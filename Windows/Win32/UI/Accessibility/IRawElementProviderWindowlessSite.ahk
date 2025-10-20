#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A Microsoft ActiveX control site implements this interface to enable a Microsoft UI Automation-enabled ActiveX control to express its accessibility.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementproviderwindowlesssite
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderWindowlessSite extends IUnknown{
    /**
     * The interface identifier for IRawElementProviderWindowlessSite
     * @type {Guid}
     */
    static IID => Guid("{0a2a93cc-bfad-42ac-9b2e-0991fb0d3ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} direction 
     * @param {Pointer<IRawElementProviderFragment>} ppParent 
     * @returns {HRESULT} 
     */
    GetAdjacentFragment(direction, ppParent) {
        result := ComCall(3, this, "int", direction, "ptr", ppParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pRetVal 
     * @returns {HRESULT} 
     */
    GetRuntimeIdPrefix(pRetVal) {
        result := ComCall(4, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
