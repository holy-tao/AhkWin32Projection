#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a weak reference to an object.
 * @see https://docs.microsoft.com/windows/win32/api//weakreference/nn-weakreference-iweakreference
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IWeakReference extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWeakReference
     * @type {Guid}
     */
    static IID => Guid("{00000037-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Resolve"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} objectReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/weakreference/nf-weakreference-iweakreference-resolve(t_)
     */
    Resolve(riid, objectReference) {
        objectReferenceMarshal := objectReference is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", riid, objectReferenceMarshal, objectReference, "HRESULT")
        return result
    }
}
