#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugOutputCallbacks2 extends IUnknown{
    /**
     * The interface identifier for IDebugOutputCallbacks2
     * @type {Guid}
     */
    static IID => Guid("{67721fe9-56d2-4a44-a325-2b65513ce6eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Mask 
     * @param {PSTR} Text 
     * @returns {HRESULT} 
     */
    Output(Mask, Text) {
        result := ComCall(3, this, "uint", Mask, "ptr", Text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Mask 
     * @returns {HRESULT} 
     */
    GetInterestMask(Mask) {
        result := ComCall(4, this, "uint*", Mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Flags 
     * @param {Integer} Arg 
     * @param {PWSTR} Text 
     * @returns {HRESULT} 
     */
    Output2(Which, Flags, Arg, Text) {
        Text := Text is String ? StrPtr(Text) : Text

        result := ComCall(5, this, "uint", Which, "uint", Flags, "uint", Arg, "ptr", Text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
