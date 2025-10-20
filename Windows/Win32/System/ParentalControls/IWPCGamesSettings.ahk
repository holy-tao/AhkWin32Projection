#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWPCSettings.ahk

/**
 * Accesses games settings for the user.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwpcgamessettings
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
     * 
     * @param {Guid} guidAppID 
     * @param {Pointer<Integer>} pdwReasons 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcgamessettings-isblocked
     */
    IsBlocked(guidAppID, pdwReasons) {
        result := ComCall(6, this, "ptr", guidAppID, "uint*", pdwReasons, "HRESULT")
        return result
    }
}
