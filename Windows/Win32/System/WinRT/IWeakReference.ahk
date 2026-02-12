#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a weak reference to an object.
 * @see https://learn.microsoft.com/windows/win32/api//content/weakreference/nn-weakreference-iweakreference
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
     * Resolves a weak reference by returning a strong reference to the implementing object.
     * @remarks
     * If you try to resolve a weak reference to a strong reference for an object that is no longer available, then <b>IWeakReference::Resolve</b> returns <b>S_OK</b>, but the <i>objectReference</i> parameter points to null.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>**</b>
     * 
     * A strong reference to the object.
     * @see https://learn.microsoft.com/windows/win32/api//content/weakreference/nf-weakreference-iweakreference-resolve(t_)
     */
    Resolve(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &objectReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return objectReference
    }
}
