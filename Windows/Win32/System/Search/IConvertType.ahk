#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IConvertType extends IUnknown{
    /**
     * The interface identifier for IConvertType
     * @type {Guid}
     */
    static IID => Guid("{0c733a88-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} wFromType 
     * @param {Integer} wToType 
     * @param {Integer} dwConvertFlags 
     * @returns {HRESULT} 
     */
    CanConvert(wFromType, wToType, dwConvertFlags) {
        result := ComCall(3, this, "ushort", wFromType, "ushort", wToType, "uint", dwConvertFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
