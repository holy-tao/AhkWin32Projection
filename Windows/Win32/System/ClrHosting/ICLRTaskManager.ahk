#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICLRTask.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRTaskManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRTaskManager
     * @type {Guid}
     */
    static IID => Guid("{4862efbe-3ae5-44f8-8feb-346190ee8a34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTask", "GetCurrentTask", "SetUILocale", "SetLocale", "GetCurrentTaskType"]

    /**
     * 
     * @returns {ICLRTask} 
     */
    CreateTask() {
        result := ComCall(3, this, "ptr*", &pTask := 0, "HRESULT")
        return ICLRTask(pTask)
    }

    /**
     * 
     * @returns {ICLRTask} 
     */
    GetCurrentTask() {
        result := ComCall(4, this, "ptr*", &pTask := 0, "HRESULT")
        return ICLRTask(pTask)
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetUILocale(lcid) {
        result := ComCall(5, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * Sets an item of information in the user override portion of the current locale. This function does not set the system defaults. (ANSI)
     * @remarks
     * This function writes to the registry, where it sets values that are associated with a particular user instead of a particular application. These registry values affect the behavior of other applications run by the user. As a rule, an application should call this function only when the user has explicitly requested the changes. The registry settings should not be changed for the convenience of a single application.
     * 
     * For the <i>LCType</i> parameter, the application should set <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-use-cp-acp">LOCALE_USE_CP_ACP</a> to use the operating system ANSI code page instead of the locale code page for string translation.
     * 
     * When the ANSI version of this function is used with a Unicode-only locale identifier, the function can succeed because the operating system uses the system code page. However, characters that are undefined in the system code page appear in the string as a question mark (?). 
     * 
     * As of Windows Vista, the <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-sdate">LOCALE_SDATE</a> and <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-stime-constants">LOCALE_STIME</a> constants are obsolete. Do not use these constants. Use <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-sshortdate">LOCALE_SSHORTDATE</a> and <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-stime-constants">LOCALE_STIMEFORMAT</a> instead. A custom locale might not have a single, uniform separator character within the date or time format: for example, a format such as "12/31, 2006" or "03:56'23" might be valid.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winnls.h header defines SetLocaleInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} lcid 
     * @returns {HRESULT} Returns a nonzero value if successful, or 0 otherwise. To get extended error information, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which can return one of the following error codes:
     * 
     * <ul>
     * <li>ERROR_ACCESS_DISABLED_BY_POLICY. The group policy of the computer or the user has forbidden this operation.</li>
     * <li>ERROR_INVALID_ACCESS. The access code was invalid.</li>
     * <li>ERROR_INVALID_FLAGS. The values supplied for flags were not valid.</li>
     * <li>ERROR_INVALID_PARAMETER. Any of the parameter values was invalid.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setlocaleinfoa
     */
    SetLocale(lcid) {
        result := ComCall(6, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentTaskType() {
        result := ComCall(7, this, "int*", &pTaskType := 0, "HRESULT")
        return pTaskType
    }
}
