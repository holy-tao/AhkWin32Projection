#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowCapabilities extends IUnknown{
    /**
     * The interface identifier for ISideShowCapabilities
     * @type {Guid}
     */
    static IID => Guid("{535e1379-c09e-4a54-a511-597bab3a72b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} in_keyCapability 
     * @param {Pointer<PROPVARIANT>} inout_pValue 
     * @returns {HRESULT} 
     */
    GetCapability(in_keyCapability, inout_pValue) {
        result := ComCall(3, this, "ptr", in_keyCapability, "ptr", inout_pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
