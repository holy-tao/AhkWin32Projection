#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HardwareToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IHardwareIdentificationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHardwareIdentificationStatics
     * @type {Guid}
     */
    static IID => Guid("{971260e0-f170-4a42-bd55-a900b212dae2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPackageSpecificToken"]

    /**
     * 
     * @param {IBuffer} nonce 
     * @returns {HardwareToken} 
     */
    GetPackageSpecificToken(nonce) {
        result := ComCall(6, this, "ptr", nonce, "ptr*", &packageSpecificHardwareToken := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HardwareToken(packageSpecificHardwareToken)
    }
}
