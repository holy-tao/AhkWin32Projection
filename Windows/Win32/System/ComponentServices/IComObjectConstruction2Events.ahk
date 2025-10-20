#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a constructed object is created.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomobjectconstruction2events
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComObjectConstruction2Events extends IUnknown{
    /**
     * The interface identifier for IComObjectConstruction2Events
     * @type {Guid}
     */
    static IID => Guid("{4b5a7827-8df2-45c0-8f6f-57ea1f856a9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {PWSTR} sConstructString 
     * @param {Integer} oid 
     * @param {Pointer<Guid>} guidPartition 
     * @returns {HRESULT} 
     */
    OnObjectConstruct2(pInfo, guidObject, sConstructString, oid, guidPartition) {
        sConstructString := sConstructString is String ? StrPtr(sConstructString) : sConstructString

        result := ComCall(3, this, "ptr", pInfo, "ptr", guidObject, "ptr", sConstructString, "uint", oid, "ptr", guidPartition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
