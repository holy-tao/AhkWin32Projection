#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class IPhoneNumberInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneNumberInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{5b3f4f6a-86a9-40e9-8649-6d61161928d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryParse", "TryParseWithRegion"]

    /**
     * 
     * @param {HSTRING} input_ 
     * @param {Pointer<PhoneNumberInfo>} phoneNumber 
     * @returns {Integer} 
     */
    TryParse(input_, phoneNumber) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(6, this, "ptr", input_, "ptr", phoneNumber, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} input_ 
     * @param {HSTRING} regionCode 
     * @param {Pointer<PhoneNumberInfo>} phoneNumber 
     * @returns {Integer} 
     */
    TryParseWithRegion(input_, regionCode, phoneNumber) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_
        if(regionCode is String) {
            pin := HSTRING.Create(regionCode)
            regionCode := pin.Value
        }
        regionCode := regionCode is Win32Handle ? NumGet(regionCode, "ptr") : regionCode

        result := ComCall(7, this, "ptr", input_, "ptr", regionCode, "ptr", phoneNumber, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
