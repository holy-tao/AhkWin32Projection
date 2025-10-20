#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to determine if the Text Input Panel is currently running.
 * @remarks
 * 
  * This element is declared in Peninputpanel.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nn-peninputpanel-itextinputpanelruninfo
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ITextInputPanelRunInfo extends IUnknown{
    /**
     * The interface identifier for ITextInputPanelRunInfo
     * @type {Guid}
     */
    static IID => Guid("{9f424568-1920-48cc-9811-a993cbf5adba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfRunning 
     * @returns {HRESULT} 
     */
    IsTipRunning(pfRunning) {
        result := ComCall(3, this, "ptr", pfRunning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
