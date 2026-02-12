#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset ANSI
 */
class PFAXSENDDOCUMENTA extends IUnknown {

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
     * @param {HANDLE} FaxHandle 
     * @param {PSTR} FileName 
     * @param {Pointer<FAX_JOB_PARAMA>} JobParams 
     * @param {Pointer<FAX_COVERPAGE_INFOA>} CoverpageInfo 
     * @param {Pointer<Integer>} FaxJobId 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, FileName, JobParams, CoverpageInfo, FaxJobId) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        FileName := FileName is String ? StrPtr(FileName) : FileName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", FaxHandle, "ptr", FileName, "ptr", JobParams, "ptr", CoverpageInfo, FaxJobIdMarshal, FaxJobId, "int")
        return result
    }
}
