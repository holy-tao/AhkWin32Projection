#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method for retrieving an AppUserModelId.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ilaunchsourceappusermodelid
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ILaunchSourceAppUserModelId extends IUnknown{
    /**
     * The interface identifier for ILaunchSourceAppUserModelId
     * @type {Guid}
     */
    static IID => Guid("{989191ac-28ff-4cf0-9584-e0d078bc2396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} launchingApp 
     * @returns {HRESULT} 
     */
    GetAppUserModelId(launchingApp) {
        result := ComCall(3, this, "ptr", launchingApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
