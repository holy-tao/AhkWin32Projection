#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables clients to get pointers to other interfaces on a given object through the QueryInterface method, and manage the existence of the object through the AddRef and Release methods.
 * @see https://docs.microsoft.com/windows/win32/api//unknwn/nn-unknwn-iunknown
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IUnknown extends Win32ComInterface{
    /**
     * The interface identifier for IUnknown
     * @type {Guid}
     */
    static IID => Guid("{00000000-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    QueryInterface(riid, ppvObject) {
        result := ComCall(0, this, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    AddRef() {
        result := ComCall(1, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Release() {
        result := ComCall(2, this, "uint")
        return result
    }
}
