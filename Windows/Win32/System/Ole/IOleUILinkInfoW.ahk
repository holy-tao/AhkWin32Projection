#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\IOleUILinkContainerW.ahk

/**
 * An extension of the IOleUILinkContainer interface. It returns the time that an object was last updated, which is link information that IOleUILinkContainer does not provide.
 * @remarks
 * 
  * > [!NOTE]
  * > The oledlg.h header defines IOleUILinkInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/nn-oledlg-ioleuilinkinfow
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class IOleUILinkInfoW extends IOleUILinkContainerW{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastUpdate"]

    /**
     * 
     * @param {Integer} dwLink 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkinfow-getlastupdate
     */
    GetLastUpdate(dwLink) {
        lpLastUpdate := FILETIME()
        result := ComCall(11, this, "uint", dwLink, "ptr", lpLastUpdate, "HRESULT")
        return lpLastUpdate
    }
}
