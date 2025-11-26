#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMsmStrings.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmError interface retrieves details about a single merge error.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmerror
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmError extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMsmError
     * @type {Guid}
     */
    static IID => Guid("{0adda828-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Path", "get_Language", "get_DatabaseTable", "get_DatabaseKeys", "get_ModuleTable", "get_ModuleKeys"]

    /**
     */
    Type {
        get => this.get_Type()
    }

    /**
     */
    Path {
        get => this.get_Path()
    }

    /**
     */
    Language {
        get => this.get_Language()
    }

    /**
     */
    DatabaseTable {
        get => this.get_DatabaseTable()
    }

    /**
     * @type {IMsmStrings} 
     */
    DatabaseKeys {
        get => this.get_DatabaseKeys()
    }

    /**
     */
    ModuleTable {
        get => this.get_ModuleTable()
    }

    /**
     * @type {IMsmStrings} 
     */
    ModuleKeys {
        get => this.get_ModuleKeys()
    }

    /**
     * The get_Type method retrieves the Type property of the Error object. This method returns a msmErrorType value indicating the type of error represented by this object.
     * @param {Pointer<Integer>} ErrorType A pointer to a location in memory that receives the type of error.
     * 					
     * 
     * <table>
     * <tr>
     * <th>msmErrorType</th>
     * <th>Value</th>
     * <th><b>Description</b></th>
     * </tr>
     * <tr>
     * <td>msmErrorLanguageUnsupported</td>
     * <td>1</td>
     * <td>A request was made to open a module with a language not supported by the module. No more general language is supported by the module. Adds msmErrorLanguageUnsupported to the 
     * <b>Type</b> property and the requested language to the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-language">Language Property (Error Object)</a>. All <b>Error</b> object properties are empty. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mergemod/nf-mergemod-imsmmerge-openmodule">OpenModule</a> function returns ERROR_INSTALL_LANGUAGE_UNSUPPORTED (as HRESULT).</td>
     * </tr>
     * <tr>
     * <td>msmErrorLanguageFailed</td>
     * <td>2</td>
     * <td>A request was made to open a module with a supported language but the module has an invalid language transform. Adds msmErrorLanguageFailed to the Type property and the applied transform's language to the 
     * <b>Language</b> Property of the <b>Error</b> object. This may not be the requested language if a more general language was used. All other properties of the <b>Error</b> object are empty. The 
     * <b>OpenModule</b> function returns ERROR_INSTALL_LANGUAGE_UNSUPPORTED (as HRESULT).</td>
     * </tr>
     * <tr>
     * <td>msmErrorExclusion</td>
     * <td>3</td>
     * <td>The module cannot be merged because it excludes, or is excluded by, another module in the database. Adds msmErrorExclusion to the 
     * <b>Type</b> property of the <b>Error</b> object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-modulekeys">ModuleKeys property</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-databasekeys">DatabaseKeys property</a> contains the primary keys of the excluded module's row in the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/moduleexclusion-table">ModuleExclusion table</a>. If an existing module excludes the module being merged, the excluded module's ModuleSignature information is added to ModuleKeys. If the module being merged excludes an existing module, DatabaseKeys contains the excluded module's ModuleSignature information. All other properties are empty (or -1).</td>
     * </tr>
     * <tr>
     * <td>msmErrorTableMerge</td>
     * <td>4</td>
     * <td>Merge conflict during merge. The value of the 
     * <b>Type</b> property is set to msmErrorTableMerge. The 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-databasetable">DatabaseTable property</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-databasekeys">DatabaseKeys property</a> contain the table name and primary keys of the conflicting row in the database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-moduletable">ModuleTable property</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-modulekeys">ModuleKeys property</a> contain the table name and primary keys of the conflicting row in the module. The ModuleTable and ModuleKeys entries may be null if the row does not exist in the database. For example, if the conflict is in a generated FeatureComponents table entry. When merging a 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/configurable-merge-modules">configurable merge module</a>, configuration may cause these properties to refer to rows that do not exist in the module.</td>
     * </tr>
     * <tr>
     * <td>msmErrorResequenceMerge</td>
     * <td>5</td>
     * <td>There was a problem resequencing a sequence table to contain the necessary merged actions. The 
     * <b>Type</b> property is set to msmErrorResequenceMerge. The DatabaseTable and DatabaseKeys properties contain the sequence table name and primary keys (action name) of the conflicting row. The ModuleTable and ModuleKeys properties contain the sequence table name and primary key (action name) of the conflicting row. When merging a configurable merge module, configuration may cause these properties to refer to rows that do not exist in the module.</td>
     * </tr>
     * <tr>
     * <td>msmErrorFileCreate</td>
     * <td>6</td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td>msmErrorDirCreate</td>
     * <td>7</td>
     * <td>There was a problem creating a directory to extract a file to disk. The 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-path">Path</a> property contains the directory that could not be created. All other properties are empty or -1. </td>
     * </tr>
     * <tr>
     * <td>msmErrorFeatureRequired</td>
     * <td>8</td>
     * <td>A feature name is required to complete the merge, but no feature name was provided. The 
     * <b>Type</b> property is set to msmErrorFeatureRequired. The DatabaseTable and DatabaseKeys contain the table name and primary keys of the conflicting row. The ModuleTable and ModuleKeys properties contain the table name and primary keys of the row cannot be merged. When merging a configurable merge module, configuration may cause these properties to refer to rows that do not exist in the module. If the failure is in a generated 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/featurecomponents-table">FeatureComponents table</a>, the DatabaseTable and DatabaseKeys properties are empty and the ModuleTable and ModuleKeys properties refer to the row in the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/component-table">Component table</a> causing the failure.</td>
     * </tr>
     * <tr>
     * <td>msmErrorBadNullSubstitution</td>
     * <td>9</td>
     * <td>Substitution of a Null value into a non-nullable column. This enters msmErrorBadNullSubstitution in the 
     * <b>Type</b> property and enters "ModuleSubstitution" and the keys from the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/modulesubstitution-table">ModuleSubstitution table</a> for this row into the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-moduletable">ModuleTable</a> property and 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-modulekeys">ModuleKeys</a> property. All other properties of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-object">Error</a> object are set to an empty string or -1. 
     * 
     * 
     * This error causes the immediate failure of the merge and the 
     * <b>MergeEx</b>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mergemod/nf-mergemod-imsmmerge2-mergeex">function</a> to return E_FAIL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>msmErrorBadSubstitutionType</td>
     * <td>10</td>
     * <td>Substitution of 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/text-format-types">Text Format Type</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/integer-format-types">Integer Format Type</a> into a 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/binary-type">Binary Type</a> data column. This type of error returns msmErrorBadSubstitutionType in the 
     * <b>Type</b> property and enters "ModuleSubstitution" and the keys from the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/modulesubstitution-table">ModuleSubstitution table</a> for this row into the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-moduletable">ModuleTable</a> property. All other properties of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-object">Error</a> object are set to an empty string or -1. 
     * 
     * 
     * This error causes the immediate failure of the merge and the 
     * <b>MergeEx</b>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mergemod/nf-mergemod-imsmmerge2-mergeex">function</a> to return E_FAIL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>msmErrorMissingConfigItem</td>
     * <td>11</td>
     * <td>A row in the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/modulesubstitution-table">ModuleSubstitution table</a> references a configuration item not defined in the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/moduleconfiguration-table">ModuleConfiguration table</a>. This type of error returns msmErrorMissingConfigItem in the 
     * <b>Type</b> property and enters "ModuleSubstitution" and the keys from the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/modulesubstitution-table">ModuleSubstitution table</a> for this row into the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-moduletable">ModuleTable</a> property. All other properties of the <b>Error</b>object are set to an empty string or -1. 
     * 
     * 
     * This error causes the immediate failure of the merge and the 
     * <b>MergeEx</b>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mergemod/nf-mergemod-imsmmerge2-mergeex">function</a> to return E_FAIL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>msmErrorBadNullResponse</td>
     * <td>12</td>
     * <td>The authoring tool has returned a Null value for an item marked with the msmConfigItemNonNullable attribute. An error of this type returns msmErrorBadNullResponse in the 
     * <b>Type</b> property and enters "ModuleSubstitution" and the keys from the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/modulesubstitution-table">ModuleSubstitution table</a> for for the item into the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-moduletable">ModuleTable</a> property. All other properties of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-object">Error</a> object are set to an empty string or -1. 
     * 
     * 
     * This error causes the immediate failure of the merge and the 
     * <b>MergeEx</b>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mergemod/nf-mergemod-imsmmerge2-mergeex">function</a> to return E_FAIL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>msmErrorDataRequestFailed</td>
     * <td>13</td>
     * <td>The authoring tool returned a failure code (not S_OK or S_FALSE) when asked for data. An error of this type will return msmErrorDataRequestFailed in the 
     * <b>Type</b> property and enters "ModuleSubstitution" and the keys from the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/modulesubstitution-table">ModuleSubstitution table</a> for the item into the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-moduletable">ModuleTable</a> property. All other properties of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/error-object">Error</a> object are set to an empty string or -1. 
     * 
     * 
     * This error causes the immediate failure of the merge and the 
     * <b>MergeEx</b>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mergemod/nf-mergemod-imsmmerge2-mergeex">function</a> to return E_FAIL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>msmErrorPlatformMismatch</td>
     * <td>14</td>
     * <td>Indicates that an attempt was made to merge a 64-bit module into a package that was not a 64-bit package. An error of this type returns msmErrorPlatformMismatch in the 
     * <b>Type</b> property. All other properties of the error object are set to an empty string or -1. This error causes the immediate failure of the merge and causes the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mergemod/nf-mergemod-imsmmerge-merge">Merge</a> function or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mergemod/nf-mergemod-imsmmerge2-mergeex">MergeEx</a> function to return E_FAIL.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ErrorType is Null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmerror-get_type
     */
    get_Type(ErrorType) {
        ErrorTypeMarshal := ErrorType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, ErrorTypeMarshal, ErrorType, "HRESULT")
        return result
    }

    /**
     * The get_Path method retrieves the Path property of the Error object.
     * @param {Pointer<BSTR>} ErrorPath A pointer to a location in memory that is filled in with a <b>BSTR</b> value.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Path is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system was unable to allocate memory for the string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmerror-get_path
     */
    get_Path(ErrorPath) {
        result := ComCall(8, this, "ptr", ErrorPath, "HRESULT")
        return result
    }

    /**
     * The get_Language method retrieves the Language property of the Error object. This function returns the LANGID of the error.
     * @param {Pointer<Integer>} ErrorLanguage A pointer to a location in memory that receives the language value causing this error.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Language is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmerror-get_language
     */
    get_Language(ErrorLanguage) {
        ErrorLanguageMarshal := ErrorLanguage is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, ErrorLanguageMarshal, ErrorLanguage, "HRESULT")
        return result
    }

    /**
     * The get_DatabaseTable method retrieves the DatabaseTable property of the Error object. The method returns the name of the table in the database that caused the error.
     * @param {Pointer<BSTR>} ErrorTable A pointer to a location in memory that is filled in with a <b>BSTR</b> value.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Table is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system was unable to allocate memory for the string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmerror-get_databasetable
     */
    get_DatabaseTable(ErrorTable) {
        result := ComCall(10, this, "ptr", ErrorTable, "HRESULT")
        return result
    }

    /**
     * The get_DatabaseKeys method retrieves the DatabaseKeys property of the Error object. This method returns a pointer to a string collection containing the primary keys of the row in the database causing the error, one key per entry in the collection.
     * @returns {IMsmStrings} A pointer to a location in memory that receives a pointer to a string collection.
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmerror-get_databasekeys
     */
    get_DatabaseKeys() {
        result := ComCall(11, this, "ptr*", &ErrorKeys := 0, "HRESULT")
        return IMsmStrings(ErrorKeys)
    }

    /**
     * The get_ModuleTable method retrieves the ModuleTable property of the Error object. This method returns the name of the table in the module that caused the error.
     * @param {Pointer<BSTR>} ErrorTable A pointer to a location in memory that is filled in with a <b>BSTR</b> value.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Table is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system was unable to allocate memory for the string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmerror-get_moduletable
     */
    get_ModuleTable(ErrorTable) {
        result := ComCall(12, this, "ptr", ErrorTable, "HRESULT")
        return result
    }

    /**
     * The get_ModuleKeys method retrieves the ModuleKeys property of the Error object. This method returns a pointer to a string collection that contains the primary keys of the row in the module causing the error, one key per entry in the collection.
     * @returns {IMsmStrings} A pointer to a location in memory that receives a pointer to a string collection.
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmerror-get_modulekeys
     */
    get_ModuleKeys() {
        result := ComCall(13, this, "ptr*", &ErrorKeys := 0, "HRESULT")
        return IMsmStrings(ErrorKeys)
    }
}
