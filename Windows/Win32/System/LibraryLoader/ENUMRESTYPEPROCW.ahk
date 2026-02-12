#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the EnumResourceTypes and EnumResourceTypesEx functions. (Unicode)
 * @remarks
 * If <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpszType</i>) is <b>TRUE</b>, then <i>lpszType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
 * 
 * An application must register this function by passing its address to the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a> or <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcetypesexa">EnumResourceTypesEx</a> function. 
 * 
 * If the callback function returns <b>FALSE</b>, then <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a> or <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcetypesexa">EnumResourceTypesEx</a> will stop enumeration and return <b>FALSE</b>. On Windows XP and earlier the value obtained from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will be <b>ERROR_SUCCESS</b>; starting with Windows Vista, the last error value will be <b>ERROR_RESOURCE_ENUM_USER_STOP</b>.
 * 
 * > [!NOTE]
 * > The libloaderapi.h header defines ENUMRESTYPEPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/libloaderapi/nc-libloaderapi-enumrestypeprocw
 * @namespace Windows.Win32.System.LibraryLoader
 * @version v4.0.30319
 * @charset Unicode
 */
class ENUMRESTYPEPROCW extends IUnknown {

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
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HMODULE} hModule_ 
     * @param {PWSTR} lpType 
     * @param {Pointer} lParam_ 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hModule_, lpType, lParam_) {
        hModule_ := hModule_ is Win32Handle ? NumGet(hModule_, "ptr") : hModule_
        lpType := lpType is String ? StrPtr(lpType) : lpType

        result := ComCall(3, this, "ptr", hModule_, "ptr", lpType, "ptr", lParam_, "int")
        return result
    }
}
