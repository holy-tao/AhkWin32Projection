#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables a container to control the running of its embedded objects.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irunnableobject
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRunnableObject extends IUnknown{
    /**
     * The interface identifier for IRunnableObject
     * @type {Guid}
     */
    static IID => Guid("{00000126-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} lpClsid 
     * @returns {HRESULT} 
     */
    GetRunningClass(lpClsid) {
        result := ComCall(3, this, "ptr", lpClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pbc 
     * @returns {HRESULT} 
     */
    Run(pbc) {
        result := ComCall(4, this, "ptr", pbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsRunning() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} fLock 
     * @param {BOOL} fLastUnlockCloses 
     * @returns {HRESULT} 
     */
    LockRunning(fLock, fLastUnlockCloses) {
        result := ComCall(6, this, "int", fLock, "int", fLastUnlockCloses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fContained 
     * @returns {HRESULT} 
     */
    SetContainedObject(fContained) {
        result := ComCall(7, this, "int", fContained, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
