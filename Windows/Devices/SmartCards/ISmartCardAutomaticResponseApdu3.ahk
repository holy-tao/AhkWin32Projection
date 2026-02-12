#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardAutomaticResponseApdu3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardAutomaticResponseApdu3
     * @type {Guid}
     */
    static IID => Guid("{bf43da74-6576-4392-9367-fe3bc9e2d496}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowWhenCryptogramGeneratorNotPrepared", "put_AllowWhenCryptogramGeneratorNotPrepared"]

    /**
     * @type {Boolean} 
     */
    AllowWhenCryptogramGeneratorNotPrepared {
        get => this.get_AllowWhenCryptogramGeneratorNotPrepared()
        set => this.put_AllowWhenCryptogramGeneratorNotPrepared(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowWhenCryptogramGeneratorNotPrepared() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowWhenCryptogramGeneratorNotPrepared(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
