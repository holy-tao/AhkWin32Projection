#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_CRACK_SINGLE_NAME extends IUnknown {

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
     * @param {Integer} FormatOffered 
     * @param {BOOLEAN} PerformAtGC 
     * @param {Pointer<LSA_UNICODE_STRING>} NameInput 
     * @param {Pointer<LSA_UNICODE_STRING>} Prefix 
     * @param {Integer} RequestedFormat 
     * @param {Pointer<LSA_UNICODE_STRING>} CrackedName 
     * @param {Pointer<LSA_UNICODE_STRING>} DnsDomainName 
     * @param {Pointer<Integer>} SubStatus 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FormatOffered, PerformAtGC, NameInput, Prefix, RequestedFormat, CrackedName, DnsDomainName, SubStatus) {
        SubStatusMarshal := SubStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", FormatOffered, "char", PerformAtGC, "ptr", NameInput, "ptr", Prefix, "uint", RequestedFormat, "ptr", CrackedName, "ptr", DnsDomainName, SubStatusMarshal, SubStatus, "int")
        return result
    }
}
