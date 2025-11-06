#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ContextInfo.ahk

/**
 * Provides additional information about an object's context, supplementing the information that is available through the ContextInfo interface.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-contextinfo2
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ContextInfo2 extends ContextInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ContextInfo2
     * @type {Guid}
     */
    static IID => Guid("{c99d6e75-2375-11d4-8331-00c04f605588}")

    /**
     * The class identifier for ContextInfo2
     * @type {Guid}
     */
    static CLSID => Guid("{c99d6e75-2375-11d4-8331-00c04f605588}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPartitionId", "GetApplicationId", "GetApplicationInstanceId"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo2-getpartitionid
     */
    GetPartitionId() {
        __MIDL__ContextInfo20000 := BSTR()
        result := ComCall(12, this, "ptr", __MIDL__ContextInfo20000, "HRESULT")
        return __MIDL__ContextInfo20000
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo2-getapplicationid
     */
    GetApplicationId() {
        __MIDL__ContextInfo20001 := BSTR()
        result := ComCall(13, this, "ptr", __MIDL__ContextInfo20001, "HRESULT")
        return __MIDL__ContextInfo20001
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo2-getapplicationinstanceid
     */
    GetApplicationInstanceId() {
        __MIDL__ContextInfo20002 := BSTR()
        result := ComCall(14, this, "ptr", __MIDL__ContextInfo20002, "HRESULT")
        return __MIDL__ContextInfo20002
    }
}
