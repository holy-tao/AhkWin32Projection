#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables Microsoft UI Automation client applications to direct the mouse or keyboard input to a specific UI element.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-isynchronizedinputprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ISynchronizedInputProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronizedInputProvider
     * @type {Guid}
     */
    static IID => Guid("{29db1a06-02ce-4cf7-9b42-565d4fab20ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartListening", "Cancel"]

    /**
     * Starts listening for input of the specified type.
     * @remarks
     * When it finds matching input, the provider checks if the target UI Automation element matches the current element. If they match, the provider raises the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputReachedTargetEventId</a> event; otherwise, it raises the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputReachedOtherElementEventId</a>  or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_InputDiscardedEventId</a> event. The UI Automation provider must discard the input if it is for an element other than this one.
     * 
     * This is a one-shot method; after receiving input, the provider stops listening and continues normally.
     * 
     * This method returns E_INVALIDOPERATION if the provider is already listening for input.
     * @param {Integer} inputType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype">SynchronizedInputType</a></b>
     * 
     * The type of input that is requested to be synchronized.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-isynchronizedinputprovider-startlistening
     */
    StartListening(inputType) {
        result := ComCall(3, this, "int", inputType, "HRESULT")
        return result
    }

    /**
     * Cancels listening for input.
     * @remarks
     * If the provider is currently listening for input, it should revert to normal operation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-isynchronizedinputprovider-cancel
     */
    Cancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
