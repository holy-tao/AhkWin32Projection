#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumEventObject.ahk
#Include ..\IUnknown.ahk

/**
 * Enumerates the event objects that are registered in the COM+ events store.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ienumeventobject
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEnumEventObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumEventObject
     * @type {Guid}
     */
    static IID => Guid("{f4a07d63-2e25-11d1-9964-00c04fbbb345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * 
     * @returns {IEnumEventObject} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ienumeventobject-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppInterface := 0, "HRESULT")
        return IEnumEventObject(ppInterface)
    }

    /**
     * 
     * @param {Integer} cReqElem 
     * @param {Pointer<IUnknown>} ppInterface 
     * @param {Pointer<Integer>} cRetElem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ienumeventobject-next
     */
    Next(cReqElem, ppInterface, cRetElem) {
        cRetElemMarshal := cRetElem is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", cReqElem, "ptr*", ppInterface, cRetElemMarshal, cRetElem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ienumeventobject-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cSkipElem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ienumeventobject-skip
     */
    Skip(cSkipElem) {
        result := ComCall(6, this, "uint", cSkipElem, "HRESULT")
        return result
    }
}
