#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that gets and sets the option for specifying whether -0 is formatted as "-0" or "0".
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.isignedzerooption
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class ISignedZeroOption extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISignedZeroOption
     * @type {Guid}
     */
    static IID => Guid("{fd1cdd31-0a3c-49c4-a642-96a1564f4f30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsZeroSigned", "put_IsZeroSigned"]

    /**
     * Gets or sets whether -0 is formatted as "-0" or "0".
     * @remarks
     * You can set this property to specify that a formatter class display negative 0 as "-0". This enables the scenario where you wish to display "-0" when it represents the rounded value of some small negative value (such as -0.00001).
     * 
     * This property defaults to **false** to be consistent with Windows 8 and Windows Server 2012, in which -0 was always formatted as "0".
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.isignedzerooption.iszerosigned
     * @type {Boolean} 
     */
    IsZeroSigned {
        get => this.get_IsZeroSigned()
        set => this.put_IsZeroSigned(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZeroSigned() {
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
    put_IsZeroSigned(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
