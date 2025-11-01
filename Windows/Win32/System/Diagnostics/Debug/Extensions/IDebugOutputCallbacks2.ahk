#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugOutputCallbacks2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Output", "GetInterestMask", "Output2"]

    /**
     * 
     * @param {Integer} Mask 
     * @param {PSTR} Text 
     * @returns {HRESULT} 
     */
    Output(Mask, Text) {
        Text := Text is String ? StrPtr(Text) : Text

        result := ComCall(3, this, "uint", Mask, "ptr", Text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Mask 
     * @returns {HRESULT} 
     */
    GetInterestMask(Mask) {
        result := ComCall(4, this, "uint*", Mask, "HRESULT")
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

        result := ComCall(5, this, "uint", Which, "uint", Flags, "uint", Arg, "ptr", Text, "HRESULT")
        return result
    }
}
