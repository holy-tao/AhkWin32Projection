#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWindowsParentalControlsCore.ahk

/**
 * Enables access to all settings interfaces of the Minimum Compliance API.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwindowsparentalcontrols
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWindowsParentalControls extends IWindowsParentalControlsCore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsParentalControls
     * @type {Guid}
     */
    static IID => Guid("{28b4d88b-e072-49e6-804d-26edbe21a7b9}")

    /**
     * The class identifier for WindowsParentalControls
     * @type {Guid}
     */
    static CLSID => Guid("{e77cc89b-7401-4c04-8ced-149db35add04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGamesSettings"]

    /**
     * 
     * @param {PWSTR} pcszSID 
     * @param {Pointer<IWPCGamesSettings>} ppSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwindowsparentalcontrols-getgamessettings
     */
    GetGamesSettings(pcszSID, ppSettings) {
        pcszSID := pcszSID is String ? StrPtr(pcszSID) : pcszSID

        result := ComCall(7, this, "ptr", pcszSID, "ptr*", ppSettings, "HRESULT")
        return result
    }
}
