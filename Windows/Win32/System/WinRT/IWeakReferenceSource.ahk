#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWeakReference.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a source object to which a weak reference can be retrieved.
 * @see https://docs.microsoft.com/windows/win32/api//weakreference/nn-weakreference-iweakreferencesource
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IWeakReferenceSource extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWeakReference"]

    /**
     * Retrieves a weak reference from an IWeakReferenceSource.
     * @returns {IWeakReference} Type: [out, retval] <b><a href="https://docs.microsoft.com/windows/win32/api/weakreference/nn-weakreference-iweakreference">IWeakReference</a>**</b>
     * 
     * The weak reference.
     * @see https://docs.microsoft.com/windows/win32/api//weakreference/nf-weakreference-iweakreferencesource-getweakreference
     */
    GetWeakReference() {
        result := ComCall(3, this, "ptr*", &weakReference := 0, "HRESULT")
        return IWeakReference(weakReference)
    }
}
