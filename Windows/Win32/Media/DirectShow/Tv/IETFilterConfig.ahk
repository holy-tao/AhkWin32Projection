#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IETFilterConfig interface configures the Encrypter/Tagger filter. Most applications will not have to use this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IETFilterConfig)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-ietfilterconfig
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IETFilterConfig extends IUnknown{
    /**
     * The interface identifier for IETFilterConfig
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4d1-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} LicenseId 
     * @returns {HRESULT} 
     */
    InitLicense(LicenseId) {
        result := ComCall(3, this, "int", LicenseId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnkDRMSecureChannel 
     * @returns {HRESULT} 
     */
    GetSecureChannelObject(ppUnkDRMSecureChannel) {
        result := ComCall(4, this, "ptr", ppUnkDRMSecureChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
