#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a constructed object is created in an object pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomobjectconstructionevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComObjectConstructionEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComObjectConstructionEvents
     * @type {Guid}
     */
    static IID => Guid("{683130af-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnObjectConstruct"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidObject 
     * @param {PWSTR} sConstructString 
     * @param {Integer} oid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectconstructionevents-onobjectconstruct
     */
    OnObjectConstruct(pInfo, guidObject, sConstructString, oid) {
        sConstructString := sConstructString is String ? StrPtr(sConstructString) : sConstructString

        result := ComCall(3, this, "ptr", pInfo, "ptr", guidObject, "ptr", sConstructString, "uint", oid, "HRESULT")
        return result
    }
}
