#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDesktopWindowXamlSourceNative.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IDesktopWindowXamlSourceNative2 extends IDesktopWindowXamlSourceNative{
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
     * 
     * @param {Pointer<MSG>} message 
     * @param {Pointer<BOOL>} result 
     * @returns {HRESULT} 
     */
    PreTranslateMessage(message, result) {
        result := ComCall(5, this, "ptr", message, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
