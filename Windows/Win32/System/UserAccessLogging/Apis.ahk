#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UAL_DATA_BLOB.ahk" { UAL_DATA_BLOB }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.UserAccessLogging
 */

;@region Functions
/**
 * Starts a User Access Logging (UAL) session.
 * @param {Pointer<UAL_DATA_BLOB>} Data A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ual/ns-ual-ual_data_blob">UAL_DATA_BLOB</a> structure that specifies session information.
 * 
 * Only the <b>RoleGuid</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/ual/ns-ual-ual_data_blob">UAL_DATA_BLOB</a> structure is required. All other members can be null.
 * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If it fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/ual/nf-ual-ualstart
 * @since windows8.0
 */
export UalStart(Data) {
    result := DllCall("ualapi.dll\UalStart", UAL_DATA_BLOB.Ptr, Data, "HRESULT")
    return result
}

/**
 * Stops a User Access Logging (UAL) session.
 * @param {Pointer<UAL_DATA_BLOB>} Data A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ual/ns-ual-ual_data_blob">UAL_DATA_BLOB</a> structure that specifies session information.
 * 
 * Only the <b>RoleGuid</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/ual/ns-ual-ual_data_blob">UAL_DATA_BLOB</a> structure is required. All other members can be null.
 * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If it fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/ual/nf-ual-ualstop
 * @since windows8.0
 */
export UalStop(Data) {
    result := DllCall("ualapi.dll\UalStop", UAL_DATA_BLOB.Ptr, Data, "HRESULT")
    return result
}

/**
 * Records the specified data to the User Access Logging (UAL) framework by using information from a UAL_DATA_BLOB structure.
 * @param {Pointer<UAL_DATA_BLOB>} Data A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ual/ns-ual-ual_data_blob">UAL_DATA_BLOB</a> structure that specifies session information.
 * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If it fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/ual/nf-ual-ualinstrument
 * @since windows8.0
 */
export UalInstrument(Data) {
    result := DllCall("ualapi.dll\UalInstrument", UAL_DATA_BLOB.Ptr, Data, "HRESULT")
    return result
}

/**
 * Registers a product with User Access Logging (UAL).
 * @param {PWSTR} wszProductName The name of the major product to register with UAL. For example, "Windows Server".
 * @param {PWSTR} wszRoleName The name of the role or minor product within the major product to be registered with UAL. For example, "DHCP".
 * @param {PWSTR} wszGuid The GUID associated with the role specified by the <i>wszRoleName</i> parameter.
 * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If it fails, it returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/ual/nf-ual-ualregisterproduct
 * @since windows8.0
 */
export UalRegisterProduct(wszProductName, wszRoleName, wszGuid) {
    wszProductName := wszProductName is String ? StrPtr(wszProductName) : wszProductName
    wszRoleName := wszRoleName is String ? StrPtr(wszRoleName) : wszRoleName
    wszGuid := wszGuid is String ? StrPtr(wszGuid) : wszGuid

    result := DllCall("ualapi.dll\UalRegisterProduct", "ptr", wszProductName, "ptr", wszRoleName, "ptr", wszGuid, "HRESULT")
    return result
}

;@endregion Functions
