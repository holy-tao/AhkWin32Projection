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
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    CreateInstance(pUnkOuter, riid, ppvObject) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fLock 
     * @returns {HRESULT} 
     */
    LockServer(fLock) {
        result := ComCall(4, this, "int", fLock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
