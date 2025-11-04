#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sharewindowcommandsourceinterop/nn-sharewindowcommandsourceinterop-isharewindowcommandsourceinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IShareWindowCommandSourceInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareWindowCommandSourceInterop
     * @type {Guid}
     */
    static IID => Guid("{461a191f-8424-43a6-a0fa-3451a22f56ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} shareWindowCommandSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sharewindowcommandsourceinterop/nf-sharewindowcommandsourceinterop-isharewindowcommandsourceinterop-getforwindow
     */
    GetForWindow(appWindow, riid, shareWindowCommandSource) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        shareWindowCommandSourceMarshal := shareWindowCommandSource is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", appWindow, "ptr", riid, shareWindowCommandSourceMarshal, shareWindowCommandSource, "HRESULT")
        return result
    }
}
