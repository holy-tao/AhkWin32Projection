#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Policies
 * @version WindowsRuntime 1.4
 */
class INamedPolicyData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamedPolicyData
     * @type {Guid}
     */
    static IID => Guid("{38dcb198-95ac-4077-a643-8078cae26400}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Area", "get_Name", "get_Kind", "get_IsManaged", "get_IsUserPolicy", "get_User", "GetBoolean", "GetBinary", "GetInt32", "GetInt64", "GetString", "add_Changed", "remove_Changed"]

    /**
     * @type {HSTRING} 
     */
    Area {
        get => this.get_Area()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {Boolean} 
     */
    IsManaged {
        get => this.get_IsManaged()
    }

    /**
     * @type {Boolean} 
     */
    IsUserPolicy {
        get => this.get_IsUserPolicy()
    }

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Area() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsManaged() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserPolicy() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    GetBoolean() {
        result := ComCall(12, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Determines whether a file is an executable (.exe) file, and if so, which subsystem runs the executable file. (Unicode)
     * @remarks
     * As an alternative, you can obtain the same information by calling the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetfileinfoa">SHGetFileInfo</a> function, passing the 
     *     <b>SHGFI_EXETYPE</b> flag in the <i>uFlags</i> parameter.
     * 
     * Symbolic link behavior—If the path points to a symbolic link, the target file is 
     *     used.
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
     *  
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetBinaryType as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getbinarytypew
     */
    GetBinary() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInt32() {
        result := ComCall(14, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInt64() {
        result := ComCall(15, this, "int64*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * GetString Method Example (VC++)
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getstring-method-example-vc
     */
    GetString() {
        result_ := HSTRING()
        result := ComCall(16, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TypedEventHandler<NamedPolicyData, IInspectable>} changedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(changedHandler) {
        cookie := EventRegistrationToken()
        result := ComCall(17, this, "ptr", changedHandler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Changed(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(18, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
