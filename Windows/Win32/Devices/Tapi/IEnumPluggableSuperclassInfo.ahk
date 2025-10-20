#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumPluggableSuperclassInfo interface provides COM-standard enumeration methods for the ITPluggableTerminalSuperclassInfo interface. The ITTerminalSupport2::EnumeratePluggableSuperclasses method returns a pointer to IEnumPluggableSuperclassInfo.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumpluggablesuperclassinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumPluggableSuperclassInfo extends IUnknown{
    /**
     * The interface identifier for IEnumPluggableSuperclassInfo
     * @type {Guid}
     */
    static IID => Guid("{e9586a80-89e6-4cff-931d-478d5751f4c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ITPluggableTerminalSuperclassInfo>} ppElements 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ppElements, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", ppElements, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPluggableSuperclassInfo>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
