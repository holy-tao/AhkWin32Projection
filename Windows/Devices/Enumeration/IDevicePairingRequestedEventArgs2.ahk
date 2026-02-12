#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDevicePairingRequestedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePairingRequestedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{c83752d9-e4d3-4db0-a360-a105e437dbdc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcceptWithPasswordCredential"]

    /**
     * 
     * @param {PasswordCredential} passwordCredential_ 
     * @returns {HRESULT} 
     */
    AcceptWithPasswordCredential(passwordCredential_) {
        result := ComCall(6, this, "ptr", passwordCredential_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
