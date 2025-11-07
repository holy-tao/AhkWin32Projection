#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface with IDiscFormat2Data or IDiscFormat2TrackAtOnce to get or set the Burn Verification Level property which dictates how burned media is verified for integrity after the write operation.
 * @remarks
 * 
  * The following example function demonstrates how the burn verification level defined by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_burn_verification_level">IMAPI_BURN_VERIFICATION_LEVEL</a>, can be implemented. Burn verification level should be set prior to a burn operation.
  * 
  * 
  * ```cpp
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-iburnverification
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IBurnVerification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBurnVerification
     * @type {Guid}
     */
    static IID => Guid("{d2ffd834-958b-426d-8470-2a13879c6a91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_BurnVerificationLevel", "get_BurnVerificationLevel"]

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iburnverification-put_burnverificationlevel
     */
    put_BurnVerificationLevel(value) {
        result := ComCall(3, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iburnverification-get_burnverificationlevel
     */
    get_BurnVerificationLevel() {
        result := ComCall(4, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
