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
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {Integer} grfHLNF 
     * @param {PWSTR} pwzJumpLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/navigate-element
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
     * Retrieves the display name for a certificate. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The cryptdlg.h header defines GetFriendlyNameOfCert as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} pwzLocation 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/cryptdlg/nf-cryptdlg-getfriendlynameofcerta
     */
    GetFriendlyName(pwzLocation) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(7, this, "ptr", pwzLocation, "ptr*", &ppwzFriendlyName := 0, "HRESULT")
        return ppwzFriendlyName
    }
}
