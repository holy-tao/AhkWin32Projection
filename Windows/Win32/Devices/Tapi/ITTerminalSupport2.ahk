#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITTerminalSupport.ahk

/**
 * The ITTerminalSupport2 interface is derived from the ITTerminalSupport interface. ITTerminalSupport2 supports the retrieval of information about pluggable terminal classes and superclasses by C, C++, and scripting applications.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itterminalsupport2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTerminalSupport2 extends ITTerminalSupport{
    /**
     * The interface identifier for ITTerminalSupport2
     * @type {Guid}
     */
    static IID => Guid("{f3eb39bc-1b1f-4e99-a0c0-56305c4dd591}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_PluggableSuperclasses(pVariant) {
        result := ComCall(13, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPluggableSuperclassInfo>} ppSuperclassEnumerator 
     * @returns {HRESULT} 
     */
    EnumeratePluggableSuperclasses(ppSuperclassEnumerator) {
        result := ComCall(14, this, "ptr", ppSuperclassEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTerminalSuperclass 
     * @param {Integer} lMediaType 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_PluggableTerminalClasses(bstrTerminalSuperclass, lMediaType, pVariant) {
        bstrTerminalSuperclass := bstrTerminalSuperclass is String ? BSTR.Alloc(bstrTerminalSuperclass).Value : bstrTerminalSuperclass

        result := ComCall(15, this, "ptr", bstrTerminalSuperclass, "int", lMediaType, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iidTerminalSuperclass 
     * @param {Integer} lMediaType 
     * @param {Pointer<IEnumPluggableTerminalClassInfo>} ppClassEnumerator 
     * @returns {HRESULT} 
     */
    EnumeratePluggableTerminalClasses(iidTerminalSuperclass, lMediaType, ppClassEnumerator) {
        result := ComCall(16, this, "ptr", iidTerminalSuperclass, "int", lMediaType, "ptr", ppClassEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
