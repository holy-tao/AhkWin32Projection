#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IBriefcaseInitiator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBriefcaseInitiator
     * @type {Guid}
     */
    static IID => Guid("{99180164-da16-101a-935c-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsMonikerInBriefcase"]

    /**
     * 
     * @param {IMoniker} pmk 
     * @returns {HRESULT} 
     */
    IsMonikerInBriefcase(pmk) {
        result := ComCall(3, this, "ptr", pmk, "HRESULT")
        return result
    }
}
