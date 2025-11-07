#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implemented by containers and used by OLE common dialog boxes. It supports these dialog boxes by providing the methods needed to manage a container's links.
 * @remarks
 * 
  * > [!NOTE]
  * > The oledlg.h header defines IOleUILinkContainer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/nn-oledlg-ioleuilinkcontainerw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class IOleUILinkContainerW extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextLink", "SetLinkUpdateOptions", "GetLinkUpdateOptions", "SetLinkSource", "GetLinkSource", "OpenLinkSource", "UpdateLink", "CancelLink"]

    /**
     * 
     * @param {Integer} dwLink 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-getnextlink
     */
    GetNextLink(dwLink) {
        result := ComCall(3, this, "uint", dwLink, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @param {Integer} dwUpdateOpt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-setlinkupdateoptions
     */
    SetLinkUpdateOptions(dwLink, dwUpdateOpt) {
        result := ComCall(4, this, "uint", dwLink, "uint", dwUpdateOpt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-getlinkupdateoptions
     */
    GetLinkUpdateOptions(dwLink) {
        result := ComCall(5, this, "uint", dwLink, "uint*", &lpdwUpdateOpt := 0, "HRESULT")
        return lpdwUpdateOpt
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @param {PWSTR} lpszDisplayName 
     * @param {Integer} lenFileName 
     * @param {BOOL} fValidateSource 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-setlinksource
     */
    SetLinkSource(dwLink, lpszDisplayName, lenFileName, fValidateSource) {
        lpszDisplayName := lpszDisplayName is String ? StrPtr(lpszDisplayName) : lpszDisplayName

        result := ComCall(6, this, "uint", dwLink, "ptr", lpszDisplayName, "uint", lenFileName, "uint*", &pchEaten := 0, "int", fValidateSource, "HRESULT")
        return pchEaten
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @param {Pointer<PWSTR>} lplpszDisplayName 
     * @param {Pointer<Integer>} lplenFileName 
     * @param {Pointer<PWSTR>} lplpszFullLinkType 
     * @param {Pointer<PWSTR>} lplpszShortLinkType 
     * @param {Pointer<BOOL>} lpfSourceAvailable 
     * @param {Pointer<BOOL>} lpfIsSelected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-getlinksource
     */
    GetLinkSource(dwLink, lplpszDisplayName, lplenFileName, lplpszFullLinkType, lplpszShortLinkType, lpfSourceAvailable, lpfIsSelected) {
        lplpszDisplayNameMarshal := lplpszDisplayName is VarRef ? "ptr*" : "ptr"
        lplenFileNameMarshal := lplenFileName is VarRef ? "uint*" : "ptr"
        lplpszFullLinkTypeMarshal := lplpszFullLinkType is VarRef ? "ptr*" : "ptr"
        lplpszShortLinkTypeMarshal := lplpszShortLinkType is VarRef ? "ptr*" : "ptr"
        lpfSourceAvailableMarshal := lpfSourceAvailable is VarRef ? "int*" : "ptr"
        lpfIsSelectedMarshal := lpfIsSelected is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", dwLink, lplpszDisplayNameMarshal, lplpszDisplayName, lplenFileNameMarshal, lplenFileName, lplpszFullLinkTypeMarshal, lplpszFullLinkType, lplpszShortLinkTypeMarshal, lplpszShortLinkType, lpfSourceAvailableMarshal, lpfSourceAvailable, lpfIsSelectedMarshal, lpfIsSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-openlinksource
     */
    OpenLinkSource(dwLink) {
        result := ComCall(8, this, "uint", dwLink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @param {BOOL} fErrorMessage 
     * @param {BOOL} fReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-updatelink
     */
    UpdateLink(dwLink, fErrorMessage, fReserved) {
        result := ComCall(9, this, "uint", dwLink, "int", fErrorMessage, "int", fReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-cancellink
     */
    CancelLink(dwLink) {
        result := ComCall(10, this, "uint", dwLink, "HRESULT")
        return result
    }
}
