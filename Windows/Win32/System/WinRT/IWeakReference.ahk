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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} objectReference 
     * @returns {HRESULT} 
     */
    Resolve(riid, objectReference) {
        result := ComCall(3, this, "ptr", riid, "ptr", objectReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
