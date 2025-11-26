#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides a direct mechanism to specify and obtain provider-specific options for manipulating an ADSI object.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsobjectoptions
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsObjectOptions extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsObjectOptions
     * @type {Guid}
     */
    static IID => Guid("{46f14fda-232b-11d1-a808-00c04fd8d5a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOption", "SetOption"]

    /**
     * Gets a provider-specific option for a directory object.
     * @param {Integer} lnOption Indicates the provider-specific option to get. This parameter can be any value in the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_option_enum">ADS_OPTION_ENUM</a> enumeration.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> variable that receives the current value for the option specified in the <i>lnOption</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsobjectoptions-getoption
     */
    GetOption(lnOption) {
        pvValue := VARIANT()
        result := ComCall(7, this, "int", lnOption, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Sets a provider-specific option for manipulating a directory object.
     * @param {Integer} lnOption Indicates the provider-specific option to set. This parameter can be any value in the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_option_enum">ADS_OPTION_ENUM</a> enumeration except <b>ADS_OPTION_SERVERNAME</b> or <b>ADS_OPTION_MUTUAL_AUTH_STATUS</b>.
     * @param {VARIANT} vValue Specifies the value to set for the option specified in the <i>lnOption</i> parameter.
     * @returns {HRESULT} The method supports the standard return values, including <b>S_OK</b> for a successful operation and <b>E_ADS_BAD_PARAMETER</b> when the user has supplied an invalid <i>pValue</i> parameter. For more information, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsobjectoptions-setoption
     */
    SetOption(lnOption, vValue) {
        result := ComCall(8, this, "int", lnOption, "ptr", vValue, "HRESULT")
        return result
    }
}
