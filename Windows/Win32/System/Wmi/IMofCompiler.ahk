#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IMofCompiler interface, implemented by Mofd.dll, provides a COM interface that is used by the Managed Object Format (MOF) compiler and any other applications that compile MOF files.
 * @remarks
 * 
 * <b>Windows 8:  </b>When installing a provider the <b>IMofCompiler</b> interface treats the [Key] and [Static] qualifiers as true if they are present, regardless of their actual values. Other qualifiers are treated as false if they are present but not explicitly set to true.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-imofcompiler
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IMofCompiler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMofCompiler
     * @type {Guid}
     */
    static IID => Guid("{6daf974e-2e37-11d2-aec9-00c04fb68820}")

    /**
     * The class identifier for MofCompiler
     * @type {Guid}
     */
    static CLSID => Guid("{6daf9757-2e37-11d2-aec9-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompileFile", "CompileBuffer", "CreateBMOF"]

    /**
     * The IMofCompiler::CompileFile method compiles a MOF file (including binary MOFs) and stores the information in the WMI repository.
     * @param {PWSTR} FileName The name of the file to be compiled.
     * @param {PWSTR} ServerAndNamespace The path to the default namespace where any classes or instance are written.
     * 
     * You can specify a namespace on a remote computer ("\\computer\root", for 
     *        example). This value can be overridden by the <b>#pragma</b> command and should not be used if 
     *        auto recovery is desired. If <b>NULL</b>, then the root\default namespace on the local 
     *        computer is the default.
     * @param {PWSTR} User A value that specifies the credentials used to compile on remote computers. If the value is 
     *       <b>NULL</b>, the user context is whatever the calling process is using. This is always 
     *       ignored when connecting to the local computer. For more information, see the Remarks section.
     * @param {PWSTR} Authority A value that specifies the credentials for compiling on remote computers. If the value is 
     *       <b>NULL</b>, the authority context is whatever the calling process is using. This is always 
     *       ignored when connecting to the local computer. For more information, see the Remarks section.
     * @param {PWSTR} Password A value that specifies the credentials for compiling on remote computers. If the value is <b>NULL</b>, the password of the current context is used. This is always ignored when connecting to the local computer.
     * @param {Integer} lOptionFlags A parameter that, when the 
     * <b>CompileFile</b> method is used, enables the combination of one or more of the following flags.
     * @param {Integer} lClassFlags The flags that control the creation of classes.
     * @param {Integer} lInstanceFlags The flags that control the creation of instances.
     * 
     * Parameter values can be either 0 or one of the following flags.
     * @param {Pointer<WBEM_COMPILE_STATUS_INFO>} pInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ns-wbemcli-wbem_compile_status_info">WBEM_COMPILE_STATUS_INFO</a> that describes an error.
     * 
     * If the parameter value is not <b>NULL</b>, an error has occurred, and the structure is filled  with error information.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 2
     * 
     * Warning that <a href="/windows/desktop/WmiSdk/pragma-autorecover">#pragma autorecover</a> statement is not present. This statement should be one the first line of the MOF file.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-imofcompiler-compilefile
     */
    CompileFile(FileName, ServerAndNamespace, User, Authority, Password, lOptionFlags, lClassFlags, lInstanceFlags, pInfo) {
        FileName := FileName is String ? StrPtr(FileName) : FileName
        ServerAndNamespace := ServerAndNamespace is String ? StrPtr(ServerAndNamespace) : ServerAndNamespace
        User := User is String ? StrPtr(User) : User
        Authority := Authority is String ? StrPtr(Authority) : Authority
        Password := Password is String ? StrPtr(Password) : Password

        result := ComCall(3, this, "ptr", FileName, "ptr", ServerAndNamespace, "ptr", User, "ptr", Authority, "ptr", Password, "int", lOptionFlags, "int", lClassFlags, "int", lInstanceFlags, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * The IMofCompiler::CompileBuffer method compiles either a buffer containing binary MOF data or a text buffer in ASCII format.
     * @param {Integer} BuffSize Size of the data pointed to by the <i>pBuffer</i> parameter.
     * @param {Pointer} pBuffer Pointer to the binary MOF file data or a text buffer in ASCII format.
     * @param {PWSTR} ServerAndNamespace Name of the server and namespace.
     * 
     * This parameter is ignored unless the <i>pBuffer</i> parameter points to a text buffer.  If the text MOF is passed without a <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/-pragma">#pragma</a> statement, then the MOF file is compiled into the default namespace. If <i>pBuffer</i> points to a binary MOF file, then the <i>ServerAndNamespace</i> parameter must be <b>NULL</b>.
     * @param {PWSTR} User Name of the user requesting the service.
     * 
     * This parameter specifies the credentials for compiling on remote computers. If the value is <b>NULL</b>, then the user context is whatever the current process is using. This is always ignored when connecting to the local computer. For more information, see the Remarks section.
     * @param {PWSTR} Authority Specifies the credentials for compiling on remote computers. If the value is <b>NULL</b>, the authority context is whatever the current process is using. This parameter is always ignored when connecting to the local computer. For more information, see the Remarks section.
     * @param {PWSTR} Password Specifies the credentials for compiling on remote computers. If the value is <b>NULL</b>, the password of the current context is used. This parameter is always ignored when connecting to the local computer.
     * @param {Integer} lOptionFlags You can combine one or more of the following flags.
     * @param {Integer} lClassFlags This parameter is ignored because the binary MOF file already contains the information. The parameter value should be 0.
     * @param {Integer} lInstanceFlags Ignored because the binary MOF file already contains the information. The parameter value should be 0.
     * @param {Pointer<WBEM_COMPILE_STATUS_INFO>} pInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ns-wbemcli-wbem_compile_status_info">WBEM_COMPILE_STATUS_INFO</a> that describes an error.
     * 
     * If the parameter value is not <b>NULL</b>, an error has occurred, and the structure is filled  with error information.
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful. If the method is unsuccessful, it returns <b>WBEM_S_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-imofcompiler-compilebuffer
     */
    CompileBuffer(BuffSize, pBuffer, ServerAndNamespace, User, Authority, Password, lOptionFlags, lClassFlags, lInstanceFlags, pInfo) {
        ServerAndNamespace := ServerAndNamespace is String ? StrPtr(ServerAndNamespace) : ServerAndNamespace
        User := User is String ? StrPtr(User) : User
        Authority := Authority is String ? StrPtr(Authority) : Authority
        Password := Password is String ? StrPtr(Password) : Password

        result := ComCall(4, this, "int", BuffSize, "ptr", pBuffer, "ptr", ServerAndNamespace, "ptr", User, "ptr", Authority, "ptr", Password, "int", lOptionFlags, "int", lClassFlags, "int", lInstanceFlags, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * The IMofCompiler::CreateBMOF method creates a binary MOF file.
     * @param {PWSTR} TextFileName The name of the text file to be parsed.
     * @param {PWSTR} BMOFFileName <b>Binary MOF file:  </b>The name of the file in which the resulting binary MOF data is to be stored.
     * 
     * <b>Localized MOF file:  </b>The <i>BMOFFileName</i> string must contain the following comma-separated values:
     * 
     * <ul>
     * <li>
     * a&lt;locale&gt;
     * 
     * Specifies the locale information. This value must start with a preceding comma. For more information, see the description of the <b>-ADMENDMENT</b> switch for the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/mofcomp">mofcomp</a> utility.
     * 
     * </li>
     * <li>
     * n&lt;filename.mof&gt;
     * 
     * The name of the file in which the resulting binary MOF data is to be stored.
     * 
     * </li>
     * <li>
     * l&lt;filename.mfl&gt;
     * 
     * The name of the file in which the resulting localized MOF data is to be stored.
     * 
     * </li>
     * </ul>
     * For example,  <i>BMOFFileName</i>=",aMS_409,nmyFile.mof,lmyFile.mfl".
     * @param {PWSTR} ServerAndNamespace The path of the default namespace, where classes or instances are written.
     * 
     * You can use this parameter to specify a namespace on a remote computer ("\\computer\root", for example). This value may be overridden by the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/-pragma">#pragma</a> command and should not be used if you use autorecovery. If the parameter value is <b>NULL</b>, the root\default namespace on the local computer is the default.
     * @param {Integer} lOptionFlags You can combine one or more of the following flags.
     * @param {Integer} lClassFlags The flags that control the creation of classes. The parameter value may be 0 or a combination of the following flags.
     * @param {Integer} lInstanceFlags Flags controlling the creation of instances.
     * 
     * The parameter value may be either 0 or one of the following flags.
     * @param {Pointer<WBEM_COMPILE_STATUS_INFO>} pInfo Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wbemcli/ns-wbemcli-wbem_compile_status_info">WBEM_COMPILE_STATUS_INFO</a> that describes an error.
     * 
     * If the parameter value is not <b>NULL</b>, an error has occurred, and the structure is filled  with error information.
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful. If the method is unsuccessful, it returns <b>WBEM_S_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-imofcompiler-createbmof
     */
    CreateBMOF(TextFileName, BMOFFileName, ServerAndNamespace, lOptionFlags, lClassFlags, lInstanceFlags, pInfo) {
        TextFileName := TextFileName is String ? StrPtr(TextFileName) : TextFileName
        BMOFFileName := BMOFFileName is String ? StrPtr(BMOFFileName) : BMOFFileName
        ServerAndNamespace := ServerAndNamespace is String ? StrPtr(ServerAndNamespace) : ServerAndNamespace

        result := ComCall(5, this, "ptr", TextFileName, "ptr", BMOFFileName, "ptr", ServerAndNamespace, "int", lOptionFlags, "int", lClassFlags, "int", lInstanceFlags, "ptr", pInfo, "HRESULT")
        return result
    }
}
