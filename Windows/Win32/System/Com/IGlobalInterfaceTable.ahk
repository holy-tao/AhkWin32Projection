#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables any apartment in a process to get access to an interface implemented on an object in any other apartment in the process.
 * @remarks
 * 
  * The <b>IGlobalInterfaceTable</b> interface is an efficient way for a process to store an interface pointer in a memory location that can be accessed from multiple apartments within the process, such as processwide variables and agile (free-threaded marshaled) objects containing interface pointers to other objects. 
  * 
  * 
  * 
  * An agile object is unaware of the underlying COM infrastructure in which it runs - in other words, what apartment, context, and thread it is executing on. The object may be holding on to interfaces that are specific to an apartment or context. For this reason, calling these interfaces from wherever the agile component is executing may not always work properly. The global interface table avoids this problem by guaranteeing that a valid proxy (or direct pointer) to the object is used, based on where the agile object is executing.
  * 
  * The global interface table is not portable across process or machine boundaries, so it cannot be used in place of the normal parameter-passing mechanism.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iglobalinterfacetable
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IGlobalInterfaceTable extends IUnknown{
    /**
     * The interface identifier for IGlobalInterfaceTable
     * @type {Guid}
     */
    static IID => Guid("{00000146-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    RegisterInterfaceInGlobal(pUnk, riid, pdwCookie) {
        result := ComCall(3, this, "ptr", pUnk, "ptr", riid, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    RevokeInterfaceFromGlobal(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetInterfaceFromGlobal(dwCookie, riid, ppv) {
        result := ComCall(5, this, "uint", dwCookie, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
