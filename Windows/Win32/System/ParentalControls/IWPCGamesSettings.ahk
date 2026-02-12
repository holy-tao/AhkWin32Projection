#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWPCSettings.ahk

/**
 * Accesses games settings for the user.
 * @see https://learn.microsoft.com/windows/win32/api//content/wpcapi/nn-wpcapi-iwpcgamessettings
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWPCGamesSettings extends IWPCSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWPCGamesSettings
     * @type {Guid}
     */
    static IID => Guid("{95e87780-e158-489e-b452-bbb850790715}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsBlocked"]

    /**
     * Determines whether the specified game is blocked from execution.
     * @remarks
     * If <i>guidAppID</i> is not found, the policy will default to unrated and set *<i>pdwReasons</i> to WPCFLAG_ISBLOCKED_NOT_BLOCKED.
     * @param {Guid} guidAppID The GUID associated with the game during install or game scan detection.
     * @returns {Integer} The reason code. For a list of values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wpcevent/ne-wpcevent-wpcflag_isblocked">WPCFLAG_ISBLOCKED</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/wpcapi/nf-wpcapi-iwpcgamessettings-isblocked
     */
    IsBlocked(guidAppID) {
        result := ComCall(6, this, "ptr", guidAppID, "uint*", &pdwReasons := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwReasons
    }
}
