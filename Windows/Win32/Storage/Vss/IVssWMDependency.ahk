#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssWMDependency is a C++ (not COM) interface returned by the IVssWMComponent interface and used by applications when backing up or restoring a component that has an explicit writer-component dependency on a component managed by another writer.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsswmdependency
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssWMDependency extends IUnknown{

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
    static VTableNames => ["GetWriterId", "GetLogicalPath", "GetComponentName"]

    /**
     * 
     * @param {Pointer<Guid>} pWriterId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmdependency-getwriterid
     */
    GetWriterId(pWriterId) {
        result := ComCall(3, this, "ptr", pWriterId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLogicalPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmdependency-getlogicalpath
     */
    GetLogicalPath(pbstrLogicalPath) {
        result := ComCall(4, this, "ptr", pbstrLogicalPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrComponentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmdependency-getcomponentname
     */
    GetComponentName(pbstrComponentName) {
        result := ComCall(5, this, "ptr", pbstrComponentName, "HRESULT")
        return result
    }
}
