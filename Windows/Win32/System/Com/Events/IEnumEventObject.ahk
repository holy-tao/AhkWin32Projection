#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Enumerates the event objects that are registered in the COM+ events store.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ienumeventobject
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEnumEventObject extends IUnknown{
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
     * 
     * @param {Pointer<IEnumEventObject>} ppInterface 
     * @returns {HRESULT} 
     */
    Clone(ppInterface) {
        result := ComCall(3, this, "ptr", ppInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cReqElem 
     * @param {Pointer<IUnknown>} ppInterface 
     * @param {Pointer<UInt32>} cRetElem 
     * @returns {HRESULT} 
     */
    Next(cReqElem, ppInterface, cRetElem) {
        result := ComCall(4, this, "uint", cReqElem, "ptr", ppInterface, "uint*", cRetElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cSkipElem 
     * @returns {HRESULT} 
     */
    Skip(cSkipElem) {
        result := ComCall(6, this, "uint", cSkipElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
