#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The GenerateGroupPolicy callback function is an application-defined callback function that each policy extension must export when generating RSoP data in the planning mode.
 * @remarks
 * The policy extension must register this callback function at the registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>Winlogon</b>&#92;<b>GPExtensions</b>&#92;<b>ClientExtensionGuid</b>
 * 
 * 
 * 
 * <b>GenerateGroupPolicy</b>
 * <b>REG_SZ</b>
 * @see https://learn.microsoft.com/windows/win32/api//content/userenv/nc-userenv-pfngenerategrouppolicy
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class PFNGENERATEGROUPPOLICY extends IUnknown {

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
     * @param {Integer} dwFlags 
     * @param {Pointer<BOOL>} pbAbort 
     * @param {PWSTR} pwszSite 
     * @param {Pointer<RSOP_TARGET>} pComputerTarget 
     * @param {Pointer<RSOP_TARGET>} pUserTarget 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwFlags, pbAbort, pwszSite, pComputerTarget, pUserTarget) {
        pwszSite := pwszSite is String ? StrPtr(pwszSite) : pwszSite

        pbAbortMarshal := pbAbort is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", dwFlags, pbAbortMarshal, pbAbort, "ptr", pwszSite, "ptr", pComputerTarget, "ptr", pUserTarget, "uint")
        return result
    }
}
