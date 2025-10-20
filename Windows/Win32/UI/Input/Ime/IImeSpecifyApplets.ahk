#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IImeSpecifyApplets interface specifies methods called from the IImePad interface object to emulate the IImePadApplet interface.
 * @see https://docs.microsoft.com/windows/win32/api//imepad/nn-imepad-iimespecifyapplets
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IImeSpecifyApplets extends IUnknown{
    /**
     * The interface identifier for IImeSpecifyApplets
     * @type {Guid}
     */
    static IID => Guid("{5d8e643c-c3a9-11d1-afef-00805f0c8b6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} refiid 
     * @param {Pointer<APPLETIDLIST>} lpIIDList 
     * @returns {HRESULT} 
     */
    GetAppletIIDList(refiid, lpIIDList) {
        result := ComCall(3, this, "ptr", refiid, "ptr", lpIIDList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
