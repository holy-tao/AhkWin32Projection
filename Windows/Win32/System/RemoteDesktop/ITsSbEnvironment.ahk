#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods and properties that contain information about the environment that hosts the target computer. This interface can be used to store information about a physical server that hosts virtual machines.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbenvironment
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbEnvironment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbEnvironment
     * @type {Guid}
     */
    static IID => Guid("{8c87f7f7-bf51-4a5c-87bf-8e94fb6e2256}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_ServerWeight", "get_EnvironmentPropertySet", "put_EnvironmentPropertySet"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbenvironment-get_name
     */
    get_Name(pVal) {
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbenvironment-get_serverweight
     */
    get_ServerWeight(pVal) {
        result := ComCall(4, this, "uint*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbEnvironmentPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbenvironment-get_environmentpropertyset
     */
    get_EnvironmentPropertySet(ppPropertySet) {
        result := ComCall(5, this, "ptr*", ppPropertySet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITsSbEnvironmentPropertySet} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbenvironment-put_environmentpropertyset
     */
    put_EnvironmentPropertySet(pVal) {
        result := ComCall(6, this, "ptr", pVal, "HRESULT")
        return result
    }
}
