#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class Environment {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_RUNTIME_POLICY_ALLOW_FULL_DEBUG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_RUNTIME_POLICY_ALLOW_DYNAMIC_DEBUG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_UNSEAL_FLAG_STALE_KEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_FLAG_FULL_DEBUG_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_ENCLAVE_REPORT_PKG_HEADER_VERSION_CURRENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_ENCLAVE_REPORT_SIGNATURE_SCHEME_SHA256_RSA_PSS_SHA256 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_ENCLAVE_REPORT_VERSION_CURRENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_REPORT_DATA_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_ENCLAVE_VARDATA_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_ENCLAVE_VARDATA_MODULE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_VBS_BASIC_KEY_FLAG_MEASUREMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_VBS_BASIC_KEY_FLAG_FAMILY_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_VBS_BASIC_KEY_FLAG_IMAGE_ID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_VBS_BASIC_KEY_FLAG_DEBUG_KEY => 8
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PWSTR} NewEnvironment The environment variable string using the following format:
     * 
     * <i>Var1</i>
     * <i>Value1</i>
     * <i>Var2</i>
     * <i>Value2</i>
     * <i>Var3</i>
     * <i>Value3</i>
     * <i>VarN</i>
     * <i>ValueN</i>
     * @returns {BOOL} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-setenvironmentstringsw
     */
    static SetEnvironmentStringsW(NewEnvironment) {
        NewEnvironment := NewEnvironment is String ? StrPtr(NewEnvironment) : NewEnvironment

        result := DllCall("KERNEL32.dll\SetEnvironmentStringsW", "ptr", NewEnvironment, "int")
        return result
    }

    /**
     * Retrieves the command-line string for the current process.
     * @returns {PSTR} The return value is a pointer to the command-line string for the current process.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-getcommandlinea
     * @since windows5.1.2600
     */
    static GetCommandLineA() {
        result := DllCall("KERNEL32.dll\GetCommandLineA", "ptr")
        return result
    }

    /**
     * Retrieves the command-line string for the current process.
     * @returns {PWSTR} The return value is a pointer to the command-line string for the current process.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-getcommandlinew
     * @since windows5.1.2600
     */
    static GetCommandLineW() {
        result := DllCall("KERNEL32.dll\GetCommandLineW", "ptr")
        return result
    }

    /**
     * Retrieves the environment variables for the current process.
     * @returns {PSTR} If the function succeeds, the return value is a pointer to the environment block of the current process.
     * 
     * If the function fails, the return value is NULL.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-getenvironmentstrings
     * @since windows5.1.2600
     */
    static GetEnvironmentStrings() {
        result := DllCall("KERNEL32.dll\GetEnvironmentStrings", "ptr")
        return result
    }

    /**
     * Retrieves the environment variables for the current process.
     * @returns {PWSTR} If the function succeeds, the return value is a pointer to the environment block of the current process.
     * 
     * If the function fails, the return value is NULL.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-getenvironmentstringsw
     * @since windows5.1.2600
     */
    static GetEnvironmentStringsW() {
        result := DllCall("KERNEL32.dll\GetEnvironmentStringsW", "ptr")
        return result
    }

    /**
     * Frees a block of environment strings.
     * @param {PSTR} penv A pointer to a block of environment strings. The pointer to the block must be obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nf-rrascfg-ieapproviderconfig-initialize">GetEnvironmentStrings</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-freeenvironmentstringsa
     * @since windows5.1.2600
     */
    static FreeEnvironmentStringsA(penv) {
        penv := penv is String ? StrPtr(penv) : penv

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FreeEnvironmentStringsA", "ptr", penv, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Frees a block of environment strings.
     * @param {PWSTR} penv A pointer to a block of environment strings. The pointer to the block must be obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nf-rrascfg-ieapproviderconfig-initialize">GetEnvironmentStrings</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-freeenvironmentstringsw
     * @since windows5.1.2600
     */
    static FreeEnvironmentStringsW(penv) {
        penv := penv is String ? StrPtr(penv) : penv

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FreeEnvironmentStringsW", "ptr", penv, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the contents of the specified variable from the environment block of the calling process.
     * @param {PSTR} lpName The name of the environment variable.
     * @param {PSTR} lpBuffer A pointer to a buffer that receives the contents of the specified environment variable as a null-terminated string. An environment variable has a maximum size limit of 32,767 characters, including the null-terminating character.
     * @param {Integer} nSize The size of the buffer pointed to by the *lpBuffer* parameter, including the null-terminating character, in characters.
     * @returns {Integer} If the function succeeds, the return value is the number of characters stored in the buffer pointed to by *lpBuffer*, not including the terminating null character.
     * 
     * If *lpBuffer* is not large enough to hold the data, the return value is the buffer size, in characters, required to hold the string and its terminating null character and the contents of *lpBuffer* are undefined.
     * 
     * If the function fails, the return value is zero. If the specified environment variable was not found in the environment block, 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_ENVVAR_NOT_FOUND.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-getenvironmentvariablea
     * @since windows5.1.2600
     */
    static GetEnvironmentVariableA(lpName, lpBuffer, nSize) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetEnvironmentVariableA", "ptr", lpName, "ptr", lpBuffer, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the contents of the specified variable from the environment block of the calling process.
     * @param {PWSTR} lpName The name of the environment variable.
     * @param {PWSTR} lpBuffer A pointer to a buffer that receives the contents of the specified environment variable as a null-terminated string.
     * 
     * The maximum size of a user-defined environment variable is 32,767 characters. There is no technical limitation on the size of the environment block. However, there are practical limits depending on the mechanism used to access the block. For example, a batch file cannot set a variable that is longer than the maximum command line length. For more information, see [Environment Variables](/windows/desktop/ProcThread/environment-variables).
     * @param {Integer} nSize The size of the buffer pointed to by the <i>lpBuffer</i> parameter, including the null-terminating character, in characters.
     * @returns {Integer} If the function succeeds, the return value is the number of characters stored in the buffer pointed to by <i>lpBuffer</i>, not including the terminating null character.
     * 
     * If <i>lpBuffer</i> is not large enough to hold the data, the return value is the buffer size, in characters, required to hold the string and its terminating null character and the contents of <i>lpBuffer</i> are undefined.
     * 
     * If the function fails, the return value is zero. If the specified environment variable was not found in the environment block, 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_ENVVAR_NOT_FOUND.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-getenvironmentvariablew
     * @since windows5.1.2600
     */
    static GetEnvironmentVariableW(lpName, lpBuffer, nSize) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetEnvironmentVariableW", "ptr", lpName, "ptr", lpBuffer, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the contents of the specified environment variable for the current process.
     * @param {PSTR} lpName The name of the environment variable. The operating system creates the environment variable if it does not exist and <i>lpValue</i> is not NULL.
     * @param {PSTR} lpValue The contents of the environment variable. The maximum size of a user-defined environment variable is 32,767 characters. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/environment-variables">Environment Variables</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The total size of the environment block for a process may not exceed 32,767 characters.
     * 
     * If this parameter is NULL, the variable is deleted from the current process's environment.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-setenvironmentvariablea
     * @since windows5.1.2600
     */
    static SetEnvironmentVariableA(lpName, lpValue) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpValue := lpValue is String ? StrPtr(lpValue) : lpValue

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetEnvironmentVariableA", "ptr", lpName, "ptr", lpValue, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the contents of the specified environment variable for the current process.
     * @param {PWSTR} lpName The name of the environment variable. The operating system creates the environment variable if it does not exist and <i>lpValue</i> is not NULL.
     * @param {PWSTR} lpValue The contents of the environment variable. 
     * 
     * The maximum size of a user-defined environment variable is 32,767 characters. There is no technical limitation on the size of the environment block. However, there are practical limits depending on the mechanism used to access the block. For example, a batch file cannot set a variable that is longer than the maximum command line length. For more information, see [Environment Variables](/windows/desktop/ProcThread/environment-variables).
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The total size of the environment block for a process may not exceed 32,767 characters.
     * 
     * If this parameter is NULL, the variable is deleted from the current process's environment.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-setenvironmentvariablew
     * @since windows5.1.2600
     */
    static SetEnvironmentVariableW(lpName, lpValue) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpValue := lpValue is String ? StrPtr(lpValue) : lpValue

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetEnvironmentVariableW", "ptr", lpName, "ptr", lpValue, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Expands environment-variable strings and replaces them with the values defined for the current user.
     * @param {PSTR} lpSrc A buffer that contains one or more environment-variable strings in the form: %<i>variableName</i>%. For each such reference, the %<i>variableName</i>% portion is replaced with the current value of that environment variable. 
     * 
     * 
     * 
     * 
     * Case is ignored when looking up the environment-variable name. If the name is not found, the %<i>variableName</i>% portion is left unexpanded.
     * 
     * Note that this function does not support all the features that Cmd.exe supports. For example, it does not support %<i>variableName</i>:<i>str1</i>=<i>str2</i>% or %<i>variableName</i>:~<i>offset</i>,<i>length</i>%.
     * @param {PSTR} lpDst A pointer to a buffer that receives the result of expanding the environment variable strings in the <i>lpSrc</i> buffer. Note that this buffer cannot be the same as the <i>lpSrc</i> buffer.
     * @param {Integer} nSize The maximum number of characters that can be stored in the buffer pointed to by the <i>lpDst</i> parameter. When using ANSI strings, the buffer size should be the string length, plus terminating null character, plus one. When using Unicode strings, the buffer size should be the string length plus the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is the number of <b>TCHARs</b> stored in the destination buffer, including the terminating null character. If the destination buffer is too small to hold the expanded string, the return value is the required buffer size, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-expandenvironmentstringsa
     * @since windows5.0
     */
    static ExpandEnvironmentStringsA(lpSrc, lpDst, nSize) {
        lpSrc := lpSrc is String ? StrPtr(lpSrc) : lpSrc
        lpDst := lpDst is String ? StrPtr(lpDst) : lpDst

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ExpandEnvironmentStringsA", "ptr", lpSrc, "ptr", lpDst, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Expands environment-variable strings and replaces them with the values defined for the current user.
     * @param {PWSTR} lpSrc A buffer that contains one or more environment-variable strings in the form: %<i>variableName</i>%. For each such reference, the %<i>variableName</i>% portion is replaced with the current value of that environment variable. 
     * 
     * 
     * 
     * 
     * Case is ignored when looking up the environment-variable name. If the name is not found, the %<i>variableName</i>% portion is left unexpanded.
     * 
     * Note that this function does not support all the features that Cmd.exe supports. For example, it does not support %<i>variableName</i>:<i>str1</i>=<i>str2</i>% or %<i>variableName</i>:~<i>offset</i>,<i>length</i>%.
     * @param {PWSTR} lpDst A pointer to a buffer that receives the result of expanding the environment variable strings in the <i>lpSrc</i> buffer. Note that this buffer cannot be the same as the <i>lpSrc</i> buffer.
     * @param {Integer} nSize The maximum number of characters that can be stored in the buffer pointed to by the <i>lpDst</i> parameter. When using ANSI strings, the buffer size should be the string length, plus terminating null character, plus one. When using Unicode strings, the buffer size should be the string length plus the terminating null character.
     * @returns {Integer} If the function succeeds, the return value is the number of <b>TCHARs</b> stored in the destination buffer, including the terminating null character. If the destination buffer is too small to hold the expanded string, the return value is the required buffer size, in characters.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-expandenvironmentstringsw
     * @since windows5.0
     */
    static ExpandEnvironmentStringsW(lpSrc, lpDst, nSize) {
        lpSrc := lpSrc is String ? StrPtr(lpSrc) : lpSrc
        lpDst := lpDst is String ? StrPtr(lpDst) : lpDst

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ExpandEnvironmentStringsW", "ptr", lpSrc, "ptr", lpDst, "uint", nSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} lpPathName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcurrentdirectory
     */
    static SetCurrentDirectoryA(lpPathName) {
        lpPathName := lpPathName is String ? StrPtr(lpPathName) : lpPathName

        result := DllCall("KERNEL32.dll\SetCurrentDirectoryA", "ptr", lpPathName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpPathName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcurrentdirectory
     */
    static SetCurrentDirectoryW(lpPathName) {
        lpPathName := lpPathName is String ? StrPtr(lpPathName) : lpPathName

        result := DllCall("KERNEL32.dll\SetCurrentDirectoryW", "ptr", lpPathName, "int")
        return result
    }

    /**
     * 
     * @param {Integer} nBufferLength 
     * @param {PSTR} lpBuffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcurrentdirectory
     */
    static GetCurrentDirectoryA(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\GetCurrentDirectoryA", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} nBufferLength 
     * @param {PWSTR} lpBuffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcurrentdirectory
     */
    static GetCurrentDirectoryW(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\GetCurrentDirectoryW", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * Determines whether the current directory should be included in the search path for the specified executable.
     * @param {PSTR} ExeName The name of the executable file.
     * @returns {BOOL} If the current directory should be part of the search path, the return value is TRUE. Otherwise, the return value is FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-needcurrentdirectoryforexepatha
     * @since windows6.0.6000
     */
    static NeedCurrentDirectoryForExePathA(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\NeedCurrentDirectoryForExePathA", "ptr", ExeName, "int")
        return result
    }

    /**
     * Determines whether the current directory should be included in the search path for the specified executable.
     * @param {PWSTR} ExeName The name of the executable file.
     * @returns {BOOL} If the current directory should be part of the search path, the return value is TRUE. Otherwise, the return value is FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-needcurrentdirectoryforexepathw
     * @since windows6.0.6000
     */
    static NeedCurrentDirectoryForExePathW(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\NeedCurrentDirectoryForExePathW", "ptr", ExeName, "int")
        return result
    }

    /**
     * Retrieves the environment variables for the specified user. This block can then be passed to the CreateProcessAsUser function.
     * @param {Pointer<Pointer<Void>>} lpEnvironment Type: <b>LPVOID*</b>
     * 
     * When this function returns, receives a pointer to the new environment block. The environment block is an array of null-terminated Unicode strings. The list ends with two nulls (\0\0).
     * @param {HANDLE} hToken Type: <b>HANDLE</b>
     * 
     * Token for the user, returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function. If this is a primary token, the token must have <b>TOKEN_QUERY</b> and <b>TOKEN_DUPLICATE</b> access. If the token is an impersonation token, it must have <b>TOKEN_QUERY</b> access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>. 
     * 
     *                     
     * 
     * If this parameter is <b>NULL</b>, the returned environment block contains system variables only.
     * @param {BOOL} bInherit Type: <b>BOOL</b>
     * 
     * Specifies whether to inherit from the current process' environment. If this value is <b>TRUE</b>, the process inherits the current process' environment. If this value is <b>FALSE</b>, the process does not inherit the current process' environment.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-createenvironmentblock
     * @since windows5.0
     */
    static CreateEnvironmentBlock(lpEnvironment, hToken, bInherit) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken

        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("USERENV.dll\CreateEnvironmentBlock", lpEnvironmentMarshal, lpEnvironment, "ptr", hToken, "int", bInherit, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Frees environment variables created by the CreateEnvironmentBlock function.
     * @param {Pointer<Void>} lpEnvironment Type: <b>LPVOID</b>
     * 
     * Pointer to the environment block created by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-createenvironmentblock">CreateEnvironmentBlock</a>. The environment block is an array of null-terminated Unicode strings. The list ends with two nulls (\0\0).
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-destroyenvironmentblock
     * @since windows5.0
     */
    static DestroyEnvironmentBlock(lpEnvironment) {
        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("USERENV.dll\DestroyEnvironmentBlock", lpEnvironmentMarshal, lpEnvironment, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Expands the source string by using the environment block established for the specified user.
     * @param {HANDLE} hToken Type: <b>HANDLE</b>
     * 
     * Token for the user, returned from the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> function. The token must have TOKEN_IMPERSONATE and TOKEN_QUERY access. In addition, as of Windows 7 the token must also have TOKEN_DUPLICATE access. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
     * 
     * 
     * 
     * If <i>hToken</i> is <b>NULL</b>, the environment block contains system variables only.
     * @param {PSTR} lpSrc Type: <b>LPCTSTR</b>
     * 
     * Pointer to the null-terminated source string to be expanded.
     * @param {PSTR} lpDest Type: <b>LPTSTR</b>
     * 
     * Pointer to a buffer that receives the expanded strings.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Specifies the size of the <i>lpDest</i> buffer, in <b>TCHARs</b>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-expandenvironmentstringsforusera
     * @since windows5.0
     */
    static ExpandEnvironmentStringsForUserA(hToken, lpSrc, lpDest, dwSize) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        lpSrc := lpSrc is String ? StrPtr(lpSrc) : lpSrc
        lpDest := lpDest is String ? StrPtr(lpDest) : lpDest

        A_LastError := 0

        result := DllCall("USERENV.dll\ExpandEnvironmentStringsForUserA", "ptr", hToken, "ptr", lpSrc, "ptr", lpDest, "uint", dwSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Expands the source string by using the environment block established for the specified user.
     * @param {HANDLE} hToken Type: <b>HANDLE</b>
     * 
     * Token for the user, returned from the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> function. The token must have TOKEN_IMPERSONATE and TOKEN_QUERY access. In addition, as of Windows 7 the token must also have TOKEN_DUPLICATE access. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
     * 
     * 
     * 
     * If <i>hToken</i> is <b>NULL</b>, the environment block contains system variables only.
     * @param {PWSTR} lpSrc Type: <b>LPCTSTR</b>
     * 
     * Pointer to the null-terminated source string to be expanded.
     * @param {PWSTR} lpDest Type: <b>LPTSTR</b>
     * 
     * Pointer to a buffer that receives the expanded strings.
     * @param {Integer} dwSize Type: <b>DWORD</b>
     * 
     * Specifies the size of the <i>lpDest</i> buffer, in <b>TCHARs</b>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-expandenvironmentstringsforuserw
     * @since windows5.0
     */
    static ExpandEnvironmentStringsForUserW(hToken, lpSrc, lpDest, dwSize) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        lpSrc := lpSrc is String ? StrPtr(lpSrc) : lpSrc
        lpDest := lpDest is String ? StrPtr(lpDest) : lpDest

        A_LastError := 0

        result := DllCall("USERENV.dll\ExpandEnvironmentStringsForUserW", "ptr", hToken, "ptr", lpSrc, "ptr", lpDest, "uint", dwSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves whether the specified type of enclave is supported.
     * @param {Integer} flEnclaveType The type of enclave to check.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_TYPE_SGX"></a><a id="enclave_type_sgx"></a><dl>
     * <dt><b><b>ENCLAVE_TYPE_SGX</b></b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An enclave for the Intel Software Guard Extensions (SGX) architecture extension.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_TYPE_VBS"></a><a id="enclave_type_vbs"></a><dl>
     * <dt><b>ENCLAVE_TYPE_VBS</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A  virtualization-based security (VBS) enclave.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * For a list of common error codes, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>. The following error codes also apply for this function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_SUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unsupported enclave type was specified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-isenclavetypesupported
     * @since windows10.0.10240
     */
    static IsEnclaveTypeSupported(flEnclaveType) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\IsEnclaveTypeSupported", "uint", flEnclaveType, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new uninitialized enclave. An enclave is an isolated region of code and data within the address space for an application. Only code that runs within the enclave can access data within the same enclave.
     * @param {HANDLE} hProcess A handle to the process for which you want to create an enclave.
     * @param {Pointer<Void>} lpAddress The preferred base address of the enclave. Specify <b>NULL</b> to have the operating system assign the base address.
     * @param {Pointer} dwSize The size of the enclave that you want to create, including the size of the code that you will load into the enclave, in bytes.
     * @param {Pointer} dwInitialCommitment The amount of memory to commit for the enclave, in bytes.
     * 
     * If the amount of enclave memory available is not sufficient to commit this number of bytes, enclave creation fails. Any memory that remains unused when you initialize the enclave by calling <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-initializeenclave">InitializeEnclave</a> is returned to the list of free pages.
     * 
     * The value of the <i>dwInitialCommittment</i> parameter must not exceed the value of the <i>dwSize</i> parameter.
     * 
     * This parameter is not used for virtualization-based security (VBS) enclaves.
     * @param {Integer} flEnclaveType The architecture type of the enclave that you want to create. To verify that an enclave type is supported, call <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-isenclavetypesupported">IsEnclaveTypeSupported</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_TYPE_SGX"></a><a id="enclave_type_sgx"></a><dl>
     * <dt><b><b>ENCLAVE_TYPE_SGX</b></b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An enclave for the Intel Software Guard Extensions (SGX) architecture extension.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_TYPE_VBS"></a><a id="enclave_type_vbs"></a><dl>
     * <dt><b>ENCLAVE_TYPE_VBS</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A  VBS enclave.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} lpEnclaveInformation A pointer to the architecture-specific information to use to create the enclave. 
     * 
     * For the <b>ENCLAVE_TYPE_SGX</b> enclave type, you must specify a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-enclave_create_info_sgx">ENCLAVE_CREATE_INFO_SGX</a> structure.
     * 
     * For the <b>ENCLAVE_TYPE_VBS</b> enclave type, you must specify a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-enclave_create_info_vbs">ENCLAVE_CREATE_INFO_VBS</a> structure.
     * @param {Integer} dwInfoLength The length of the structure that the <i>lpEnclaveInformation</i> parameter points to, in bytes. For the <b>ENCLAVE_TYPE_SGX</b> enclave type, this value must be 4096.  For the <b>ENCLAVE_TYPE_VBS</b> enclave type, this value must be <c>sizeof(ENCLAVE_CREATE_INFO_VBS)</c>, which is 36 bytes.
     * @param {Pointer<Integer>} lpEnclaveError An optional pointer to  a variable that receives an enclave error code that is architecture-specific. For the <b>ENCLAVE_TYPE_SGX</b> and <b>ENCLAVE_TYPE_VBS</b>  enclave types, the <i>lpEnclaveError</i> parameter is not used.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the created enclave.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. 
     * 
     * For a list of common error codes, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>. The following error codes also apply for this function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_SUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unsupported enclave type was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_BAD_LENGTH</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>dwInfoLength</i> parameter did not match the value expected based on the value specified for the <i>lpEnclaveInformation</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-createenclave
     * @since windows10.0.10240
     */
    static CreateEnclave(hProcess, lpAddress, dwSize, dwInitialCommitment, flEnclaveType, lpEnclaveInformation, dwInfoLength, lpEnclaveError) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"
        lpEnclaveErrorMarshal := lpEnclaveError is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateEnclave", "ptr", hProcess, lpAddressMarshal, lpAddress, "ptr", dwSize, "ptr", dwInitialCommitment, "uint", flEnclaveType, "ptr", lpEnclaveInformation, "uint", dwInfoLength, lpEnclaveErrorMarshal, lpEnclaveError, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads data into an uninitialized enclave that you created by calling CreateEnclave.
     * @param {HANDLE} hProcess A handle to the process for which the enclave was created.
     * @param {Pointer<Void>} lpAddress The address in the enclave where you want to load the data.
     * @param {Pointer} lpBuffer A pointer to the data the you want to load into the enclave.
     * @param {Pointer} nSize The size of the data that you want to load into the enclave, in bytes. This value must be a whole-number multiple of the page size.
     * @param {Integer} flProtect The memory protection to use for the pages that you want to add to the enclave. For a list of memory protection values, see <a href="https://docs.microsoft.com/windows/desktop/Memory/memory-protection-constants">memory protection constants</a>. This value must not include the following constants:
     * 
     * <ul>
     * <li><b>PAGE_GUARD</b></li>
     * <li><b>PAGE_NOCACHE</b></li>
     * <li><b>PAGE_WRITECOMBINE</b></li>
     * <li><b>PAGE_NOACCESS</b></li>
     * </ul>
     * This value can include the enclave specific constants that the following table describes.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>PAGE_ENCLAVE_THREAD_CONTROL</b></td>
     * <td>The page contains a thread control structure (TCS).</td>
     * </tr>
     * <tr>
     * <td><b>PAGE_ENCLAVE_UNVALIDATED</b></td>
     * <td>The page contents that you supply are excluded from measurement with the EEXTEND instruction of the Intel Software Guard Extensions programming model.</td>
     * </tr>
     * </table>
     * @param {Pointer} lpPageInformation A pointer to information that describes the pages that you want to add to the enclave. The <i>lpPageInformation</i> parameter is not used.
     * @param {Integer} dwInfoLength The length of the structure that the <i>lpPageInformation</i> parameter points to, in bytes. This value must be 0.
     * @param {Pointer<Pointer>} lpNumberOfBytesWritten A pointer to a variable that receives the number of bytes that <b>LoadEnclaveData</b> copied into the enclave.
     * @param {Pointer<Integer>} lpEnclaveError An optional pointer to  a variable that receives an enclave error code that is architecture-specific. The <i>lpEnclaveError</i> parameter is not used.
     * @returns {BOOL} If all of the data is loaded into the enclave successfully, the return value is nonzero. Otherwise, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * For a list of common error codes, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>. The following error codes also apply for this function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_BAD_LENGTH</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>dwInfoLength</i> parameter did not match the value expected based on the value specified for the <i>lpPageInformation</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-loadenclavedata
     * @since windows10.0.10240
     */
    static LoadEnclaveData(hProcess, lpAddress, lpBuffer, nSize, flProtect, lpPageInformation, dwInfoLength, lpNumberOfBytesWritten, lpEnclaveError) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"
        lpNumberOfBytesWrittenMarshal := lpNumberOfBytesWritten is VarRef ? "ptr*" : "ptr"
        lpEnclaveErrorMarshal := lpEnclaveError is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LoadEnclaveData", "ptr", hProcess, lpAddressMarshal, lpAddress, "ptr", lpBuffer, "ptr", nSize, "uint", flProtect, "ptr", lpPageInformation, "uint", dwInfoLength, lpNumberOfBytesWrittenMarshal, lpNumberOfBytesWritten, lpEnclaveErrorMarshal, lpEnclaveError, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes an enclave that you created and loaded with data.
     * @param {HANDLE} hProcess A handle to the process for which the enclave was created.
     * @param {Pointer<Void>} lpAddress Any address within the enclave.
     * @param {Pointer} lpEnclaveInformation A pointer to architecture-specific information to use to initialize the enclave.
     * 
     * For the <b>ENCLAVE_TYPE_SGX</b> enclave type, specify a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-enclave_init_info_sgx">ENCLAVE_INIT_INFO_SGX</a> structure.
     * 
     * For the <b>ENCLAVE_TYPE_VBS</b> enclave type, specify a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-enclave_init_info_vbs">ENCLAVE_INIT_INFO_VBS</a> structure.
     * @param {Integer} dwInfoLength The length of the structure that the <i>lpEnclaveInformation</i> parameter points to, in bytes. For the <b>ENCLAVE_TYPE_SGX</b> enclave type, this value must be 4096. For the <b>ENCLAVE_TYPE_VBS</b> enclave type, this value must be <c>sizeof(ENCLAVE_INIT_INFO_VBS)</c>, which is 8 bytes.
     * @param {Pointer<Integer>} lpEnclaveError An optional pointer to  a variable that receives an enclave error code that is architecture-specific.
     * 
     * For the <b>ENCLAVE_TYPE_SGX</b> enclave type, the <i>lpEnclaveError</i> parameter contains the error that the EINIT instruction generated if the function fails and .<a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ENCLAVE_FAILURE</b>.
     * 
     * For the <b>ENCLAVE_TYPE_VBS</b> enclave type, the <i>lpEnclaveError</i> parameter  is not used.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * For a list of common error codes, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>. The following error codes also apply for this function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_ENCLAVE_FAILURE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An failure specific to the underlying enclave architecture occurred. The value for the  <i>lpEnclaveError</i> parameter contains the architecture-specific error. 
     * 
     * For the <b>ENCLAVE_TYPE_SGX</b> enclave type, the EINIT instruction that the <a href="/windows/desktop/api/winnt/ns-winnt-enclave_init_info_sgx">ENCLAVE_INIT_INFO_SGX</a> structure specified generated an error. The value of the <i>lpEnclaveError</i> parameter contains the error that the instruction generated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_BAD_LENGTH</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>dwInfoLength</i> parameter did not match the value expected based on the value specified for the <i>lpEnclaveInformation</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_RETRY</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The processor was not able to initialize the enclave in a timely fashion. Try  to initialize the enclave again.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-initializeenclave
     * @since windows10.0.10240
     */
    static InitializeEnclave(hProcess, lpAddress, lpEnclaveInformation, dwInfoLength, lpEnclaveError) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"
        lpEnclaveErrorMarshal := lpEnclaveError is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitializeEnclave", "ptr", hProcess, lpAddressMarshal, lpAddress, "ptr", lpEnclaveInformation, "uint", dwInfoLength, lpEnclaveErrorMarshal, lpEnclaveError, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads an image and all of its imports into an enclave.
     * @param {Pointer<Void>} lpEnclaveAddress The base address of the image into which to load the image.
     * @param {PSTR} lpImageName A NULL-terminated string that contains the name of the image to load.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise <b>FALSE</b>.  
     * 
     * To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-loadenclaveimagea
     */
    static LoadEnclaveImageA(lpEnclaveAddress, lpImageName) {
        lpImageName := lpImageName is String ? StrPtr(lpImageName) : lpImageName

        lpEnclaveAddressMarshal := lpEnclaveAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-core-enclave-l1-1-1.dll\LoadEnclaveImageA", lpEnclaveAddressMarshal, lpEnclaveAddress, "ptr", lpImageName, "int")
        return result
    }

    /**
     * Loads an image and all of its imports into an enclave.
     * @param {Pointer<Void>} lpEnclaveAddress The base address of the image into which to load the image.
     * @param {PWSTR} lpImageName A NULL-terminated string that contains the name of the image to load.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise <b>FALSE</b>.  To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-loadenclaveimagew
     * @since windows10.0.16299
     */
    static LoadEnclaveImageW(lpEnclaveAddress, lpImageName) {
        lpImageName := lpImageName is String ? StrPtr(lpImageName) : lpImageName

        lpEnclaveAddressMarshal := lpEnclaveAddress is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("api-ms-win-core-enclave-l1-1-1.dll\LoadEnclaveImageW", lpEnclaveAddressMarshal, lpEnclaveAddress, "ptr", lpImageName, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Calls a function within an enclave.
     * @param {Pointer} lpRoutine The address of the function that you want to call.
     * @param {Pointer<Void>} lpParameter The parameter than you want to pass to the function.
     * @param {BOOL} fWaitForThread <b>TRUE</b> if the call to the specified function should block execution until an idle enclave thread becomes available when no idle enclave thread is available. 
     * <b>FALSE</b> if the call to the specified function should fail when no idle enclave thread is available. 
     * 
     * 
     * This parameter is ignored when you use <b>CallEnclave</b> within an enclave to call a function that is not in any enclave.
     * @param {Pointer<Pointer<Void>>} lpReturnValue The return value of the function, if it is called successfully.
     * @returns {BOOL} <b>TRUE</b> if the specified function was called successfully; otherwise <b>FALSE</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-callenclave
     * @since windows10.0.16299
     */
    static CallEnclave(lpRoutine, lpParameter, fWaitForThread, lpReturnValue) {
        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"
        lpReturnValueMarshal := lpReturnValue is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("vertdll.dll\CallEnclave", "ptr", lpRoutine, lpParameterMarshal, lpParameter, "int", fWaitForThread, lpReturnValueMarshal, lpReturnValue, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Ends the execution of the threads that are running within an enclave.
     * @param {Pointer<Void>} lpAddress The base address of the enclave in which to end the execution of the threads.
     * @param {BOOL} fWait <b>TRUE</b> if <b>TerminateEnclave</b> should not return  until all of the threads in the enclave end execution. <b>FALSE</b> if <b>TerminateEnclave</b> should return immediately.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise <b>FALSE</b>.  To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-terminateenclave
     * @since windows10.0.16299
     */
    static TerminateEnclave(lpAddress, fWait) {
        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("vertdll.dll\TerminateEnclave", lpAddressMarshal, lpAddress, "int", fWait, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes the specified enclave.
     * @param {Pointer<Void>} lpAddress The base address of the enclave that you want to delete.
     * @returns {BOOL} <b>TRUE</b> if the enclave was deleted successfully; otherwise <b>FALSE</b>. To get extended error information, 
     *        call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. 
     * 
     * For a list of common error codes, see <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a>. The following error codes also apply for this function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ENCLAVE_NOT_TERMINATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The execution of threads running with the enclave was not ended, because either <a href="/windows/desktop/api/enclaveapi/nf-enclaveapi-terminateenclave">TerminateEnclave</a> was not called, or the execution of the threads has not yet ended in response to an earlier call to <b>TerminateEnclave</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//enclaveapi/nf-enclaveapi-deleteenclave
     * @since windows10.0.16299
     */
    static DeleteEnclave(lpAddress) {
        lpAddressMarshal := lpAddress is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("api-ms-win-core-enclave-l1-1-1.dll\DeleteEnclave", lpAddressMarshal, lpAddress, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets an enclave attestation report that describes the current enclave and is signed by the authority that is responsible for the type of the enclave.
     * @param {Pointer<Integer>} EnclaveData A pointer to a 64-byte buffer of data that the enclave wants to insert into its signed report.  For example, this buffer could include a 256-bit nonce that the relying party supplied, followed by a SHA-256 hash of additional data that the enclave wants to convey, such as a public key that corresponds to a private key that the enclave owns.  If this parameter is NULL, the corresponding field of the report is  filled with zeroes.
     * @param {Pointer} Report A pointer to a buffer where the report should be placed.  This report may be stored either within the address range of the enclave or within the address space of the host process.  Specify NULL to indicate that only the size of the buffer required for the output should be calculated, and not the report itself.
     * @param {Integer} BufferSize The size of the buffer to which the <i>Report</i> parameter points.  If <i>Report</i> is NULL, <i>BufferSize</i> must be zero.  If <i>Report</i> is not NULL, and if the size of the report is larger than this value, an error is returned.
     * @returns {Integer} A pointer to a variable that receives the size of the report.
     * @see https://docs.microsoft.com/windows/win32/api//winenclaveapi/nf-winenclaveapi-enclavegetattestationreport
     * @since windows10.0.16299
     */
    static EnclaveGetAttestationReport(EnclaveData, Report, BufferSize) {
        EnclaveDataMarshal := EnclaveData is VarRef ? "char*" : "ptr"

        result := DllCall("vertdll.dll\EnclaveGetAttestationReport", EnclaveDataMarshal, EnclaveData, "ptr", Report, "uint", BufferSize, "uint*", &OutputSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OutputSize
    }

    /**
     * Verifies an attestation report that was generated on the current system.
     * @param {Integer} EnclaveType The type of the enclave for which the report was generated. Must be <b>ENCLAVE_TYPE_VBS</b>.
     * @param {Pointer} Report A pointer to a buffer that stores the report.  This report may be stored either within the address range of the enclave or within the address space of the host process.
     * @param {Integer} ReportSize The size of the report, in bytes.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//winenclaveapi/nf-winenclaveapi-enclaveverifyattestationreport
     * @since windows10.0.16299
     */
    static EnclaveVerifyAttestationReport(EnclaveType, Report, ReportSize) {
        result := DllCall("vertdll.dll\EnclaveVerifyAttestationReport", "uint", EnclaveType, "ptr", Report, "uint", ReportSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Generates an encrypted binary large object (blob) from unencypted data.
     * @param {Pointer} DataToEncrypt A pointer to the data that you want to seal. This data can be stored either within the address range of the enclave or within the address range of the host process.
     * @param {Integer} DataToEncryptSize The size of the data that you want to seal, in bytes.
     * @param {Integer} IdentityPolicy A value that specifies how another enclave must be related to the enclave that calls <b>EnclaveSealData</b> for the enclave to unseal the data.
     * @param {Integer} RuntimePolicy A value that indicates whether an enclave that runs with debugging turned on is permitted to unseal the data the this call to <b>EnclaveSealData</b> seals.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_RUNTIME_POLICY_ALLOW_FULL_DEBUG"></a><a id="enclave_runtime_policy_allow_full_debug"></a><dl>
     * <dt><b>ENCLAVE_RUNTIME_POLICY_ALLOW_FULL_DEBUG</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  If specified, indicates that an enclave that runs with debugging turned on is permitted to unseal the data.  If not specified, indicates that an enclave that runs with debugging turned on is not permitted to unseal the data.  This flag is automatically included if the calling enclave is running with debugging turned on. 
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_RUNTIME_POLICY_ALLOW_DYNAMIC_DEBUG"></a><a id="enclave_runtime_policy_allow_dynamic_debug"></a><dl>
     * <dt><b>ENCLAVE_RUNTIME_POLICY_ALLOW_DYNAMIC_DEBUG</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If specified, indicates that an enclave that runs with dynamic debugging turned on is permitted to unseal the data.  If not specified, indicates that an enclave that runs with dynamic debugging turned on is not permitted to unseal the data.  This flag is automatically included if the calling enclave is running with dynamic debugging turned on
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} ProtectedBlob A pointer to a buffer where the sealed data should be placed.  This data may be stored either within the address range of the enclave or within the address space of the host process.  If this parameter is NULL, only the size of the protected blob is calculated.
     * @param {Integer} BufferSize A pointer to a variable that holds the size of the buffer to which the <i>ProtectedBlob</i> parameter points.  If <i>ProtectedBlob</i> is NULL, this value must be zero.  If <i>ProtectedBlob</i> is not NULL, and if the size of the encrypted data is larger than this value, an error occurs.
     * @returns {Integer} A pointer to a variable that receives the actual size of the encrypted blob.
     * @see https://docs.microsoft.com/windows/win32/api//winenclaveapi/nf-winenclaveapi-enclavesealdata
     * @since windows10.0.16299
     */
    static EnclaveSealData(DataToEncrypt, DataToEncryptSize, IdentityPolicy, RuntimePolicy, ProtectedBlob, BufferSize) {
        result := DllCall("vertdll.dll\EnclaveSealData", "ptr", DataToEncrypt, "uint", DataToEncryptSize, "int", IdentityPolicy, "uint", RuntimePolicy, "ptr", ProtectedBlob, "uint", BufferSize, "uint*", &ProtectedBlobSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProtectedBlobSize
    }

    /**
     * Decrypts an encrypted binary large object (blob).
     * @param {Pointer} ProtectedBlob A pointer to the sealed data to unseal.  This data may be stored either within the address range of the enclave or within the address space of the host process
     * @param {Integer} ProtectedBlobSize The size of the sealed data to unseal, in bytes.
     * @param {Pointer} DecryptedData A pointer to a buffer where the unencrypted data should be placed.  This data may be stored either within the address range of the enclave or within the address space of the host process.  If this  parameter is NULL, only the size of the decrypted data is calculated.
     * @param {Integer} BufferSize The size of the buffer to which the <i>DecryptedData</i> parameter points, in bytes. If <i>DecryptedData</i> is NULL, <i>BufferSize</i> must be zero.  If <i>DecryptedData</i> is not NULL, and if the size of the decrypted data is larger than this value, an error is returned.
     * @param {Pointer<Integer>} DecryptedDataSize A pointer to a variable that receives the actual size of the decrypted data, in bytes.
     * @param {Pointer<ENCLAVE_IDENTITY>} SealingIdentity An optional pointer to a buffer that should be filled with the identity of the enclave that sealed the data.  If this pointer is NULL, the  identity of the sealing enclave is  not returned.
     * @param {Pointer<Integer>} UnsealingFlags An optional pointer to a variable that receives zero or more of the following flags that describe the encrypted binary large object.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_UNSEAL_FLAG_STALE_KEY"></a><a id="enclave_unseal_flag_stale_key"></a><dl>
     * <dt><b>ENCLAVE_UNSEAL_FLAG_STALE_KEY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The data was encrypted with a stale key.  Sealing keys are rotated when required for security, and the system can only maintain a fixed number of recently known keys.  An enclave that determines that data was encrypted with a stale key should reencrypt the data with a current key to minimize the chances that the key used to encrypt the data is no longer maintained in the key list. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//winenclaveapi/nf-winenclaveapi-enclaveunsealdata
     * @since windows10.0.16299
     */
    static EnclaveUnsealData(ProtectedBlob, ProtectedBlobSize, DecryptedData, BufferSize, DecryptedDataSize, SealingIdentity, UnsealingFlags) {
        DecryptedDataSizeMarshal := DecryptedDataSize is VarRef ? "uint*" : "ptr"
        UnsealingFlagsMarshal := UnsealingFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("vertdll.dll\EnclaveUnsealData", "ptr", ProtectedBlob, "uint", ProtectedBlobSize, "ptr", DecryptedData, "uint", BufferSize, DecryptedDataSizeMarshal, DecryptedDataSize, "ptr", SealingIdentity, UnsealingFlagsMarshal, UnsealingFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} DataToEncrypt 
     * @param {Integer} DataToEncryptSize 
     * @param {Pointer<TRUSTLET_BINDING_DATA>} TrustletBindingData 
     * @param {Pointer} EncryptedData 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    static EnclaveEncryptDataForTrustlet(DataToEncrypt, DataToEncryptSize, TrustletBindingData, EncryptedData, BufferSize) {
        result := DllCall("vertdll.dll\EnclaveEncryptDataForTrustlet", "ptr", DataToEncrypt, "uint", DataToEncryptSize, "ptr", TrustletBindingData, "ptr", EncryptedData, "uint", BufferSize, "uint*", &EncryptedDataSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EncryptedDataSize
    }

    /**
     * Gets information about the currently executing enclave.
     * @param {Integer} InformationSize The size of the <a href="https://docs.microsoft.com/windows/desktop/api/ntenclv/ns-ntenclv-enclave_information">ENCLAVE_INFORMATION</a> structure that the <i>EnclaveInformation</i> parameter points to, in bytes.
     * @param {Pointer} EnclaveInformation Information about the currently executing enclave.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//winenclaveapi/nf-winenclaveapi-enclavegetenclaveinformation
     * @since windows10.0.16299
     */
    static EnclaveGetEnclaveInformation(InformationSize, EnclaveInformation) {
        result := DllCall("vertdll.dll\EnclaveGetEnclaveInformation", "uint", InformationSize, "ptr", EnclaveInformation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static EnclaveUsesAttestedKeys() {
        result := DllCall("vertdll.dll\EnclaveUsesAttestedKeys", "char")
        return result
    }

    /**
     * 
     * @param {BOOL} RestrictAccess 
     * @returns {BOOL} 
     */
    static EnclaveRestrictContainingProcessAccess(RestrictAccess) {
        result := DllCall("vertdll.dll\EnclaveRestrictContainingProcessAccess", "int", RestrictAccess, "int*", &PreviouslyRestricted := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PreviouslyRestricted
    }

    /**
     * 
     * @param {Pointer} EnclaveAddress 
     * @param {Pointer} UnsecureAddress 
     * @param {Pointer} NumberOfBytes 
     * @returns {HRESULT} 
     */
    static EnclaveCopyIntoEnclave(EnclaveAddress, UnsecureAddress, NumberOfBytes) {
        result := DllCall("vertdll.dll\EnclaveCopyIntoEnclave", "ptr", EnclaveAddress, "ptr", UnsecureAddress, "ptr", NumberOfBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} UnsecureAddress 
     * @param {Pointer} EnclaveAddress 
     * @param {Pointer} NumberOfBytes 
     * @returns {HRESULT} 
     */
    static EnclaveCopyOutOfEnclave(UnsecureAddress, EnclaveAddress, NumberOfBytes) {
        result := DllCall("vertdll.dll\EnclaveCopyOutOfEnclave", "ptr", UnsecureAddress, "ptr", EnclaveAddress, "ptr", NumberOfBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
