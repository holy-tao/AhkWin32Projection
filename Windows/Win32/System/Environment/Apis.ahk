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
     * The SetEnvironmentStringsW (Unicode) function (processenv.h) sets the environment strings of the calling process for the current process.
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
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-setenvironmentstringsw
     */
    static SetEnvironmentStringsW(NewEnvironment) {
        NewEnvironment := NewEnvironment is String ? StrPtr(NewEnvironment) : NewEnvironment

        result := DllCall("KERNEL32.dll\SetEnvironmentStringsW", "ptr", NewEnvironment, "int")
        return result
    }

    /**
     * Retrieves the command-line string for the current process. (ANSI)
     * @remarks
     * The lifetime of the returned value is managed by the system, applications should not free or modify this value.
     * 
     * Console processes can use the <i>argc</i> and <i>argv</i> arguments of the <b>main</b> or <b>wmain</b> functions by implementing those as the program entry point.
     * GUI processes can use the <i>lpCmdLine</i> argument of the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-winmain">WinMain</a> or wWinMain functions by implementing those as the program entry point.
     * 
     * To convert the command line to an <i>argv</i> style array of strings, pass the result from GetCommandLineA to
     * <a href="https://docs.microsoft.com/windows/win32/api/shellapi/nf-shellapi-commandlinetoargvw">CommandLineToArgW</a>.
     * 
     * <div class="alert"><b>Note</b>  The name of the executable in the command line that the operating system provides to a process is not necessarily identical to that in the command line that the calling process gives to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function. The operating system may prepend a fully qualified path to an executable name that is provided without a fully qualified path.</div>
     * <div> </div>
     * 
     * > [!NOTE]
     * > The processenv.h header defines GetCommandLine as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {PSTR} The return value is a pointer to the command-line string for the current process.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-getcommandlinea
     * @since windows5.1.2600
     */
    static GetCommandLineA() {
        result := DllCall("KERNEL32.dll\GetCommandLineA", "ptr")
        return result
    }

    /**
     * Retrieves the command-line string for the current process. (Unicode)
     * @remarks
     * The lifetime of the returned value is managed by the system, applications should not free or modify this value.
     * 
     * Console processes can use the <i>argc</i> and <i>argv</i> arguments of the <b>main</b> or <b>wmain</b> functions by implementing those as the program entry point.
     * GUI processes can use the <i>lpCmdLine</i> argument of the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-winmain">WinMain</a> or wWinMain functions by implementing those as the program entry point.
     * 
     * To convert the command line to an <i>argv</i> style array of strings, pass the result from GetCommandLineW to
     * <a href="https://docs.microsoft.com/windows/win32/api/shellapi/nf-shellapi-commandlinetoargvw">CommandLineToArgvW</a>.
     * 
     * <div class="alert"><b>Note</b>  The name of the executable in the command line that the operating system provides to a process is not necessarily identical to that in the command line that the calling process gives to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function. The operating system may prepend a fully qualified path to an executable name that is provided without a fully qualified path.</div>
     * <div> </div>
     * 
     * > [!NOTE]
     * > The processenv.h header defines GetCommandLine as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {PWSTR} The return value is a pointer to the command-line string for the current process.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-getcommandlinew
     * @since windows5.1.2600
     */
    static GetCommandLineW() {
        result := DllCall("KERNEL32.dll\GetCommandLineW", "ptr")
        return result
    }

    /**
     * The GetEnvironmentStrings function (processenv.h) retrieves the environment variables for the current process.
     * @remarks
     * The 
     * <b>GetEnvironmentStrings</b> function returns a pointer to a block of memory that contains the environment variables of the calling process (both the system and the user environment variables). Each environment block contains the environment variables in the following format:
     * 
     * Each environment block contains the environment variables in the following format:
     * 
     * *Var1*=*Value1*\0<br/>
     * *Var2*=*Value2*\0<br/>
     * *Var3*=*Value3*\0<br/>
     * ...<br/>
     * *VarN*=*ValueN*\0\0
     * 
     * The name of an environment variable cannot include an equal sign (=).
     * 
     * Treat this memory as read-only; do not modify it directly. To add or change an environment variable, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getenvironmentvariable">GetEnvironmentVariable</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setenvironmentvariable">SetEnvironmentVariable</a> functions.
     * 
     * When the block returned by 
     * <b>GetEnvironmentStrings</b> is no longer needed, it should be freed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-freeenvironmentstringsa">FreeEnvironmentStrings</a> function.
     * 
     * Note that the ANSI version of this function, <b>GetEnvironmentStringsA</b>, returns OEM characters.
     * @returns {PSTR} If the function succeeds, the return value is a pointer to the environment block of the current process.
     * 
     * If the function fails, the return value is NULL.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-getenvironmentstrings
     * @since windows5.1.2600
     */
    static GetEnvironmentStrings() {
        result := DllCall("KERNEL32.dll\GetEnvironmentStrings", "ptr")
        return result
    }

    /**
     * The GetEnvironmentStringsW (Unicode) function (processenv.h) retrieves the environment variables for the current process.
     * @remarks
     * The 
     * <b>GetEnvironmentStrings</b> function returns a pointer to a block of memory that contains the environment variables of the calling process (both the system and the user environment variables). Each environment block contains the environment variables in the following format:
     * 
     * *Var1*=*Value1*\0<br/>
     * *Var2*=*Value2*\0<br/>
     * *Var3*=*Value3*\0<br/>
     * ...<br/>
     * *VarN*=*ValueN*\0\0
     * 
     * The name of an environment variable cannot include an equal sign (=).
     * 
     * Treat this memory as read-only; do not modify it directly. To add or change an environment variable, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getenvironmentvariable">GetEnvironmentVariable</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setenvironmentvariable">SetEnvironmentVariable</a> functions.
     * 
     * When the block returned by 
     * <b>GetEnvironmentStrings</b> is no longer needed, it should be freed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-freeenvironmentstringsa">FreeEnvironmentStrings</a> function.
     * 
     * Note that the ANSI version of this function, <b>GetEnvironmentStringsA</b>, returns OEM characters.
     * @returns {PWSTR} If the function succeeds, the return value is a pointer to the environment block of the current process.
     * 
     * If the function fails, the return value is NULL.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-getenvironmentstringsw
     * @since windows5.1.2600
     */
    static GetEnvironmentStringsW() {
        result := DllCall("KERNEL32.dll\GetEnvironmentStringsW", "ptr")
        return result
    }

    /**
     * Frees a block of environment strings. (ANSI)
     * @remarks
     * If you used the ANSI version of <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nf-rrascfg-ieapproviderconfig-initialize">GetEnvironmentStrings</a>, be sure to use the ANSI version of <b>FreeEnvironmentStrings</b>. Similarly, if you used the Unicode version of <b>GetEnvironmentStrings</b>, be sure to use the Unicode version of <b>FreeEnvironmentStrings</b>.
     * @param {PSTR} penv A pointer to a block of environment strings. The pointer to the block must be obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nf-rrascfg-ieapproviderconfig-initialize">GetEnvironmentStrings</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-freeenvironmentstringsa
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
     * Frees a block of environment strings. (Unicode)
     * @remarks
     * If you used the ANSI version of <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nf-rrascfg-ieapproviderconfig-initialize">GetEnvironmentStrings</a>, be sure to use the ANSI version of <b>FreeEnvironmentStrings</b>. Similarly, if you used the Unicode version of <b>GetEnvironmentStrings</b>, be sure to use the Unicode version of <b>FreeEnvironmentStrings</b>.
     * @param {PWSTR} penv A pointer to a block of environment strings. The pointer to the block must be obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nf-rrascfg-ieapproviderconfig-initialize">GetEnvironmentStrings</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-freeenvironmentstringsw
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
     * Retrieves the contents of the specified variable from the environment block of the calling process. (GetEnvironmentVariableA)
     * @remarks
     * This function can retrieve either a system environment variable or a user environment variable.
     * @param {PSTR} lpName The name of the environment variable.
     * @param {PSTR} lpBuffer A pointer to a buffer that receives the contents of the specified environment variable as a null-terminated string. An environment variable has a maximum size limit of 32,767 characters, including the null-terminating character.
     * @param {Integer} nSize The size of the buffer pointed to by the *lpBuffer* parameter, including the null-terminating character, in characters.
     * @returns {Integer} If the function succeeds, the return value is the number of characters stored in the buffer pointed to by *lpBuffer*, not including the terminating null character.
     * 
     * If *lpBuffer* is not large enough to hold the data, the return value is the buffer size, in characters, required to hold the string and its terminating null character and the contents of *lpBuffer* are undefined.
     * 
     * If the function fails, the return value is zero. If the specified environment variable was not found in the environment block, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_ENVVAR_NOT_FOUND.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-getenvironmentvariablea
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
     * The GetEnvironmentVariableW (Unicode) function (processenv.h) retrieves the contents of the specified variable from the environment block of the calling process.
     * @remarks
     * This function can retrieve either a system environment variable or a user environment variable.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_ENVVAR_NOT_FOUND.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-getenvironmentvariablew
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
     * Sets the contents of the specified environment variable for the current process. (SetEnvironmentVariableA)
     * @remarks
     * This function has no effect on the system environment variables or the environment variables of other processes.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-setenvironmentvariablea
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
     * The SetEnvironmentVariableW (Unicode) function (processenv.h) sets the contents of the specified environment variable for the current process.
     * @remarks
     * This function has no effect on the system environment variables or the environment variables of other processes.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-setenvironmentvariablew
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
     * Expands environment-variable strings and replaces them with the values defined for the current user. (ANSI)
     * @remarks
     * The size of the <i>lpSrc</i> and <i>lpDst</i> buffers is limited to 32K.
     * 
     * To replace folder names in a fully qualified path with their associated environment-variable strings, use the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-pathunexpandenvstringsa">PathUnExpandEnvStrings</a> function.
     * 
     * To retrieve the list of environment variables for a process, use the <a href="https://docs.microsoft.com/windows/win32/api/processenv/nf-processenv-getenvironmentstrings">GetEnvironmentStrings</a> function.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-expandenvironmentstringsa
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
     * Expands environment-variable strings and replaces them with the values defined for the current user. (Unicode)
     * @remarks
     * The size of the <i>lpSrc</i> and <i>lpDst</i> buffers is limited to 32K.
     * 
     * To replace folder names in a fully qualified path with their associated environment-variable strings, use the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-pathunexpandenvstringsa">PathUnExpandEnvStrings</a> function.
     * 
     * To retrieve the list of environment variables for a process, use the <a href="https://docs.microsoft.com/windows/win32/api/processenv/nf-processenv-getenvironmentstrings">GetEnvironmentStrings</a> function.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-expandenvironmentstringsw
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
     * Changes the current directory for the current process.
     * @remarks
     * Each process has a single current directory made up of two parts:
     * 
     * <ul>
     * <li>A disk designator that is either a drive letter followed by a colon, or a server name and share name (&#92;&#92;<i>servername</i>&#92;<i>sharename</i>)</li>
     * <li>A directory on the disk designator</li>
     * </ul>
     * 
     * The current directory is shared by all threads of the process:
     * If one thread changes the current directory, it affects all threads
     * in the process.
     * Multithreaded applications and shared library code should avoid
     * calling the <b>SetCurrentDirectory</b> function due to the risk of
     * affecting relative path calculations being performed by other threads.
     * Conversely,
     * multithreaded applications and shared library code should avoid
     * using relative paths so that they are unaffected by changes to the
     * current directory performed by other threads.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} lpPathName The path to the new current directory. This parameter may specify a relative path or a full path. In either case, the full path of the specified directory is calculated and stored as the current directory. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">File Names, Paths, and Namespaces</a>.
     * 
     * In the ANSI version of this function, the name is limited to <b>MAX_PATH</b> characters. 
     * 
     *  The final character before the null character must be a backslash ('\\'). If you do not specify the backslash, it will be added for you; therefore, specify <b>MAX_PATH</b>-2 characters for the path unless you  include the trailing backslash, in which case, specify <b>MAX_PATH</b>-1 characters for the path.
     * 
     * <div class="alert"><b>Tip</b>  Starting with Windows 10, version 1607, for the unicode version of this function (<b>SetCurrentDirectoryW</b>), you can opt-in to remove the <b>MAX_PATH</b> limitation. See the "Maximum Path Length Limitation" section of <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming Files, Paths, and Namespaces</a> for details.</div>
     * <div> </div>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcurrentdirectory
     */
    static SetCurrentDirectoryA(lpPathName) {
        lpPathName := lpPathName is String ? StrPtr(lpPathName) : lpPathName

        result := DllCall("KERNEL32.dll\SetCurrentDirectoryA", "ptr", lpPathName, "int")
        return result
    }

    /**
     * Changes the current directory for the current process.
     * @remarks
     * Each process has a single current directory made up of two parts:
     * 
     * <ul>
     * <li>A disk designator that is either a drive letter followed by a colon, or a server name and share name (&#92;&#92;<i>servername</i>&#92;<i>sharename</i>)</li>
     * <li>A directory on the disk designator</li>
     * </ul>
     * 
     * The current directory is shared by all threads of the process:
     * If one thread changes the current directory, it affects all threads
     * in the process.
     * Multithreaded applications and shared library code should avoid
     * calling the <b>SetCurrentDirectory</b> function due to the risk of
     * affecting relative path calculations being performed by other threads.
     * Conversely,
     * multithreaded applications and shared library code should avoid
     * using relative paths so that they are unaffected by changes to the
     * current directory performed by other threads.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} lpPathName The path to the new current directory. This parameter may specify a relative path or a full path. In either case, the full path of the specified directory is calculated and stored as the current directory. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">File Names, Paths, and Namespaces</a>.
     * 
     * In the ANSI version of this function, the name is limited to <b>MAX_PATH</b> characters. 
     * 
     *  The final character before the null character must be a backslash ('\\'). If you do not specify the backslash, it will be added for you; therefore, specify <b>MAX_PATH</b>-2 characters for the path unless you  include the trailing backslash, in which case, specify <b>MAX_PATH</b>-1 characters for the path.
     * 
     * <div class="alert"><b>Tip</b>  Starting with Windows 10, version 1607, for the unicode version of this function (<b>SetCurrentDirectoryW</b>), you can opt-in to remove the <b>MAX_PATH</b> limitation. See the "Maximum Path Length Limitation" section of <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming Files, Paths, and Namespaces</a> for details.</div>
     * <div> </div>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcurrentdirectory
     */
    static SetCurrentDirectoryW(lpPathName) {
        lpPathName := lpPathName is String ? StrPtr(lpPathName) : lpPathName

        result := DllCall("KERNEL32.dll\SetCurrentDirectoryW", "ptr", lpPathName, "int")
        return result
    }

    /**
     * Retrieves the current directory for the current process.
     * @remarks
     * Each process has a single current directory that consists of two parts:
     * 
     * <ul>
     * <li>A disk designator that is either a drive letter followed by a colon, or a server name followed by a share 
     *       name (&#92;&#92;<i>servername</i>&#92;<i>sharename</i>)</li>
     * <li>A directory on the disk designator</li>
     * </ul>
     * To set the current directory, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcurrentdirectory">SetCurrentDirectory</a> function.
     * 
     * Multithreaded applications and shared library code should not use the   
     *     <b>GetCurrentDirectory</b> function and should avoid using relative path names. The current directory state written by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcurrentdirectory">SetCurrentDirectory</a> function is stored as a global variable in each process, therefore multithreaded applications cannot reliably use this value without possible data corruption from other threads that may also be reading or setting this value. This limitation also applies to the <b>SetCurrentDirectory</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfullpathnamea">GetFullPathName</a> functions. The exception being when the application is guaranteed to be running in a single thread, for example parsing file names from the command line argument string in the main thread prior to creating any additional threads. Using relative path names in multithreaded applications or shared library code can yield unpredictable results and is not supported.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} nBufferLength The length of the buffer for the current directory string, in <b>TCHARs</b>. The 
     *       buffer length must include room for a terminating null character.
     * @param {PSTR} lpBuffer A pointer to the buffer that receives the current directory string. This null-terminated string specifies the 
     *        absolute path to the current directory.
     * 
     * To determine the required buffer size, set this parameter to <b>NULL</b> and the 
     *        <i>nBufferLength</i> parameter to 0.
     * @returns {Integer} If the function succeeds, the return value specifies the number of characters that are written to the buffer, 
     *        not including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the buffer that is pointed to by <i>lpBuffer</i> is not large enough, the return value 
     *        specifies the required size of the buffer, in characters, including the null-terminating character.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcurrentdirectory
     */
    static GetCurrentDirectoryA(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\GetCurrentDirectoryA", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * Retrieves the current directory for the current process.
     * @remarks
     * Each process has a single current directory that consists of two parts:
     * 
     * <ul>
     * <li>A disk designator that is either a drive letter followed by a colon, or a server name followed by a share 
     *       name (&#92;&#92;<i>servername</i>&#92;<i>sharename</i>)</li>
     * <li>A directory on the disk designator</li>
     * </ul>
     * To set the current directory, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcurrentdirectory">SetCurrentDirectory</a> function.
     * 
     * Multithreaded applications and shared library code should not use the   
     *     <b>GetCurrentDirectory</b> function and should avoid using relative path names. The current directory state written by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcurrentdirectory">SetCurrentDirectory</a> function is stored as a global variable in each process, therefore multithreaded applications cannot reliably use this value without possible data corruption from other threads that may also be reading or setting this value. This limitation also applies to the <b>SetCurrentDirectory</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfullpathnamea">GetFullPathName</a> functions. The exception being when the application is guaranteed to be running in a single thread, for example parsing file names from the command line argument string in the main thread prior to creating any additional threads. Using relative path names in multithreaded applications or shared library code can yield unpredictable results and is not supported.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} nBufferLength The length of the buffer for the current directory string, in <b>TCHARs</b>. The 
     *       buffer length must include room for a terminating null character.
     * @param {PWSTR} lpBuffer A pointer to the buffer that receives the current directory string. This null-terminated string specifies the 
     *        absolute path to the current directory.
     * 
     * To determine the required buffer size, set this parameter to <b>NULL</b> and the 
     *        <i>nBufferLength</i> parameter to 0.
     * @returns {Integer} If the function succeeds, the return value specifies the number of characters that are written to the buffer, 
     *        not including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the buffer that is pointed to by <i>lpBuffer</i> is not large enough, the return value 
     *        specifies the required size of the buffer, in characters, including the null-terminating character.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcurrentdirectory
     */
    static GetCurrentDirectoryW(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\GetCurrentDirectoryW", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * Determines whether the current directory should be included in the search path for the specified executable. (ANSI)
     * @remarks
     * This function should only be called in instances where the caller must explicitly resolve a relative executable name to an absolute name.  If <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> is called with a relative executable name, it will automatically search for the executable, calling  this function to determine the search path.
     * 
     * Most system functions perform their own path resolution, therefore, this function should only be called if you are attempting to resolve a search path for the specified executable based on the current directory.
     * 
     * The value of the NoDefaultCurrentDirectoryInExePath environment variable determines the value this function returns. However, you should call this function rather than checking the environment variable directly, as the registry location of this environment variable can change.
     * 
     * If the value of the <i>ExeName</i> parameter contains a backslash (\\), this function will always return TRUE. If it does not contain a backslash, the existence of the NoDefaultCurrentDirectoryInExePath environment variable is checked, and not its value.
     * 
     * An example of an instance when this function should be called instead of relying on the default search path resolution algorithm in <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> is the "cmd.exe" executable. It calls this function to determine the command search path because it does its own path resolution before calling <b>CreateProcess</b>.  If this function returns TRUE, cmd.exe uses the path ".;%PATH%" for the executable search. If it returns FALSE, cmd.exe uses the path "%PATH%" for the search.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The processenv.h header defines NeedCurrentDirectoryForExePath as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} ExeName The name of the executable file.
     * @returns {BOOL} If the current directory should be part of the search path, the return value is TRUE. Otherwise, the return value is FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-needcurrentdirectoryforexepatha
     * @since windows6.0.6000
     */
    static NeedCurrentDirectoryForExePathA(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\NeedCurrentDirectoryForExePathA", "ptr", ExeName, "int")
        return result
    }

    /**
     * Determines whether the current directory should be included in the search path for the specified executable. (Unicode)
     * @remarks
     * This function should only be called in instances where the caller must explicitly resolve a relative executable name to an absolute name.  If <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> is called with a relative executable name, it will automatically search for the executable, calling  this function to determine the search path.
     * 
     * Most system functions perform their own path resolution, therefore, this function should only be called if you are attempting to resolve a search path for the specified executable based on the current directory.
     * 
     * The value of the NoDefaultCurrentDirectoryInExePath environment variable determines the value this function returns. However, you should call this function rather than checking the environment variable directly, as the registry location of this environment variable can change.
     * 
     * If the value of the <i>ExeName</i> parameter contains a backslash (\\), this function will always return TRUE. If it does not contain a backslash, the existence of the NoDefaultCurrentDirectoryInExePath environment variable is checked, and not its value.
     * 
     * An example of an instance when this function should be called instead of relying on the default search path resolution algorithm in <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> is the "cmd.exe" executable. It calls this function to determine the command search path because it does its own path resolution before calling <b>CreateProcess</b>.  If this function returns TRUE, cmd.exe uses the path ".;%PATH%" for the executable search. If it returns FALSE, cmd.exe uses the path "%PATH%" for the search.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The processenv.h header defines NeedCurrentDirectoryForExePath as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} ExeName The name of the executable file.
     * @returns {BOOL} If the current directory should be part of the search path, the return value is TRUE. Otherwise, the return value is FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-needcurrentdirectoryforexepathw
     * @since windows6.0.6000
     */
    static NeedCurrentDirectoryForExePathW(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\NeedCurrentDirectoryForExePathW", "ptr", ExeName, "int")
        return result
    }

    /**
     * Retrieves the environment variables for the specified user. This block can then be passed to the CreateProcessAsUser function.
     * @remarks
     * To free the buffer when you have finished with the environment block, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-destroyenvironmentblock">DestroyEnvironmentBlock</a> function.
     * 
     * If the environment block is passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a>, you must also specify the <b>CREATE_UNICODE_ENVIRONMENT</b> flag. After <b>CreateProcessAsUser</b> has returned, the new process has a copy of the environment block, and <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-destroyenvironmentblock">DestroyEnvironmentBlock</a> can be safely called.
     * 
     * User-specific environment variables such as %USERPROFILE% are set only when the user's profile is loaded. To load a user's profile, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-loaduserprofilea">LoadUserProfile</a> function.
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
     * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-createenvironmentblock
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
     * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-destroyenvironmentblock
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
     * Expands the source string by using the environment block established for the specified user. (ANSI)
     * @remarks
     * The following is an example source string:
     * 
     * 
     * ```
     * %USERPROFILE%\ntuser.dat
     * ```
     * 
     * 
     * When <b>ExpandEnvironmentStringsForUser</b> returns, the destination string expands as follows:
     * 
     * 
     * ```
     * C:\Documents and Settings\UserName\ntuser.dat
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The userenv.h header defines ExpandEnvironmentStringsForUser as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
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
     * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-expandenvironmentstringsforusera
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
     * Expands the source string by using the environment block established for the specified user. (Unicode)
     * @remarks
     * The following is an example source string:
     * 
     * 
     * ```
     * %USERPROFILE%\ntuser.dat
     * ```
     * 
     * 
     * When <b>ExpandEnvironmentStringsForUser</b> returns, the destination string expands as follows:
     * 
     * 
     * ```
     * C:\Documents and Settings\UserName\ntuser.dat
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The userenv.h header defines ExpandEnvironmentStringsForUser as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
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
     * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-expandenvironmentstringsforuserw
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
     * @remarks
     * **ENCLAVE_TYPE_SGX2** will change a few things about how the OS handles SGX functionality:
     * 
     * * It will support the new extensions to **VirtualAlloc**, **VirtualFree**, and **VirtualProtect**.
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
     * <td width="40%"><a id="ENCLAVE_TYPE_SGX2"></a><a id="enclave_type_sgx2"></a><dl>
     * <dt><b>ENCLAVE_TYPE_SGX2</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Supports SGX2 and SGX1 enclaves. The platform and OS support SGX2 instructions with EDMM on this platform (in addition to other SGX2 constructs).
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>. The following error codes also apply for this function.
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
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-isenclavetypesupported
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
     * @remarks
     * To load data into an enclave after you create it, call <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-loadenclavedata">LoadEnclaveData</a>. To initialize the enclave after you load the data, call <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-initializeenclave">InitializeEnclave</a>.
     * 
     * <b>Windows 10, version 1709:  </b>To delete the enclave when you finish using it, call <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-deleteenclave">DeleteEnclave</a>. You cannot delete a VBS enclave by calling the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfree">VirtualFree</a> or <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfreeex">VirtualFreeEx</a> function. You can still delete an SGX enclave by calling <b>VirtualFree</b> or <b>VirtualFreeEx</b>.
     * 
     * <b>Windows 10, version 1507, Windows 10, version 1511, Windows 10, version 1607 and Windows 10, version 1703:  </b>To delete the enclave when you finish using it, call the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfree">VirtualFree</a> or <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfreeex">VirtualFreeEx</a> function and specify the following values:
     * 
     * <ul>
     * <li>The base address of the enclave for the <i>lpAddress</i> parameter.</li>
     * <li>0 for the <i>dwSize</i> parameter.</li>
     * <li><b>MEM_RELEASE</b> for the <i>dwFreeType</i> parameter. The <b>MEM_DECOMMIT</b> value is not supported for enclaves.</li>
     * </ul>
     * 
     * 
     * For information about the Intel Software Guard Extensions (SGX) architecture extension, see <a href="https://software.intel.com/sgx">Intel Software Guard Extensions</a>.
     * @param {HANDLE} hProcess A handle to the process for which you want to create an enclave.
     * @param {Pointer<Void>} lpAddress The preferred base address of the enclave. Specify **NULL** to have the operating system assign the base address.
     * @param {Pointer} dwSize The size of the enclave that you want to create, including the size of the code that you will load into the enclave, in bytes.
     * 
     * VBS enclaves must be a multiple of 2 MB in size.
     * 
     * SGX enclaves must be a power of 2 in size and must have their base aligned to the same power of 2 as the size, with a minimum alignment of 2 MB. As an example, if the enclave is 128 MB, then its base must be aligned to a 128 MB boundary.
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
     * <td width="40%"><a id="ENCLAVE_TYPE_SGX2"></a><a id="enclave_type_sgx2"></a><dl>
     * <dt><b><b>ENCLAVE_TYPE_SGX2</b></b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports SGX2 and SGX1 enclaves. The platform and OS support SGX2 instructions with EDMM on this platform (in addition to other SGX2 constructs).
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
     * For the **ENCLAVE_TYPE_SGX** and **ENCLAVE_TYPE_SGX2** enclave types, you must specify a pointer to an [ENCLAVE_CREATE_INFO_SGX](/windows/win32/api/winnt/ns-winnt-enclave_create_info_sgx) structure.
     * 
     * For the **ENCLAVE_TYPE_VBS** enclave type, you must specify a pointer to an [ENCLAVE_CREATE_INFO_VBS](/windows/win32/api/winnt/ns-winnt-enclave_create_info_vbs) structure.
     * @param {Integer} dwInfoLength The length of the structure that the _lpEnclaveInformation_ parameter points to, in bytes. For the **ENCLAVE_TYPE_SGX** and **ENCLAVE_TYPE_SGX2** enclave types, this value must be 4096.  For the **ENCLAVE_TYPE_VBS** enclave type, this value must be `sizeof(ENCLAVE_CREATE_INFO_VBS)`, which is 36 bytes.
     * @param {Pointer<Integer>} lpEnclaveError An optional pointer to  a variable that receives an enclave error code that is architecture-specific. For the **ENCLAVE_TYPE_SGX**, **ENCLAVE_TYPE_SGX2** and **ENCLAVE_TYPE_VBS**  enclave types, the _lpEnclaveError_ parameter is not used.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the base address of the created enclave.
     * 
     * If the function fails, the return value is **NULL**. To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * For a list of common error codes, see [System Error Codes](/windows/win32/Debug/system-error-codes). The following error codes also apply for this function.
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
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-createenclave
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
     * @remarks
     * To initialize the enclave after you load data into the enclave, call [InitializeEnclave](/windows/win32/api/enclaveapi/nf-enclaveapi-initializeenclave).
     * 
     * **LoadEnclaveData** is only supported enclaves that have the **ENCLAVE_TYPE_SGX** and **ENCLAVE_TYPE_SGX2** enclave types.
     * @param {HANDLE} hProcess A handle to the process for which the enclave was created.
     * @param {Pointer<Void>} lpAddress The address in the enclave where you want to load the data.
     * @param {Pointer} lpBuffer A pointer to the data the you want to load into the enclave.
     * @param {Pointer} nSize The size of the data that you want to load into the enclave, in bytes. This value must be a whole-number multiple of the page size.
     * @param {Integer} flProtect The memory protection to use for the pages that you want to add to the enclave. For a list of memory protection values, see [memory protection constants](/windows/win32/Memory/memory-protection-constants). This value must not include the following constants:
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
     * @param {Pointer} lpPageInformation A pointer to information that describes the pages that you want to add to the enclave. The _lpPageInformation_ parameter is not used.
     * @param {Integer} dwInfoLength The length of the structure that the _lpPageInformation_ parameter points to, in bytes. This value must be 0.
     * @param {Pointer<Pointer>} lpNumberOfBytesWritten A pointer to a variable that receives the number of bytes that **LoadEnclaveData** copied into the enclave.
     * @param {Pointer<Integer>} lpEnclaveError An optional pointer to  a variable that receives an enclave error code that is architecture-specific. The _lpEnclaveError_ parameter is not used.
     * @returns {BOOL} If all of the data is loaded into the enclave successfully, the return value is nonzero. Otherwise, the return value is zero. To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * For a list of common error codes, see [System Error Codes](/windows/win32/Debug/system-error-codes). The following error codes also apply for this function.
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
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-loadenclavedata
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
     * @remarks
     * To create an enclave, use the [CreateEnclave](nf-enclaveapi-createenclave.md) function. To load data into the enclave before you initialize it, use the [LoadEnclaveData](nf-enclaveapi-loadenclavedata.md) function.
     * 
     * **Windows 10, version 1709 and later and Windows 11:** To delete the enclave when you finish using it, call [DeleteEnclave](nf-enclaveapi-deleteenclave.md). You cannot delete a VBS enclave by calling the [VirtualFree](../memoryapi/nf-memoryapi-virtualfree.md) or [VirtualFreeEx](../memoryapi/nf-memoryapi-virtualfreeex.md) function. You can still delete an SGX enclave by calling **VirtualFree** or **VirtualFreeEx**.
     * 
     * **Windows 10, version 1507, Windows 10, version 1511, Windows 10, version 1607 and Windows 10, version 1703:** To delete the enclave when you finish using it, call the [VirtualFree](../memoryapi/nf-memoryapi-virtualfree.md) or [VirtualFreeEx](../memoryapi/nf-memoryapi-virtualfreeex.md) function and specify the following values:
     * 
     * - The base address of the enclave for the _lpAddress_ parameter.
     * - 0 for the _dwSize_ parameter.
     * - **MEM_RELEASE** for the _dwFreeType_ parameter.
     * @param {HANDLE} hProcess A handle to the process for which the enclave was created.
     * @param {Pointer<Void>} lpAddress Any address within the enclave.
     * @param {Pointer} lpEnclaveInformation A pointer to architecture-specific information to use to initialize the enclave.
     * 
     * For the **ENCLAVE_TYPE_SGX** and **ENCLAVE_TYPE_SGX2** enclave types, specify a pointer to an [ENCLAVE_INIT_INFO_SGX](/windows/win32/api/winnt/ns-winnt-enclave_init_info_sgx) structure.
     * 
     * For the **ENCLAVE_TYPE_VBS** enclave type, specify a pointer to an [ENCLAVE_INIT_INFO_VBS](/windows/desktop/api/winnt/ns-winnt-enclave_init_info_vbs) structure.
     * @param {Integer} dwInfoLength The length of the structure that the _lpEnclaveInformation_ parameter points to, in bytes. For the **ENCLAVE_TYPE_SGX** and **ENCLAVE_TYPE_SGX2** enclave types, this value must be 4096. For the **ENCLAVE_TYPE_VBS** enclave type, this value must be `sizeof(ENCLAVE_INIT_INFO_VBS)`, which is 8 bytes.
     * @param {Pointer<Integer>} lpEnclaveError An optional pointer to  a variable that receives an enclave error code that is architecture-specific.
     * 
     * For the **ENCLAVE_TYPE_SGX** and **ENCLAVE_TYPE_SGX2** enclave types, the _lpEnclaveError_ parameter contains the error that the EINIT instruction generated if the function fails and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **ERROR_ENCLAVE_FAILURE**.
     * 
     * For the **ENCLAVE_TYPE_VBS** enclave type, the _lpEnclaveError_ parameter  is not used.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * For a list of common error codes, see [System Error Codes](/windows/win32/Debug/system-error-codes). The following error codes also apply for this function.
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
     * An failure specific to the underlying enclave architecture occurred. The value for the <i>lpEnclaveError</i> parameter contains the architecture-specific error.
     * 
     * For the <b>ENCLAVE_TYPE_SGX</b> and <b>ENCLAVE_TYPE_SGX2</b> enclave types, the EINIT instruction that the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-enclave_init_info_sgx">ENCLAVE_INIT_INFO_SGX</a> structure specified generated an error. The value of the <i>lpEnclaveError</i> parameter contains the error that the instruction generated.
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
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-initializeenclave
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
     * Loads an image and all of its imports into an enclave. (ANSI)
     * @remarks
     * <b>LoadEnclaveImage</b> is only supported enclaves that have  the <b>ENCLAVE_TYPE_VBS</b> enclave type.
     * @param {Pointer<Void>} lpEnclaveAddress The base address of the image into which to load the image.
     * @param {PSTR} lpImageName A NULL-terminated string that contains the name of the image to load.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise <b>FALSE</b>.  
     * 
     * To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-loadenclaveimagea
     */
    static LoadEnclaveImageA(lpEnclaveAddress, lpImageName) {
        lpImageName := lpImageName is String ? StrPtr(lpImageName) : lpImageName

        lpEnclaveAddressMarshal := lpEnclaveAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-core-enclave-l1-1-1.dll\LoadEnclaveImageA", lpEnclaveAddressMarshal, lpEnclaveAddress, "ptr", lpImageName, "int")
        return result
    }

    /**
     * Loads an image and all of its imports into an enclave. (Unicode)
     * @remarks
     * <b>LoadEnclaveImage</b> is only supported enclaves that have  the <b>ENCLAVE_TYPE_VBS</b> enclave type.
     * @param {Pointer<Void>} lpEnclaveAddress The base address of the image into which to load the image.
     * @param {PWSTR} lpImageName A NULL-terminated string that contains the name of the image to load.
     * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise <b>FALSE</b>.  To get extended error information, 
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-loadenclaveimagew
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
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-callenclave
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
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-terminateenclave
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
     *        call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. 
     * 
     * For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>. The following error codes also apply for this function.
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
     * The execution of threads running with the enclave was not ended, because either <a href="https://docs.microsoft.com/windows/desktop/api/enclaveapi/nf-enclaveapi-terminateenclave">TerminateEnclave</a> was not called, or the execution of the threads has not yet ended in response to an earlier call to <b>TerminateEnclave</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/enclaveapi/nf-enclaveapi-deleteenclave
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
     * @remarks
     * <b>EnclaveGetAttestationReport</b> must be called from within an enclave.
     * 
     * <b>EnclaveGetAttestationReport</b> is not currently supported for enclaves with a type of <b>ENCLAVE_TYPE_SGX</b>. For VBS enclaves, the report that <b>EnclaveGetAttestationReport</b> gets is signed by using a VBS-specific key.
     * 
     * The enclave attestation report contains the identity of all code loaded into the enclave, as well as policies that control how the enclave is running, such as whether the enclave is running with debugger access active. The report also includes a small amount of information that the enclave generated to use in a key-exchange protocol.
     * 
     * The report that <b>EnclaveGetAttestationReport</b> generates consists of the following items:
     * 
     * <ul>
     * <li>
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntenclv/ns-ntenclv-vbs_enclave_report_pkg_header">VBS_ENCLAVE_REPORT_PKG_HEADER</a> structure
     * 
     * </li>
     * <li>
     * A signed statement that consist of the following items:
     * 
     * <ul>
     * <li>
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntenclv/ns-ntenclv-vbs_enclave_report">VBS_ENCLAVE_REPORT</a> structure
     * 
     * </li>
     * <li>
     * Zero or more variable data blocks that consist of the following items:
     * 
     * <ul>
     * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/ntenclv/ns-ntenclv-vbs_enclave_report_vardata_header">VBS_ENCLAVE_REPORT_VARDATA_HEADER</a> structure</li>
     * <li>Data described by the <a href="https://docs.microsoft.com/windows/desktop/api/ntenclv/ns-ntenclv-vbs_enclave_report_vardata_header">VBS_ENCLAVE_REPORT_VARDATA_HEADER</a> structure</li>
     * </ul>
     * </li>
     * </ul>
     * </li>
     * <li>A signature</li>
     * </ul>
     * The enclave attestation report provide proof that specific code is running with an enclave.  If a validating entity  also obtains proof that the host system is running with VBS turned on, that entity can use that proof in conjunction with the enclave attestation report to verify that a specific enclave, populated with specific code, has been loaded.
     * @param {Pointer<Integer>} EnclaveData A pointer to a 64-byte buffer of data that the enclave wants to insert into its signed report.  For example, this buffer could include a 256-bit nonce that the relying party supplied, followed by a SHA-256 hash of additional data that the enclave wants to convey, such as a public key that corresponds to a private key that the enclave owns.  If this parameter is NULL, the corresponding field of the report is  filled with zeroes.
     * @param {Pointer} Report A pointer to a buffer where the report should be placed.  This report may be stored either within the address range of the enclave or within the address space of the host process.  Specify NULL to indicate that only the size of the buffer required for the output should be calculated, and not the report itself.
     * @param {Integer} BufferSize The size of the buffer to which the <i>Report</i> parameter points.  If <i>Report</i> is NULL, <i>BufferSize</i> must be zero.  If <i>Report</i> is not NULL, and if the size of the report is larger than this value, an error is returned.
     * @returns {Integer} A pointer to a variable that receives the size of the report.
     * @see https://learn.microsoft.com/windows/win32/api/winenclaveapi/nf-winenclaveapi-enclavegetattestationreport
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
     * @remarks
     * This function is used if two enclaves run on the same system and need to establish a secure channel between one another.  When you call <b>EnclaveVerifyAttestationReport</b> from a virtualization-based security (VBS) enclave, you can only use <b>EnclaveVerifyAttestationReport</b> to validate an attestation report that another VBS enclave generated.
     * 
     * <b>EnclaveVerifyAttestationReport</b> must be called from within an enclave, and is only supported within enclaves that have the  <b>ENCLAVE_TYPE_VBS</b> enclave type.
     * @param {Integer} EnclaveType The type of the enclave for which the report was generated. Must be <b>ENCLAVE_TYPE_VBS</b>.
     * @param {Pointer} Report A pointer to a buffer that stores the report.  This report may be stored either within the address range of the enclave or within the address space of the host process.
     * @param {Integer} ReportSize The size of the report, in bytes.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/winenclaveapi/nf-winenclaveapi-enclaveverifyattestationreport
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
     * @remarks
     * <b>EnclaveSealData</b> must be called from within an enclave, and is only supported within enclaves that have the  <b>ENCLAVE_TYPE_VBS</b> enclave type.
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
     * @see https://learn.microsoft.com/windows/win32/api/winenclaveapi/nf-winenclaveapi-enclavesealdata
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
     * @remarks
     * The enclave that calls <b>EnclaveUnsealData</b> must meet the criteria that correspond to the value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntenclv/ne-ntenclv-enclave_sealing_identity_policy">ENCLAVE_SEALING_IDENTITY_POLICY</a> that was specified by the enclave that sealed the data by calling <a href="https://docs.microsoft.com/windows/desktop/api/winenclaveapi/nf-winenclaveapi-enclavesealdata">EnclaveSealData</a>.
     * 
     * <b>EnclaveUnsealData</b> must be called from within an enclave, and is only supported within enclaves that have the  <b>ENCLAVE_TYPE_VBS</b> enclave type.
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
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/winenclaveapi/nf-winenclaveapi-enclaveunsealdata
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
     * @remarks
     * <b>EnclaveGetEnclaveInformation</b> must be called from within an enclave, and is only supported within enclaves that have the  <b>ENCLAVE_TYPE_VBS</b> enclave type.
     * @param {Integer} InformationSize The size of the <a href="https://docs.microsoft.com/windows/desktop/api/ntenclv/ns-ntenclv-enclave_information">ENCLAVE_INFORMATION</a> structure that the <i>EnclaveInformation</i> parameter points to, in bytes.
     * @param {Pointer} EnclaveInformation Information about the currently executing enclave.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/winenclaveapi/nf-winenclaveapi-enclavegetenclaveinformation
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
