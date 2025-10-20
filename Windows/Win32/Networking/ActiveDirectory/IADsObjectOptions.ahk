#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides a direct mechanism to specify and obtain provider-specific options for manipulating an ADSI object.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsobjectoptions
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsObjectOptions extends IDispatch{
    /**
     * The interface identifier for IADsObjectOptions
     * @type {Guid}
     */
    static IID => Guid("{46f14fda-232b-11d1-a808-00c04fd8d5a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} lnOption 
     * @param {Pointer<VARIANT>} pvValue 
     * @returns {HRESULT} 
     */
    GetOption(lnOption, pvValue) {
        result := ComCall(7, this, "int", lnOption, "ptr", pvValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnOption 
     * @param {VARIANT} vValue 
     * @returns {HRESULT} 
     */
    SetOption(lnOption, vValue) {
        result := ComCall(8, this, "int", lnOption, "ptr", vValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
