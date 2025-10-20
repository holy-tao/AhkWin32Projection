#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the preferred and blocked filter lists.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamplugincontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPluginControl extends IUnknown{
    /**
     * The interface identifier for IAMPluginControl
     * @type {Guid}
     */
    static IID => Guid("{0e26a181-f40c-4635-8786-976284b52981}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} subType 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    GetPreferredClsid(subType, clsid) {
        result := ComCall(3, this, "ptr", subType, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} subType 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    GetPreferredClsidByIndex(index, subType, clsid) {
        result := ComCall(4, this, "uint", index, "ptr", subType, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} subType 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    SetPreferredClsid(subType, clsid) {
        result := ComCall(5, this, "ptr", subType, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    IsDisabled(clsid) {
        result := ComCall(6, this, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    GetDisabledByIndex(index, clsid) {
        result := ComCall(7, this, "uint", index, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {BOOL} disabled 
     * @returns {HRESULT} 
     */
    SetDisabled(clsid, disabled) {
        result := ComCall(8, this, "ptr", clsid, "int", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} dllName 
     * @returns {HRESULT} 
     */
    IsLegacyDisabled(dllName) {
        dllName := dllName is String ? StrPtr(dllName) : dllName

        result := ComCall(9, this, "ptr", dllName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
