#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables Microsoft UI Automation client applications to direct the mouse or keyboard input to a specific UI element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.isynchronizedinputprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ISynchronizedInputProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronizedInputProvider
     * @type {Guid}
     */
    static IID => Guid("{3d60cecb-da54-4aa3-b915-e3244427d4ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "StartListening"]

    /**
     * Cancels listening for input.
     * @remarks
     * If the provider is currently listening for input, it should revert to normal operation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-isynchronizedinputprovider-cancel
     */
    Cancel() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Starts listening for input of the specified type.
     * @param {Integer} inputType The type of input that is requested to be synchronized.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.isynchronizedinputprovider.startlistening
     */
    StartListening(inputType) {
        result := ComCall(7, this, "int", inputType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
