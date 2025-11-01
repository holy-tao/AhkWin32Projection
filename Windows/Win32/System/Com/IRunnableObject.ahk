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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRunningClass", "Run", "IsRunning", "LockRunning", "SetContainedObject"]

    /**
     * 
     * @param {Pointer<Guid>} lpClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunnableobject-getrunningclass
     */
    GetRunningClass(lpClsid) {
        result := ComCall(3, this, "ptr", lpClsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBindCtx} pbc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunnableobject-run
     */
    Run(pbc) {
        result := ComCall(4, this, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunnableobject-isrunning
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
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunnableobject-lockrunning
     */
    LockRunning(fLock, fLastUnlockCloses) {
        result := ComCall(6, this, "int", fLock, "int", fLastUnlockCloses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fContained 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunnableobject-setcontainedobject
     */
    SetContainedObject(fContained) {
        result := ComCall(7, this, "int", fContained, "HRESULT")
        return result
    }
}
