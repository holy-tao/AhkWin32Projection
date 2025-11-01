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
     * 
     * @param {PWSTR} FileName 
     * @param {PWSTR} ServerAndNamespace 
     * @param {PWSTR} User 
     * @param {PWSTR} Authority 
     * @param {PWSTR} Password 
     * @param {Integer} lOptionFlags 
     * @param {Integer} lClassFlags 
     * @param {Integer} lInstanceFlags 
     * @param {Pointer<WBEM_COMPILE_STATUS_INFO>} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-imofcompiler-compilefile
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
     * 
     * @param {Integer} BuffSize 
     * @param {Pointer} pBuffer 
     * @param {PWSTR} ServerAndNamespace 
     * @param {PWSTR} User 
     * @param {PWSTR} Authority 
     * @param {PWSTR} Password 
     * @param {Integer} lOptionFlags 
     * @param {Integer} lClassFlags 
     * @param {Integer} lInstanceFlags 
     * @param {Pointer<WBEM_COMPILE_STATUS_INFO>} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-imofcompiler-compilebuffer
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
     * 
     * @param {PWSTR} TextFileName 
     * @param {PWSTR} BMOFFileName 
     * @param {PWSTR} ServerAndNamespace 
     * @param {Integer} lOptionFlags 
     * @param {Integer} lClassFlags 
     * @param {Integer} lInstanceFlags 
     * @param {Pointer<WBEM_COMPILE_STATUS_INFO>} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-imofcompiler-createbmof
     */
    CreateBMOF(TextFileName, BMOFFileName, ServerAndNamespace, lOptionFlags, lClassFlags, lInstanceFlags, pInfo) {
        TextFileName := TextFileName is String ? StrPtr(TextFileName) : TextFileName
        BMOFFileName := BMOFFileName is String ? StrPtr(BMOFFileName) : BMOFFileName
        ServerAndNamespace := ServerAndNamespace is String ? StrPtr(ServerAndNamespace) : ServerAndNamespace

        result := ComCall(5, this, "ptr", TextFileName, "ptr", BMOFFileName, "ptr", ServerAndNamespace, "int", lOptionFlags, "int", lClassFlags, "int", lInstanceFlags, "ptr", pInfo, "HRESULT")
        return result
    }
}
