#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables you to obtain the following information about the apartment and thread that the caller is executing in:\_apartment type, thread type, and thread GUID. It also allows you to specify a thread GUID.
 * @remarks
 * 
  *  An instance of this interface for the current context can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetobjectcontext">CoGetObjectContext</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-icomthreadinginfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IComThreadingInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComThreadingInfo
     * @type {Guid}
     */
    static IID => Guid("{000001ce-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentApartmentType", "GetCurrentThreadType", "GetCurrentLogicalThreadId", "SetCurrentLogicalThreadId"]

    /**
     * 
     * @param {Pointer<Integer>} pAptType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icomthreadinginfo-getcurrentapartmenttype
     */
    GetCurrentApartmentType(pAptType) {
        pAptTypeMarshal := pAptType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pAptTypeMarshal, pAptType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pThreadType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icomthreadinginfo-getcurrentthreadtype
     */
    GetCurrentThreadType(pThreadType) {
        pThreadTypeMarshal := pThreadType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pThreadTypeMarshal, pThreadType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidLogicalThreadId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icomthreadinginfo-getcurrentlogicalthreadid
     */
    GetCurrentLogicalThreadId(pguidLogicalThreadId) {
        result := ComCall(5, this, "ptr", pguidLogicalThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icomthreadinginfo-setcurrentlogicalthreadid
     */
    SetCurrentLogicalThreadId(rguid) {
        result := ComCall(6, this, "ptr", rguid, "HRESULT")
        return result
    }
}
