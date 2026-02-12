#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DiagnosticInvoker.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IDiagnosticInvokerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiagnosticInvokerStatics
     * @type {Guid}
     */
    static IID => Guid("{5cfad8de-f15c-4554-a813-c113c3881b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefault", "GetForUser", "get_IsSupported"]

    /**
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * Retrieves the default configuration for the specified communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {DiagnosticInvoker} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getdefaultcommconfigw
     */
    GetDefault() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DiagnosticInvoker(result_)
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {DiagnosticInvoker} 
     */
    GetForUser(user_) {
        result := ComCall(7, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DiagnosticInvoker(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
