#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CERT_IS_WEAK_HASH extends IUnknown {

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
     * @param {Integer} dwHashUseType 
     * @param {PWSTR} pwszCNGHashAlgid 
     * @param {Integer} dwChainFlags 
     * @param {Pointer<CERT_CHAIN_CONTEXT>} pSignerChainContext 
     * @param {Pointer<FILETIME>} pTimeStamp 
     * @param {PWSTR} pwszFileName 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwHashUseType, pwszCNGHashAlgid, dwChainFlags, pSignerChainContext, pTimeStamp, pwszFileName) {
        pwszCNGHashAlgid := pwszCNGHashAlgid is String ? StrPtr(pwszCNGHashAlgid) : pwszCNGHashAlgid
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "uint", dwHashUseType, "ptr", pwszCNGHashAlgid, "uint", dwChainFlags, "ptr", pSignerChainContext, "ptr", pTimeStamp, "ptr", pwszFileName, "int")
        return result
    }
}
