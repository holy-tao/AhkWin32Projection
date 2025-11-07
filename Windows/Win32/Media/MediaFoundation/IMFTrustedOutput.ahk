#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFOutputTrustAuthority.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by components that provide output trust authorities (OTAs).
 * @remarks
 * 
 * If an MFT supports <b>IMFTrustedOutput</b>, it must expose the interface through <b>QueryInterface</b>. The interface applies to all of the input streams on the MFT. (There is no mechanism to return a separate <b>IMFTrustedOutput</b> pointer for each stream.) The MFT must apply the  output policies to all of its input streams. If the MFT sends different streams to separate connectors, it must report all of the connector attributes.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftrustedoutput
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTrustedOutput extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTrustedOutput
     * @type {Guid}
     */
    static IID => Guid("{d19f8e95-b126-4446-890c-5dcb7ad71453}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutputTrustAuthorityCount", "GetOutputTrustAuthorityByIndex", "IsFinal"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftrustedoutput-getoutputtrustauthoritycount
     */
    GetOutputTrustAuthorityCount() {
        result := ComCall(3, this, "uint*", &pcOutputTrustAuthorities := 0, "HRESULT")
        return pcOutputTrustAuthorities
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IMFOutputTrustAuthority} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftrustedoutput-getoutputtrustauthoritybyindex
     */
    GetOutputTrustAuthorityByIndex(dwIndex) {
        result := ComCall(4, this, "uint", dwIndex, "ptr*", &ppauthority := 0, "HRESULT")
        return IMFOutputTrustAuthority(ppauthority)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftrustedoutput-isfinal
     */
    IsFinal() {
        result := ComCall(5, this, "int*", &pfIsFinal := 0, "HRESULT")
        return pfIsFinal
    }
}
