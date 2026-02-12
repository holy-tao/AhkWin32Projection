#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WebView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewFactory4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewFactory4
     * @type {Guid}
     */
    static IID => Guid("{82edac58-ee6a-4c9b-a3a0-9347a7d0ef4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithExecutionMode"]

    /**
     * 
     * @param {Integer} executionMode 
     * @returns {WebView} 
     */
    CreateInstanceWithExecutionMode(executionMode) {
        result := ComCall(6, this, "int", executionMode, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebView(value)
    }
}
