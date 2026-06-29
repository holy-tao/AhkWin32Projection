#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsNameTranslateinterface translates distinguished names (DNs) among various formats as defined in the ADS_NAME_TYPE_ENUM enumeration. The feature is available to objects in Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsnametranslate
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsNameTranslate extends IDispatch {
    /**
     * The interface identifier for IADsNameTranslate
     * @type {Guid}
     */
    static IID := Guid("{b1b272a3-3625-11d1-a3a4-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsNameTranslate interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_ChaseReferral : IntPtr
        Init              : IntPtr
        InitEx            : IntPtr
        Set               : IntPtr
        Get               : IntPtr
        SetEx             : IntPtr
        GetEx             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsNameTranslate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
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
        result := ComCall(7, this, "int", lnChaseReferral, "HRESULT")
        return result
    }

    /**
     * Initializes a name translate object by binding to a specified directory server, domain, or global catalog, using the credentials of the current user.
     * @remarks
     * After the successful initialization, you can proceed to use the name translate object to submit requests of name translations of objects in the directory. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-set">IADsNameTranslate::Set</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-get">IADsNameTranslate::Get</a>.
     * @param {Integer} lnSetType A type of initialization to be performed. Possible values are defined in  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_inittype_enum">ADS_NAME_INITTYPE_ENUM</a>.
     * @param {BSTR} bstrADsPath The name of the server or domain, depending on the value of <i>lnInitType</i>. When <b>ADS_NAME_INITTYPE_GC</b> is issued, this parameter is ignored. The global catalog server of the domain of the current computer will  perform the name translate operations. This method will fail if the computer is not part of a domain as no global catalog will be found in this scenario. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_inittype_enum">ADS_NAME_INITTYPE_ENUM</a>.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> or RPC error code, including:
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsnametranslate-init
     */
    Init(lnSetType, bstrADsPath) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(8, this, "int", lnSetType, BSTR, bstrADsPath, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsnametranslate-initex
     */
    InitEx(lnSetType, bstrADsPath, bstrUserID, bstrDomain, bstrPassword) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath
        bstrUserID := bstrUserID is String ? BSTR.Alloc(bstrUserID).Value : bstrUserID
        bstrDomain := bstrDomain is String ? BSTR.Alloc(bstrDomain).Value : bstrDomain
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(9, this, "int", lnSetType, BSTR, bstrADsPath, BSTR, bstrUserID, BSTR, bstrDomain, BSTR, bstrPassword, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsnametranslate-set
     */
    Set(lnSetType, bstrADsPath) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(10, this, "int", lnSetType, BSTR, bstrADsPath, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsnametranslate-get
     */
    Get(lnFormatType) {
        pbstrADsPath := BSTR.Owned()
        result := ComCall(11, this, "int", lnFormatType, BSTR.Ptr, pbstrADsPath, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsnametranslate-setex
     */
    SetEx(lnFormatType, pvar) {
        result := ComCall(12, this, "int", lnFormatType, VARIANT, pvar, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsnametranslate-getex
     */
    GetEx(lnFormatType) {
        pvar := VARIANT()
        result := ComCall(13, this, "int", lnFormatType, VARIANT.Ptr, pvar, "HRESULT")
        return pvar
    }

    Query(iid) {
        if (IADsNameTranslate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_ChaseReferral := CallbackCreate(GetMethod(implObj, "put_ChaseReferral"), flags, 2)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 3)
        this.vtbl.InitEx := CallbackCreate(GetMethod(implObj, "InitEx"), flags, 6)
        this.vtbl.Set := CallbackCreate(GetMethod(implObj, "Set"), flags, 3)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 3)
        this.vtbl.SetEx := CallbackCreate(GetMethod(implObj, "SetEx"), flags, 3)
        this.vtbl.GetEx := CallbackCreate(GetMethod(implObj, "GetEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_ChaseReferral)
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.InitEx)
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.SetEx)
        CallbackFree(this.vtbl.GetEx)
    }
}
