#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Is called once by the Local Security Authority (LSA) to provide a security package with general security information and a dispatch table of support functions.
 * @remarks
 * If <b>SpInitialize</b> returns an NTSTATUS error code to the LSA, the package will be unloaded, and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) will not include it in the list of available security packages.
 * 
 * SSP/APs must implement the <b>SpInitialize</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the SSP/AP's implementation of the <b>SpInitialize</b> function must be in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure passed to the LSA from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecpkg/nc-ntsecpkg-spinitializefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SpInitializeFn extends IUnknown {

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
     * @param {Pointer} PackageId 
     * @param {Pointer<SECPKG_PARAMETERS>} Parameters 
     * @param {Pointer<LSA_SECPKG_FUNCTION_TABLE>} FunctionTable 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(PackageId, Parameters, FunctionTable) {
        result := ComCall(3, this, "ptr", PackageId, "ptr", Parameters, "ptr", FunctionTable, "int")
        return result
    }
}
