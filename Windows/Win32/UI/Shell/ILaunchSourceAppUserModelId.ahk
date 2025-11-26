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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppUserModelId"]

    /**
     * Retrieves an AppUserModelId from the source application.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Contains a  pointer to a string that contains the <a href="https://docs.microsoft.com/windows/desktop/shell/appids">AppUserModelId</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ilaunchsourceappusermodelid-getappusermodelid
     */
    GetAppUserModelId() {
        result := ComCall(3, this, "ptr*", &launchingApp := 0, "HRESULT")
        return launchingApp
    }
}
