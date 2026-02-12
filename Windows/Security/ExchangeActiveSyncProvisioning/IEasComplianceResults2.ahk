#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class IEasComplianceResults2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEasComplianceResults2
     * @type {Guid}
     */
    static IID => Guid("{2fbe60c9-1aa8-47f5-88bb-cb3ef0bffb15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EncryptionProviderType"]

    /**
     * @type {Integer} 
     */
    EncryptionProviderType {
        get => this.get_EncryptionProviderType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EncryptionProviderType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
