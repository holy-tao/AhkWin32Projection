#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHlinkBrowseContext.ahk
#Include ..\..\System\Com\IMoniker.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHlinkTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHlinkTarget
     * @type {Guid}
     */
    static IID => Guid("{79eac9c4-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBrowseContext", "GetBrowseContext", "Navigate", "GetMoniker", "GetFriendlyName"]

    /**
     * 
     * @param {IHlinkBrowseContext} pihlbc 
     * @returns {HRESULT} 
     */
    SetBrowseContext(pihlbc) {
        result := ComCall(3, this, "ptr", pihlbc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHlinkBrowseContext} 
     */
    GetBrowseContext() {
        result := ComCall(4, this, "ptr*", &ppihlbc := 0, "HRESULT")
        return IHlinkBrowseContext(ppihlbc)
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {PWSTR} pwzJumpLocation 
     * @returns {HRESULT} 
     */
    Navigate(grfHLNF, pwzJumpLocation) {
        pwzJumpLocation := pwzJumpLocation is String ? StrPtr(pwzJumpLocation) : pwzJumpLocation

        result := ComCall(5, this, "uint", grfHLNF, "ptr", pwzJumpLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzLocation 
     * @param {Integer} dwAssign 
     * @returns {IMoniker} 
     */
    GetMoniker(pwzLocation, dwAssign) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(6, this, "ptr", pwzLocation, "uint", dwAssign, "ptr*", &ppimkLocation := 0, "HRESULT")
        return IMoniker(ppimkLocation)
    }

    /**
     * 
     * @param {PWSTR} pwzLocation 
     * @returns {PWSTR} 
     */
    GetFriendlyName(pwzLocation) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(7, this, "ptr", pwzLocation, "ptr*", &ppwzFriendlyName := 0, "HRESULT")
        return ppwzFriendlyName
    }
}
