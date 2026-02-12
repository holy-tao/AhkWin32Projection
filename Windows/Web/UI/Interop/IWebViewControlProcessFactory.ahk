#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WebViewControlProcess.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class IWebViewControlProcessFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlProcessFactory
     * @type {Guid}
     */
    static IID => Guid("{47b65cf9-a2d2-453c-b097-f6779d4b8e02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithOptions"]

    /**
     * 
     * @param {WebViewControlProcessOptions} processOptions 
     * @returns {WebViewControlProcess} 
     */
    CreateWithOptions(processOptions) {
        result := ComCall(6, this, "ptr", processOptions, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebViewControlProcess(result_)
    }
}
