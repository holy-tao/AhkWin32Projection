#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITPluggableTerminalClassInfo.ahk
#Include .\IEnumPluggableTerminalClassInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumPluggableTerminalClassInfo interface provides COM-standard enumeration methods for the ITPluggableTerminalClassInfo interface. The ITTerminalSupport2::EnumeratePluggableTerminalClasses method returns a pointer to IEnumPluggableTerminalClassInfo.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumpluggableterminalclassinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumPluggableTerminalClassInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPluggableTerminalClassInfo
     * @type {Guid}
     */
    static IID => Guid("{4567450c-dbee-4e3f-aaf5-37bf9ebf5e29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Reset", "Skip", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {ITPluggableTerminalClassInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumpluggableterminalclassinfo-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ITPluggableTerminalClassInfo(ppElements)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumpluggableterminalclassinfo-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumpluggableterminalclassinfo-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumPluggableTerminalClassInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumpluggableterminalclassinfo-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPluggableTerminalClassInfo(ppEnum)
    }
}
