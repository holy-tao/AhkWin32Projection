#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDesktopWindowXamlSourceNative.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nn-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative2
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IDesktopWindowXamlSourceNative2 extends IDesktopWindowXamlSourceNative{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesktopWindowXamlSourceNative2
     * @type {Guid}
     */
    static IID => Guid("{e3dcd8c7-3057-4692-99c3-7b7720afda31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreTranslateMessage"]

    /**
     * 
     * @param {Pointer<MSG>} message 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nf-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative2-pretranslatemessage
     */
    PreTranslateMessage(message, result) {
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", message, resultMarshal, result, "HRESULT")
        return result
    }
}
