#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHolder.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Connects to the dispenser manager.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-idispensermanager
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IDispenserManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispenserManager
     * @type {Guid}
     */
    static IID => Guid("{5cb31e10-2b5f-11cf-be10-00aa00a2fa25}")

    /**
     * The class identifier for DispenserManager
     * @type {Guid}
     */
    static CLSID => Guid("{ecabb0c0-7f19-11d2-978e-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDispenser", "GetContext"]

    /**
     * 
     * @param {IDispenserDriver} __MIDL__IDispenserManager0000 
     * @param {PWSTR} szDispenserName 
     * @returns {IHolder} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispensermanager-registerdispenser
     */
    RegisterDispenser(__MIDL__IDispenserManager0000, szDispenserName) {
        szDispenserName := szDispenserName is String ? StrPtr(szDispenserName) : szDispenserName

        result := ComCall(3, this, "ptr", __MIDL__IDispenserManager0000, "ptr", szDispenserName, "ptr*", &__MIDL__IDispenserManager0001 := 0, "HRESULT")
        return IHolder(__MIDL__IDispenserManager0001)
    }

    /**
     * 
     * @param {Pointer<Pointer>} __MIDL__IDispenserManager0002 
     * @param {Pointer<Pointer>} __MIDL__IDispenserManager0003 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-idispensermanager-getcontext
     */
    GetContext(__MIDL__IDispenserManager0002, __MIDL__IDispenserManager0003) {
        __MIDL__IDispenserManager0002Marshal := __MIDL__IDispenserManager0002 is VarRef ? "ptr*" : "ptr"
        __MIDL__IDispenserManager0003Marshal := __MIDL__IDispenserManager0003 is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, __MIDL__IDispenserManager0002Marshal, __MIDL__IDispenserManager0002, __MIDL__IDispenserManager0003Marshal, __MIDL__IDispenserManager0003, "HRESULT")
        return result
    }
}
