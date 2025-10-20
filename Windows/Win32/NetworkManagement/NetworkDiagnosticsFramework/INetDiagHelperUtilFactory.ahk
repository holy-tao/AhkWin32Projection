#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a reserved method that is used by the Network Diagnostics Framework (NDF).
 * @remarks
 * 
  * This interface is reserved for system use.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nn-ndhelper-inetdiaghelperutilfactory
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class INetDiagHelperUtilFactory extends IUnknown{
    /**
     * The interface identifier for INetDiagHelperUtilFactory
     * @type {Guid}
     */
    static IID => Guid("{104613fb-bc57-4178-95ba-88809698354a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    CreateUtilityInstance(riid, ppvObject) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
