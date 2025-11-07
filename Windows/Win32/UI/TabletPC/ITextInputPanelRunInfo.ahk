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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsTipRunning"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanelruninfo-istiprunning
     */
    IsTipRunning() {
        result := ComCall(3, this, "int*", &pfRunning := 0, "HRESULT")
        return pfRunning
    }
}
