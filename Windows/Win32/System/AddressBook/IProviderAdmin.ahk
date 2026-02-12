#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPITable.ahk
#Include .\MAPIUID.ahk
#Include .\IProfSect.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Describes the properties and vtable order of members for IProviderAdmin IUnknown, which works with service providers in a message service.
 * @remarks
 * Clients can get a pointer to an **IProviderAdmin** interface by calling the [IMsgServiceAdmin::AdminProviders](imsgserviceadmin-adminproviders.md) method; service providers are passed an **IProviderAdmin** pointer when their message service's entry point function is called.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iprovideradminiunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IProviderAdmin extends IUnknown{

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
    static VTableNames => ["GetLastError", "GetProviderTable", "CreateProvider", "DeleteProvider", "OpenProfileSection"]

    /**
     * 
     * @remarks
     * The **IProviderAdmin::GetLastError** method supplies information about a prior method call that failed. Callers can provide their users with detailed information about the error by including the data from the **MAPIERROR** structure in a dialog box.
     * @param {HRESULT} hResult_ > [in] An HRESULT data type that contains the error value generated in the previous method call.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of strings returned. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The strings in the **MAPIERROR** returned in the _lppMAPIError_ parameter are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @returns {Pointer<MAPIERROR>} > [out] A pointer to a pointer to the returned **MAPIERROR** structure that contains version, component, and context information for the error. The  _lppMAPIError_ parameter can be set to NULL if there is no **MAPIERROR** to return.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iprovideradmin-getlasterror
     */
    GetLastError(hResult_, ulFlags) {
        result := ComCall(3, this, "int", hResult_, "uint", ulFlags, "ptr*", &lppMAPIError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lppMAPIError
    }

    /**
     * IProviderAdmin GetProviderTable provides access to the message service's provider table, a list of the service providers in the message service.
     * @remarks
     * The **IProviderAdmin::GetProviderTable** method retrieves a pointer to the message service's provider table, a table that MAPI maintains that contains information about each service provider in the message service. 
     *   
     * Unlike the provider table returned by the [IMsgServiceAdmin::GetProviderTable](imsgserviceadmin-getprovidertable.md) method, the provider table returned by **IProviderAdmin::GetProviderTable** may include additional rows that represent information associated with one or more of the service providers in the message service. This extra information is added to the profile with the "Sections" keyword of the Mapisvc.inf file. When a provider has extra profile sections, it stores the **MAPIUID** structures for these sections in the **PR_SERVICE_EXTRA_UIDS** ([PidTagServiceExtraUids](pidtagserviceextrauids-canonical-property.md)) property. **PR_SERVICE_EXTRA_UIDS** is saved in the message service profile section. 
     *   
     * Providers that have been deleted, or are in use but have been marked for deletion, are not included in the provider table. Provider tables are static, meaning that subsequent additions to or deletions from the message service are not reflected in the table. 
     *   
     * If the message service has no providers, **IProviderAdmin::GetProviderTable** returns a table with zero rows and the S_OK return value. 
     *   
     * Setting the MAPI_UNICODE flag in the _ulFlags_ parameter affects the format of the columns returned from the [IMAPITable::QueryColumns](imapitable-querycolumns.md) and [IMAPITable::QueryRows](imapitable-queryrows.md) methods. 
     *   
     * This flag also controls the property types in the sort order returned by the [IMAPITable::QuerySortOrder](imapitable-querysortorder.md) method. 
     *   
     * For a complete list of the columns in the provider table, see [Provider Table](provider-tables.md).
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the strings returned in the provider table's columns. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The string columns are in Unicode format. If the MAPI_UNICODE flag is not set, the columns are in ANSI format.
     * @returns {IMAPITable} > [out] A pointer to a pointer to the provider table.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iprovideradmin-getprovidertable
     */
    GetProviderTable(ulFlags) {
        result := ComCall(4, this, "uint", ulFlags, "ptr*", &lppTable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMAPITable(lppTable)
    }

    /**
     * 
     * @remarks
     * The **IProviderAdmin::CreateProvider** method adds a service provider to the message service. The  _lpszProvider_ parameter must point to the name of a provider that belongs to the message service. **CreateProvider** does not verify whether the name matches the name of a provider in the service; if the passed name does not match a service name, the call succeeds, but the results are unpredictable. Most message services do not allow providers to be added or deleted while the profile is in use. 
     *   
     * After all of the available information about the service provider has been added to the profile from the Mapisvc.inf file, **CreateProvider** calls the message service's entry point function with the  _ulContext_ parameter set to MSG_SERVICE_PROVIDER_CREATE. If MAPI_DIALOG is set in the **CreateProvider** method's  _ulFlags_ parameter, the values in the _ulUIParam_ and  _ulFlags_ parameters are also passed to the entry point function. These additional parameters enable the service provider to display its property sheet so the user can enter configuration settings.
     * @param {Pointer<Integer>} lpszProvider > [in] A pointer to the name of the provider to add.
     * @param {Integer} cValues > [in] The count of property values pointed to by the  _lpProps_ parameter.
     * @param {Pointer<SPropValue>} lpProps > [in] A pointer to a property value array that describes the properties of the provider to add.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of any dialog boxes or windows this method displays. The  _ulUIParam_ parameter is used if the MAPI_DIALOG flag is set in the _ulFlags_ parameter.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the provider addition. The following flags can be set:
     *     
     *   - MAPI_DIALOG: Displays a dialog box to prompt for configuration information.
     *       
     *   - MAPI_UNICODE: The provider name and string properties are in Unicode format. If the MAPI_UNICODE flag is not set, these strings are in ANSI format.
     * @returns {MAPIUID} > [out] A pointer to the [MAPIUID](mapiuid.md) structure that contains the unique identifier that represents the provider to add.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iprovideradmin-createprovider
     */
    CreateProvider(lpszProvider, cValues, lpProps, ulUIParam, ulFlags) {
        lpszProviderMarshal := lpszProvider is VarRef ? "char*" : "ptr"

        lpUID := MAPIUID()
        result := ComCall(5, this, lpszProviderMarshal, lpszProvider, "uint", cValues, "ptr", lpProps, "ptr", ulUIParam, "uint", ulFlags, "ptr", lpUID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpUID
    }

    /**
     * 
     * @remarks
     * The **IProviderAdmin::DeleteProvider** method deletes a service provider from the message service. **DeleteProvider** determines the service provider to delete by matching the **MAPIUID** structure pointed to by  _lpUID_ with the set of identifiers registered by the active service providers. 
     *   
     * Most message services do not allow providers to be deleted while the profile is in use. If the provider to delete is in use, **DeleteProvider** marks it for deletion instead of removing it immediately and returns S_OK. When the provider is no longer being used, it is deleted. 
     *   
     *  **DeleteProvider** calls the message service's entry point function before the provider is removed from the service. The  _ulContext_ parameter is set to MSG_SERVICE_PROVIDER_DELETE. The message service entry point function performs the following tasks: 
     *   
     * - Deletes the service provider.
     *     
     * - Deletes the service provider's profile section.
     *     
     * The message service entry point function is not called again after the provider has been deleted.
     * @param {Pointer<MAPIUID>} lpUID > [in, out] A pointer to the [MAPIUID](mapiuid.md) structure that contains the unique identifier that represents the provider to delete.
     * @returns {HRESULT} S_OK 
     *   
     * > The provider was successfully deleted from the message service.
     *     
     * MAPI_E_NOT_FOUND 
     *   
     * > The **MAPIUID** pointed to by the  _lpUID_ parameter was not recognized.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iprovideradmin-deleteprovider
     */
    DeleteProvider(lpUID) {
        result := ComCall(6, this, "ptr", lpUID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * IProviderAdmin OpenProfileSection opens a profile section from the current profile and returns an IProfSect pointer for further access.
     * @remarks
     * The **IProviderAdmin::OpenProfileSection** method opens a profile section, enabling the caller to read information from and possibly write information to the active profile. 
     *   
     * Clients cannot open profile sections that belong to providers by using the **OpenProfileSection** method. 
     *   
     * Multiple clients or service providers can simultaneously open a profile section with read-only permission. However, when a profile section is open with read/write permission, no other calls can be made to open the section, regardless of the type of access. If a profile section is open with read-only permission, a subsequent call to request read/write permission will fail with MAPI_E_NO_ACCESS. Likewise, if a section is open with read/write permission, a subsequent call to request read-only permission will also fail.
     * @param {Pointer<MAPIUID>} lpUID > [in] A pointer to the [MAPIUID](mapiuid.md) structure that contains the unique identifier for the profile section to be opened. Clients must not pass NULL for the  _lpUID_ parameter. Service providers can pass NULL to retrieve the **MAPIUID** when they call from their message service entry point functions.
     * @param {Pointer<Guid>} lpInterface > [in] A pointer to the interface identifier (IID) that represents the interface to be used to access the profile section. Passing NULL results in the profile section's standard interface (**IProfSect**) being returned.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the profile section is opened. The following flags can be set:
     *     
     * MAPI_DEFERRED_ERRORS 
     *   
     * > Enables **OpenProfileSection** to return successfully, possibly before the profile section is fully available to the caller. If the profile section is not available, making a subsequent call to it can raise an error. 
     *     
     * MAPI_MODIFY 
     *   
     * > Requests read/write permission. By default, objects are opened with read-only permission, and callers should not work on the assumption that read/write permission has been granted. Clients are not allowed read/write permission to provider sections of the profile.
     *     
     * MAPI_FORCE_ACCESS
     *   
     * > Allows access to all profile sections, even those owned by individual service providers.
     * @returns {IProfSect} > [out] A pointer to a pointer to the profile section.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/iprovideradmin-openprofilesection
     */
    OpenProfileSection(lpUID, lpInterface, ulFlags) {
        result := ComCall(7, this, "ptr", lpUID, "ptr", lpInterface, "uint", ulFlags, "ptr*", &lppProfSect := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IProfSect(lppProfSect)
    }
}
