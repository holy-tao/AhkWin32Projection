#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables a class of objects to be created.
 * @see https://docs.microsoft.com/windows/win32/api//unknwnbase/nn-unknwnbase-iclassfactory
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClassFactory
     * @type {Guid}
     */
    static IID => Guid("{00000001-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "LockServer"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iclassfactory-createinstance
     */
    CreateInstance(pUnkOuter, riid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fLock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iclassfactory-lockserver
     */
    LockServer(fLock) {
        result := ComCall(4, this, "int", fLock, "HRESULT")
        return result
    }
}
