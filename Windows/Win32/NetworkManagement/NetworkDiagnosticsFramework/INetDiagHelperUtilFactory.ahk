#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a reserved method that is used by the Network Diagnostics Framework (NDF).
 * @remarks
 * This interface is reserved for system use.
 * @see https://learn.microsoft.com/windows/win32/api//content/ndhelper/nn-ndhelper-inetdiaghelperutilfactory
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class INetDiagHelperUtilFactory extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUtilityInstance"]

    /**
     * Used by the Network Diagnostics Framework (NDF). This method is reserved for system use. (INetDiagHelperUtilFactory.CreateUtilityInstance)
     * @remarks
     * This method is reserved for system use.
     * @param {Pointer<Guid>} riid Reserved for system use.
     * @returns {Pointer<Pointer<Void>>} Reserved for system use.
     * @see https://learn.microsoft.com/windows/win32/api//content/ndhelper/nf-ndhelper-inetdiaghelperutilfactory-createutilityinstance
     */
    CreateUtilityInstance(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppvObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvObject
    }
}
