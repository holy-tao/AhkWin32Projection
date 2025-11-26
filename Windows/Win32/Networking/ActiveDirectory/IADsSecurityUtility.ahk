#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsSecurityUtility interface is used to get, set, or retrieve the security descriptor on a file, fileshare, or registry key.
 * @remarks
 * 
 * To read the system access-control list (SACL) of a file or directory, the <b>SE_SECURITY_NAME</b> privilege must be enabled for the calling process. For more information about retrieving the SACL for an object, see <a href="https://docs.microsoft.com/windows/desktop/AD/retrieving-an-objectampaposs-sacl">Retrieving an Object's SACL</a>.
 * 
 * For more information and a code example that shows how to use the <b>IADsSecurityUtility</b> interface to add an ACE to a file, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/example-code-for-adding-an-ace-to-a-file">Example Code for Adding an ACE to a File</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadssecurityutility
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsSecurityUtility extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsSecurityUtility
     * @type {Guid}
     */
    static IID => Guid("{a63251b2-5f21-474b-ab52-4a8efad10895}")

    /**
     * The class identifier for ADsSecurityUtility
     * @type {Guid}
     */
    static CLSID => Guid("{f270c64a-ffb8-4ae4-85fe-3a75e5347966}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecurityDescriptor", "SetSecurityDescriptor", "ConvertSecurityDescriptor", "get_SecurityMask", "put_SecurityMask"]

    /**
     * @type {Integer} 
     */
    SecurityMask {
        get => this.get_SecurityMask()
        set => this.put_SecurityMask(value)
    }

    /**
     * Retrieves a security descriptor for the specified file, fileshare, or registry key.
     * @param {VARIANT} varPath A <b>VARIANT</b> string that contains the path of the object to retrieve the security descriptor for.
     * @param {Integer} lPathFormat Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_pathtype_enum">ADS_PATHTYPE_ENUM</a> values which specifies the format of the <i>varPath</i> parameter.
     * @param {Integer} lFormat Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_sd_format_enum">ADS_SD_FORMAT_ENUM</a> values which specifies the format of the security descriptor returned in the <i>pVariant</i> parameter. The following list identifies the possible values for this parameter and the format that is supplied in the <i>pVariant</i> parameter.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the returned security descriptor. The format of the retrieved security descriptor is specified by the <i>lFormat</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadssecurityutility-getsecuritydescriptor
     */
    GetSecurityDescriptor(varPath, lPathFormat, lFormat) {
        pVariant := VARIANT()
        result := ComCall(7, this, "ptr", varPath, "int", lPathFormat, "int", lFormat, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * Sets the security descriptor for the specified file, file share, or registry key.
     * @param {VARIANT} varPath A <b>VARIANT</b> string that contains the path of the object to set the security descriptor for. Possible values are listed in the following list.
     * @param {Integer} lPathFormat Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_pathtype_enum">ADS_PATHTYPE_ENUM</a> values which specifies the format of the <i>varPath</i> parameter.
     * @param {VARIANT} varData A <b>VARIANT</b> that contains the new security descriptor. The format of the security descriptor is specified by the <i>lDataFormat</i> parameter.
     * @param {Integer} lDataFormat Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_sd_format_enum">ADS_SD_FORMAT_ENUM</a> values which specifies the format of the security descriptor contained in the <i>VarData</i> parameter. The following list identifies the possible values for this parameter and the format of the <i>VarData</i> parameter.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a COM or Win32 error code otherwise. Possible error codes are listed in the following list.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadssecurityutility-setsecuritydescriptor
     */
    SetSecurityDescriptor(varPath, lPathFormat, varData, lDataFormat) {
        result := ComCall(8, this, "ptr", varPath, "int", lPathFormat, "ptr", varData, "int", lDataFormat, "HRESULT")
        return result
    }

    /**
     * Converts a security descriptor from one format to another.
     * @param {VARIANT} varSD A <b>VARIANT</b> that contains the security descriptor to convert. The format of this <b>VARIANT</b> is defined  by the <i>lDataFormat</i> parameter.
     * @param {Integer} lDataFormat Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_sd_format_enum">ADS_SD_FORMAT_ENUM</a> values which specifies the format of the security descriptor in the <i>varSD</i> parameter. The following list identifies the possible values for this parameter and the format of the <i>varSD</i> parameter.
     * @param {Integer} lOutFormat Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_sd_format_enum">ADS_SD_FORMAT_ENUM</a> values which specifies the format that the security descriptor should be converted to. The following list identifies the possible values for this parameter and the format of the <i>pvResult</i> parameter.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the converted security descriptor. The format of the retrieved security descriptor is specified by the <i>lOutFormat</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadssecurityutility-convertsecuritydescriptor
     */
    ConvertSecurityDescriptor(varSD, lDataFormat, lOutFormat) {
        pResult := VARIANT()
        result := ComCall(9, this, "ptr", varSD, "int", lDataFormat, "int", lOutFormat, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * Determines which elements of the security descriptor to retrieve or set.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadssecurityutility-get_securitymask
     */
    get_SecurityMask() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Determines which elements of the security descriptor to retrieve or set.
     * @param {Integer} lnSecurityMask 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadssecurityutility-put_securitymask
     */
    put_SecurityMask(lnSecurityMask) {
        result := ComCall(11, this, "int", lnSecurityMask, "HRESULT")
        return result
    }
}
