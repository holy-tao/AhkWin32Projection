#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a source object to which a weak reference can be retrieved.
 * @see https://docs.microsoft.com/windows/win32/api//weakreference/nn-weakreference-iweakreferencesource
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IWeakReferenceSource extends IUnknown{
    /**
     * The interface identifier for IWeakReferenceSource
     * @type {Guid}
     */
    static IID => Guid("{00000038-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWeakReference>} weakReference 
     * @returns {HRESULT} 
     */
    GetWeakReference(weakReference) {
        result := ComCall(3, this, "ptr", weakReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
