#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsNameTranslateinterface translates distinguished names (DNs) among various formats as defined in the ADS_NAME_TYPE_ENUM enumeration. The feature is available to objects in Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadsnametranslate
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsNameTranslate extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsNameTranslate
     * @type {Guid}
     */
    static IID => Guid("{b1b272a3-3625-11d1-a3a4-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ChaseReferral", "Init", "InitEx", "Set", "Get", "SetEx", "GetEx"]

    /**
     * @type {HRESULT} 
     */
    ChaseReferral {
        set => this.put_ChaseReferral(value)
    }

    /**
     * 
     * @param {Integer} lnChaseReferral 
     * @returns {HRESULT} 
     */
    put_ChaseReferral(lnChaseReferral) {
        result := ComCall(7, this, "int", lnChaseReferral, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a name translate object by binding to a specified directory server, domain, or global catalog, using the credentials of the current user.
     * @remarks
     * After the successful initialization, you can proceed to use the name translate object to submit requests of name translations of objects in the directory. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-set">IADsNameTranslate::Set</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-get">IADsNameTranslate::Get</a>.
     * @param {Integer} lnSetType A type of initialization to be performed. Possible values are defined in  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_inittype_enum">ADS_NAME_INITTYPE_ENUM</a>.
     * @param {BSTR} bstrADsPath The name of the server or domain, depending on the value of <i>lnInitType</i>. When <b>ADS_NAME_INITTYPE_GC</b> is issued, this parameter is ignored. The global catalog server of the domain of the current computer will  perform the name translate operations. This method will fail if the computer is not part of a domain as no global catalog will be found in this scenario. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_inittype_enum">ADS_NAME_INITTYPE_ENUM</a>.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> or RPC error code, including:
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iadsnametranslate-init
     */
    Init(lnSetType, bstrADsPath) {
        if(bstrADsPath is String) {
            pin := BSTR.Alloc(bstrADsPath)
            bstrADsPath := pin.Value
        }

        result := ComCall(8, this, "int", lnSetType, "ptr", bstrADsPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a name translate object by binding to a specified directory server, domain, or global catalog, using the specified user credential.
     * @remarks
     * After the successful initialization, use the name translate object to submit requests of name translations of directory objects. For more information see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-set">IADsNameTranslate::Set</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-get">IADsNameTranslate::Get</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-setex">IADsNameTranslate::SetEx</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-getex">IADsNameTranslate::GetEx</a>.
     * @param {Integer} lnSetType A type of initialization to be performed. Possible values are defined in  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_inittype_enum">ADS_NAME_INITTYPE_ENUM</a>.
     * @param {BSTR} bstrADsPath The name of the server or domain, depending on the value of <i>lnInitType</i>. When <b>ADS_NAME_INITTYPE_GC</b> is issued, this parameter is ignored. The global catalog server of the domain of the current machine will be used to carry out the name translate operations. This method will fail if the computer is not part of a domain, as no global catalog will be found in this scenario. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_inittype_enum">ADS_NAME_INITTYPE_ENUM</a>.
     * @param {BSTR} bstrUserID User name.
     * @param {BSTR} bstrDomain User domain name.
     * @param {BSTR} bstrPassword User password.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> or RPC error code, including:
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iadsnametranslate-initex
     */
    InitEx(lnSetType, bstrADsPath, bstrUserID, bstrDomain, bstrPassword) {
        if(bstrADsPath is String) {
            pin := BSTR.Alloc(bstrADsPath)
            bstrADsPath := pin.Value
        }
        if(bstrUserID is String) {
            pin := BSTR.Alloc(bstrUserID)
            bstrUserID := pin.Value
        }
        if(bstrDomain is String) {
            pin := BSTR.Alloc(bstrDomain)
            bstrDomain := pin.Value
        }
        if(bstrPassword is String) {
            pin := BSTR.Alloc(bstrPassword)
            bstrPassword := pin.Value
        }

        result := ComCall(9, this, "int", lnSetType, "ptr", bstrADsPath, "ptr", bstrUserID, "ptr", bstrDomain, "ptr", bstrPassword, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Directs the directory service to set up a specified object for name translation.
     * @remarks
     * Before calling this method to set the object name, you should have established a connection to the directory service using either  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-init">IADsNameTranslate::Init</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-initex">IADsNameTranslate::InitEx</a>.
     * 
     * You can use the <b>IADsNameTranslate::Set</b> method to set name translation for objects residing on the directory server. When the referral chasing is on, this method will also set any object found on other servers. For more information about referral chasing, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/iadsnametranslate-property-methods">IADsNameTranslate Property Methods</a>.
     * @param {Integer} lnSetType The format of the name of a directory object. For more information, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_type_enum">ADS_NAME_TYPE_ENUM</a>.
     * @param {BSTR} bstrADsPath The object name, for example, "CN=Administrator, CN=users, DC=Fabrikam, DC=com".
     * @returns {HRESULT} This method supports the standard <b>HRESULT</b> return values, including:
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iadsnametranslate-set
     */
    Set(lnSetType, bstrADsPath) {
        if(bstrADsPath is String) {
            pin := BSTR.Alloc(bstrADsPath)
            bstrADsPath := pin.Value
        }

        result := ComCall(10, this, "int", lnSetType, "ptr", bstrADsPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the name of a directory object in the specified format.
     * @remarks
     * This method lets you retrieve the name of a single directory object. To retrieve names of multiple objects use  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-getex">IADsNameTranslate::GetEx</a>.
     * 
     * When referral chasing is on, this method will attempt to chase and resolve the path of a specified object that is not residing on the connected server.
     * @param {Integer} lnFormatType The format type of the output name. For more information, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_type_enum">ADS_NAME_TYPE_ENUM</a>. This method does not support the <b>ADS_NAME_TYPE_SID_OR_SID_HISTORY_NAME</b> element in <b>ADS_NAME_TYPE_ENUM</b>.
     * @returns {BSTR} The name of the returned object.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iadsnametranslate-get
     */
    Get(lnFormatType) {
        pbstrADsPath := BSTR()
        result := ComCall(11, this, "int", lnFormatType, "ptr", pbstrADsPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrADsPath
    }

    /**
     * Establishes an array of objects for name translation.
     * @remarks
     * You cannot use the <b>IADsNameTranslate::SetEx</b> method to set name translation for objects residing on other servers, even when the referral chasing option is enabled. For more information about referral chasing, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/iadsnametranslate-property-methods">IADsNameTranslate Property Methods</a>.
     * 
     * You can use <b>IADsNameTranslate::SetEx</b> to set names for multiple objects. All the names, however, must be of the same format.
     * @param {Integer} lnFormatType The format type of the input names. For more information, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_type_enum">ADS_NAME_TYPE_ENUM</a>.
     * @param {VARIANT} pvar A variant array of strings that hold object names.
     * @returns {HRESULT} This method supports the standard <b>HRESULT</b> return values, including:
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iadsnametranslate-setex
     */
    SetEx(lnFormatType, pvar) {
        result := ComCall(12, this, "int", lnFormatType, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the object names in the specified format.
     * @remarks
     * This method gets the names of multiple objects. However, all of the  names returned use a single format.
     * 
     * When referral chasing is on, this method will not attempt to chase and resolve the path of a specified object not residing on the connected server.
     * @param {Integer} lnFormatType The format type used for  the output names. For more information about the various types of formats you can use, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_type_enum">ADS_NAME_TYPE_ENUM</a>. This method does not support the ADS_NAME_TYPE_SID_OR_SID_HISTORY_NAME element in <b>ADS_NAME_TYPE_ENUM</b>.
     * @returns {VARIANT} A variant array of strings that hold names of the objects returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nf-iads-iadsnametranslate-getex
     */
    GetEx(lnFormatType) {
        pvar := VARIANT()
        result := ComCall(13, this, "int", lnFormatType, "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvar
    }
}
