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
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/nn-oledlg-ioleuilinkcontainera
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset ANSI
 */
class IOleUILinkContainerA extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwLink 
     * @returns {Integer} 
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
     */
    SetLinkUpdateOptions(dwLink, dwUpdateOpt) {
        result := ComCall(4, this, "uint", dwLink, "uint", dwUpdateOpt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @param {Pointer<UInt32>} lpdwUpdateOpt 
     * @returns {HRESULT} 
     */
    GetLinkUpdateOptions(dwLink, lpdwUpdateOpt) {
        result := ComCall(5, this, "uint", dwLink, "uint*", lpdwUpdateOpt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @param {PSTR} lpszDisplayName 
     * @param {Integer} lenFileName 
     * @param {Pointer<UInt32>} pchEaten 
     * @param {BOOL} fValidateSource 
     * @returns {HRESULT} 
     */
    SetLinkSource(dwLink, lpszDisplayName, lenFileName, pchEaten, fValidateSource) {
        result := ComCall(6, this, "uint", dwLink, "ptr", lpszDisplayName, "uint", lenFileName, "uint*", pchEaten, "int", fValidateSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @param {Pointer<PSTR>} lplpszDisplayName 
     * @param {Pointer<UInt32>} lplenFileName 
     * @param {Pointer<PSTR>} lplpszFullLinkType 
     * @param {Pointer<PSTR>} lplpszShortLinkType 
     * @param {Pointer<BOOL>} lpfSourceAvailable 
     * @param {Pointer<BOOL>} lpfIsSelected 
     * @returns {HRESULT} 
     */
    GetLinkSource(dwLink, lplpszDisplayName, lplenFileName, lplpszFullLinkType, lplpszShortLinkType, lpfSourceAvailable, lpfIsSelected) {
        result := ComCall(7, this, "uint", dwLink, "ptr", lplpszDisplayName, "uint*", lplenFileName, "ptr", lplpszFullLinkType, "ptr", lplpszShortLinkType, "ptr", lpfSourceAvailable, "ptr", lpfIsSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @returns {HRESULT} 
     */
    OpenLinkSource(dwLink) {
        result := ComCall(8, this, "uint", dwLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @param {BOOL} fErrorMessage 
     * @param {BOOL} fReserved 
     * @returns {HRESULT} 
     */
    UpdateLink(dwLink, fErrorMessage, fReserved) {
        result := ComCall(9, this, "uint", dwLink, "int", fErrorMessage, "int", fReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLink 
     * @returns {HRESULT} 
     */
    CancelLink(dwLink) {
        result := ComCall(10, this, "uint", dwLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
