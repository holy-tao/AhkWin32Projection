#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.viewmanagement.core.coreframeworkinputviewinterop/nn-windows-ui-viewmanagement-core-coreframeworkinputviewinterop-icoreframeworkinputviewinterop
 * @namespace Windows.Win32.System.WinRT.CoreInputView
 * @version v4.0.30319
 */
class ICoreFrameworkInputViewInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreFrameworkInputViewInterop
     * @type {Guid}
     */
    static IID => Guid("{0e3da342-b11c-484b-9c1c-be0d61c2f6c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.viewmanagement.core.coreframeworkinputviewinterop/nf-windows-ui-viewmanagement-core-coreframeworkinputviewinterop-icoreframeworkinputviewinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", &coreFrameworkInputView := 0, "HRESULT")
        return coreFrameworkInputView
    }
}
