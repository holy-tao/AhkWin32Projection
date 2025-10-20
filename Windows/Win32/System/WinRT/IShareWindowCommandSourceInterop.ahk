#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IShareWindowCommandSourceInterop extends IUnknown{
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
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} shareWindowCommandSource 
     * @returns {HRESULT} 
     */
    GetForWindow(appWindow, riid, shareWindowCommandSource) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(3, this, "ptr", appWindow, "ptr", riid, "ptr", shareWindowCommandSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
