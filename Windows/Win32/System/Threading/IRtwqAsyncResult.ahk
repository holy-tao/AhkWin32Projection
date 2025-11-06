#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides information about the result of an asynchronous operation.
 * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nn-rtworkq-irtwqasyncresult
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class IRtwqAsyncResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRtwqAsyncResult
     * @type {Guid}
     */
    static IID => Guid("{ac6b7889-0740-4d51-8619-905994a55cc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetState", "GetStatus", "SetStatus", "GetObject", "GetStateNoAddRef"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-getstate
     */
    GetState() {
        result := ComCall(3, this, "ptr*", &ppunkState := 0, "HRESULT")
        return IUnknown(ppunkState)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-setstatus
     */
    SetStatus(hrStatus) {
        result := ComCall(5, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject() {
        result := ComCall(6, this, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasyncresult-getstatenoaddref
     */
    GetStateNoAddRef() {
        result := ComCall(7, this, "ptr")
        return result
    }
}
