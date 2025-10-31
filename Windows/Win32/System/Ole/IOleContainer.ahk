#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IParseDisplayName.ahk

/**
 * Enumerates objects in a compound document or lock a container in the running state. Container and object applications both implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolecontainer
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleContainer extends IParseDisplayName{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleContainer
     * @type {Guid}
     */
    static IID => Guid("{0000011b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumObjects", "LockContainer"]

    /**
     * The EnumObjects function enumerates the pens or brushes available for the specified device context (DC).
     * @param {Integer} grfFlags 
     * @param {Pointer<IEnumUnknown>} ppenum 
     * @returns {HRESULT} If the function succeeds, the return value is the last value returned by the callback function. Its meaning is user-defined.
     * 
     * If the objects cannot be enumerated (for example, there are too many objects), the function returns zero without calling the callback function.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumobjects
     */
    EnumObjects(grfFlags, ppenum) {
        result := ComCall(4, this, "uint", grfFlags, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fLock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecontainer-lockcontainer
     */
    LockContainer(fLock) {
        result := ComCall(5, this, "int", fLock, "HRESULT")
        return result
    }
}
