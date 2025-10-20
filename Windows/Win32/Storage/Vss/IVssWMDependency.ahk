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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pWriterId 
     * @returns {HRESULT} 
     */
    GetWriterId(pWriterId) {
        result := ComCall(3, this, "ptr", pWriterId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLogicalPath 
     * @returns {HRESULT} 
     */
    GetLogicalPath(pbstrLogicalPath) {
        result := ComCall(4, this, "ptr", pbstrLogicalPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrComponentName 
     * @returns {HRESULT} 
     */
    GetComponentName(pbstrComponentName) {
        result := ComCall(5, this, "ptr", pbstrComponentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
